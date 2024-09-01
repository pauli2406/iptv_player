import 'package:flutter/foundation.dart';
import 'package:iptv_player/provider/isar/isar_provider.dart';
import 'package:iptv_player/service/collections/epg_item.dart';
import 'package:iptv_player/service/collections/item_category.dart';
import 'package:iptv_player/service/collections/iptv_server/iptv_server.dart';
import 'package:iptv_player/service/collections/channel_item.dart';
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
          serverInformation.userInfo.allowedOutputFormats ?? [];
      await put(activeIptvServer);
      await _persistCategories(activeIptvServer);
      await _persistItems(activeIptvServer);
      await setLastSyncDate(activeIptvServer);
    }
  }

  Future<void> _persistItems(IptvServer activeIptvServer) async {
    debugPrint("Loading VODs...");
    await _persistVods(activeIptvServer);
    debugPrint("Loading channels...");
    final liveStreamEntities = await _persistChannels(activeIptvServer);
    // debugPrint("Loading series...");
    // await _persistSeries(activeIptvServer);
    _persistEpgForChannels(activeIptvServer, liveStreamEntities);
  }

  // Future<void> _persistSeries(IptvServer activeIptvServer) async {
  //   final seriesItems = await client.seriesItems();
  //   final seriesEntities = await Future.wait(
  //     seriesItems.map(
  //       (series) async {
  //         final item = SeriesItem.fromXtreamCodeSeriesItem(
  //           series,
  //         );
  //         isarService.isar.writeTxnSync(() async {
  //           final series = isarService.isar.seriesItems
  //               .where()
  //               .idEqualTo(item.id)
  //               .findFirstSync();
  //           series?.episodes.clear();
  //           series?.seasons.clear();
  //           isarService.isar.seriesItems.putSync(item);
  //         });
  //         try {
  //           final seriesInfo = await client.seriesInfo(series);
  //           final episodes = seriesInfo.episodes?.values
  //               .expand((x) => x)
  //               .map(
  //                 (e) => SeriesEpisode.fromXtreamCodeSeriesEpisode(
  //                   e,
  //                   client.seriesUrl(
  //                     int.parse(e.id),
  //                     e.containerExtension,
  //                   ),
  //                 ),
  //               )
  //               .toList();
  //           item.info.value =
  //               SeriesInfo.fromXTremeCodeSeriesInfo(seriesInfo.info);
  //           item.seasons.addAll(
  //             seriesInfo.seasons
  //                 .map(
  //                   (season) => SeriesSeason.fromXtreamCodeSeriesSeason(
  //                     season,
  //                   ),
  //                 )
  //                 .toList(),
  //           );
  //           item.episodes.addAll(
  //             episodes ?? [],
  //           );
  //         } catch (_) {}
  //         return item;
  //       },
  //     ).toList(),
  //   );
  //   isarService.isar.writeTxnSync(() async {
  //     isarService.isar.seriesItems.putAllSync(
  //       seriesEntities,
  //     );
  //   });
  //   debugPrint("Persisted ${seriesEntities.length} series.");
  // }

  Future<void> _persistVods(IptvServer activeIptvServer) async {
    final vodItems = await client.vodItems();
    isarService.isar.writeTxnSync(() async {
      isarService.isar.vodItems.putAllSync(
        vodItems
            .map(
              (vod) => VodItem.fromXtreamCodeVodItem(
                vod,
                client.movieUrl(vod.streamId!, vod.containerExtension!),
              )..iptvServer.value = activeIptvServer,
            )
            .toList(),
      );
    });
  }

  Future<List<ChannelItem>> _persistChannels(
      IptvServer activeIptvServer) async {
    final liveStreamItems = await client.livestreamItems();
    final liveStreamEntities = liveStreamItems
        .map(
          (channel) => ChannelItem.fromLiveStreamItem(
            channel,
            client.streamUrl(
                channel.streamId!, activeIptvServer.allowedOutputFormats),
          )..iptvServer.value = activeIptvServer,
        )
        .toList();
    isarService.isar.writeTxnSync(() async {
      isarService.isar.channelItems.putAllSync(liveStreamEntities);
    });
    return liveStreamEntities;
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
    debugPrint("Persisted ${liveStreamCategories.length} categories.");
    debugPrint("Loading VOD categories...");
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
    debugPrint("Persisted ${vodCategories.length} VOD categories.");
    debugPrint("Loading Series categories...");
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

  Future<void> _persistEpgForChannels(
      IptvServer activeIptvServer, List<ChannelItem> channels) async {
    debugPrint("Start persisting EPG for channels ${channels.length}");
    try {
      debugPrint("Download EPG");
      final epg = await client.epg(useLocalFile: false);
      debugPrint("Downloaded EPG successfully");
      isarService.isar.writeTxnSync(() {
        isarService.isar.epgItems
            .filter()
            .iptvServer((q) => q.idEqualTo(activeIptvServer.id))
            .deleteAllSync();
        debugPrint("Cleared existing EPG");
        var items = epg.programmes
            .map((item) =>
                EpgItem.fromProgramme(item, item.channel, activeIptvServer)
                  ..iptvServer.value = activeIptvServer)
            .toList();
        isarService.isar.epgItems.putAllSync(items);
        debugPrint("Finished persisting EPG data");
      });
    } catch (e) {
      debugPrint("Error fetching or processing EPG data: $e");
    }
  }

  Future<XTremeCodeGeneralInformation> loadServerInformation() async {
    return await client.serverInformation();
  }
}
