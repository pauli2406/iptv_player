import 'package:iptv_player/provider/isar/isar_provider.dart';
import 'package:iptv_player/service/collections/epg_item.dart';
import 'package:iptv_player/service/collections/item_category.dart';
import 'package:iptv_player/service/collections/iptv_server/iptv_server.dart';
import 'package:iptv_player/service/collections/channel_item.dart';
import 'package:iptv_player/service/collections/series_item.dart';
import 'package:iptv_player/service/collections/vod_item.dart';
import 'package:iptv_player/service/m3u_parse_service.dart';
import 'package:iptv_player/service/m3u_service.dart';
import 'package:isar/isar.dart';
import 'package:xtream_code_client/xtream_code_client.dart';

class IptvServerService {
  IptvServerService(
    this.isarService,
    this.m3uService,
    this.m3uParseService,
  );

  final IsarService isarService;
  final M3uService m3uService;
  final M3uParseService m3uParseService;

  Future<List<IptvServer>> findAll() async {
    var items = await isarService.isar.iptvServers.where().findAll();
    return items;
  }

  Stream<List<IptvServer>> findAllStream() {
    return isarService.isar.iptvServers.where().watch(fireImmediately: true);
  }

  Future<IptvServer?> findById(Id id) async {
    return await isarService.isar.iptvServers.get(id);
  }

  Stream<IptvServer?> findByIdStream(Id id) {
    return isarService.isar.iptvServers.watchObject(id, fireImmediately: true);
  }

  Future<Id> put(IptvServer server) async {
    return await isarService.isar.writeTxn(() async {
      return await isarService.isar.iptvServers.put(server);
    });
  }

  Future<bool> delete(Id id) async {
    return await isarService.isar.writeTxn(() async {
      return await isarService.isar.iptvServers.delete(id);
    });
  }

  Future<Id> setLastSyncDate(IptvServer server) async {
    server.lastSync = DateTime.now();
    return await put(server);
  }

  Future<void> refreshServerItems({bool? forced}) async {
    final activeIptvServer = m3uService.getActiveIptvServer()!;
    final date24HoursAgo = DateTime.now().subtract(
      const Duration(days: 1),
    );
    if (forced == true ||
        activeIptvServer.lastSync == null ||
        activeIptvServer.lastSync!.isBefore(date24HoursAgo)) {
      final serverInformation = await loadServerInformation();
      activeIptvServer.allowedOutputFormats =
          serverInformation.userInfo.allowedOutputFormats;
      await put(activeIptvServer);
      await _persistCategories(activeIptvServer);
      await _persistItems(activeIptvServer);
      await setLastSyncDate(activeIptvServer);
    }
  }

  Future<void> _persistItems(IptvServer activeIptvServer) async {
    await _persistChannels(activeIptvServer);
    await _persistVods(activeIptvServer);
    await _persistSeries(activeIptvServer);
  }

  Future<void> _persistSeries(IptvServer activeIptvServer) async {
    final seriesItems = await client.seriesItems();
    isarService.isar.writeTxnSync(() async {
      isarService.isar.seriesItems.putAllSync(
        seriesItems
            .map(
              (series) => SeriesItem.fromXtreamCodeSeriesItem(
                series,
                client.streamUrl(
                    series.seriesId, activeIptvServer.allowedOutputFormats),
              )..iptvServer.value = activeIptvServer,
            )
            .toList(),
      );
    });
  }

  Future<void> _persistVods(IptvServer activeIptvServer) async {
    final vodItems = await client.vodItems();
    isarService.isar.writeTxnSync(() async {
      isarService.isar.vodItems.putAllSync(
        vodItems
            .map(
              (vod) => VodItem.fromXtreamCodeVodItem(
                vod,
                client.streamUrl(
                    vod.streamId, activeIptvServer.allowedOutputFormats),
              )..iptvServer.value = activeIptvServer,
            )
            .toList(),
      );
    });
  }

  Future<void> _persistChannels(IptvServer activeIptvServer) async {
    final liveStreamItems = await client.livestreamItems();
    isarService.isar.writeTxnSync(() async {
      isarService.isar.channelItems.putAllSync(
        liveStreamItems
            .map(
              (channel) => ChannelItem.fromLiveStreamItem(
                channel,
                client.streamUrl(
                    channel.streamId, activeIptvServer.allowedOutputFormats),
              )..iptvServer.value = activeIptvServer,
            )
            .toList(),
      );
    });
    _persistEpgForChannels(activeIptvServer, liveStreamItems);
  }

  Future<void> _persistCategories(IptvServer activeIptvServer) async {
    final liveStreamCategories = await client.liveStreamCategories();
    isarService.isar.writeTxnSync(() async {
      isarService.isar.itemCategorys.putAllSync(
        liveStreamCategories
            .map(
              (category) => ItemCategory.fromCategory(
                category,
                ItemCategoryType.channel,
              )..iptvServer.value = activeIptvServer,
            )
            .toList(),
      );
    });

    final vodCategories = await client.vodCategories();
    isarService.isar.writeTxnSync(() async {
      isarService.isar.itemCategorys.putAllSync(
        vodCategories
            .map(
              (category) => ItemCategory.fromCategory(
                category,
                ItemCategoryType.vod,
              )..iptvServer.value = activeIptvServer,
            )
            .toList(),
      );
    });

    final seriesCategories = await client.seriesCategories();
    isarService.isar.writeTxnSync(() async {
      isarService.isar.itemCategorys.putAllSync(
        seriesCategories
            .map(
              (category) => ItemCategory.fromCategory(
                category,
                ItemCategoryType.series,
              )..iptvServer.value = activeIptvServer,
            )
            .toList(),
      );
    });
  }

  Future<void> _persistEpgForChannels(IptvServer activeIptvServer,
      List<XTremeCodeLiveStreamItem> channels) async {
    print("Start persisting EPG for channels ${channels.length}");
    List<XTremeCodeEpgListing> epgItems = [];
    var count = 0;
    for (var channel in channels) {
      try {
        final epg = await client.channelEpg(
          channel,
          20,
        );
        epgItems.addAll(epg.epgListings);
        print(
            "Loaded EPG for channel ${channel.name} with ${epg.epgListings.length} items.");
      } on XTreamCodeClientException {
        print("Failed to load EPG for channel ${channel.name}. Continuing...");
      }
      count++;
      print("Loaded EPG for $count channels from ${channels.length} channels.");
    }

    isarService.isar.writeTxnSync(() async => {
          isarService.isar.epgItems.putAllSync(
            epgItems
                .map((epg) => EpgItem.fromXtreamCodeEpgItem(
                      epg,
                    )..iptvServer.value = activeIptvServer)
                .toList(),
          )
        });
  }

  Future<XTremeCodeGeneralInformation> loadServerInformation() async {
    return await client.serverInformation();
  }
}
