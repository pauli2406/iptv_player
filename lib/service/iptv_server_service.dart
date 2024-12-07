import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:play_shift/provider/isar/isar_provider.dart';
import 'package:play_shift/service/collections/epg_item.dart';
import 'package:play_shift/service/collections/item_category.dart';
import 'package:play_shift/service/collections/iptv_server/iptv_server.dart';
import 'package:play_shift/service/collections/channel_item.dart';
import 'package:play_shift/service/collections/series_item.dart';
import 'package:play_shift/service/collections/vod_item.dart';
import 'package:play_shift/service/m3u_service.dart';
import 'package:isar/isar.dart';
import 'package:xtream_code_client/xtream_code_client.dart';

class IptvServerService {
  IptvServerService(
    this.isarService,
    this.m3uService,
  ) {
    _progressController = StreamController<String>.broadcast();
  }

  final IsarService isarService;
  final M3uService m3uService;
  late final StreamController<String> _progressController;

  Stream<String> get progressStream => _progressController.stream;

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

  /// Persists a server instance and returns its ID
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

  /// Refreshes server data if forced or last sync was more than 24 hours ago
  Future<void> refreshServerItems({bool? forced}) async {
    try {
      final activeIptvServer = m3uService.getActiveIptvServer()!;
      final date24HoursAgo = DateTime.now().subtract(const Duration(days: 1));

      if (forced != true &&
          activeIptvServer.lastSync != null &&
          !activeIptvServer.lastSync!.isBefore(date24HoursAgo)) {
        return;
      }

      _progressController.add('Fetching server information...');
      final serverInfo = await loadServerInformation();

      _progressController.add('Loading categories...');
      final categories = await Future.wait([
        client.liveStreamCategories(),
        client.vodCategories(),
        client.seriesCategories(),
      ]);

      _progressController.add('Loading VOD items...');
      final vodItems = await client.vodItems();

      _progressController.add('Loading live streams...');
      final liveStreamItems = await client.livestreamItems();

      _progressController.add('Loading series...');
      final seriesItems = await client.seriesItems();

      _progressController.add('Loading EPG data...');
      final epg = await client.epg(useLocalFile: false);

      _progressController.add('Persisting data to database...');
      await isarService.isar.writeTxnSync(() async {
        // Update server info
        activeIptvServer.allowedOutputFormats =
            serverInfo.userInfo.allowedOutputFormats ?? [];
        isarService.isar.iptvServers.putSync(activeIptvServer);

        // Persist categories
        isarService.isar.itemCategorys.putAllSync([
          ...categories[0].map(
              (c) => ItemCategory.fromCategory(c, ItemCategoryType.channel)),
          ...categories[1]
              .map((c) => ItemCategory.fromCategory(c, ItemCategoryType.vod)),
          ...categories[2].map(
              (c) => ItemCategory.fromCategory(c, ItemCategoryType.series)),
        ].map((cat) => cat..iptvServer.value = activeIptvServer).toList());

        // Persist VODs
        isarService.isar.vodItems.putAllSync(
          vodItems
              .map((vod) => VodItem.fromXtreamCodeVodItem(
                    vod,
                    client.movieUrl(vod.streamId!, vod.containerExtension!),
                  )..iptvServer.value = activeIptvServer)
              .toList(),
        );

        // Persist channels
        final channelEntities = liveStreamItems
            .map(
              (channel) => ChannelItem.fromLiveStreamItem(
                channel,
                client.streamUrl(
                    channel.streamId!, activeIptvServer.allowedOutputFormats),
              )..iptvServer.value = activeIptvServer,
            )
            .toList();
        isarService.isar.channelItems.putAllSync(channelEntities);

        // Persist series
        isarService.isar.seriesItems.putAllSync(
          seriesItems
              .map((series) => SeriesItem.fromXtreamCodeSeriesItem(series)
                ..iptvServer.value = activeIptvServer)
              .toList(),
        );

        // Clear old EPG data
        final twoDaysAgo = DateTime.now().subtract(const Duration(days: 2));

        isarService.isar.epgItems
            .filter()
            .iptvServer((q) => q.idEqualTo(activeIptvServer.id))
            .endLessThan(twoDaysAgo)
            .deleteAllSync();

        final epgItems = epg.programmes
            .map((item) =>
                EpgItem.fromProgramme(item, item.channel, activeIptvServer)
                  ..iptvServer.value = activeIptvServer)
            .toList();
        isarService.isar.epgItems.putAllSync(epgItems);

        // Update sync date
        activeIptvServer.lastSync = DateTime.now();
        isarService.isar.iptvServers.putSync(activeIptvServer);
      });

      _progressController.add('Refresh completed successfully');
    } catch (e) {
      _progressController.add('Error: $e');
      debugPrint('Error refreshing server items: $e');
      rethrow;
    }
  }

  Future<XTremeCodeSeriesInfo?> seriesInfo(
      SeriesItem seriesItem, IptvServer activeIptvServer) async {
    final seriesInfo =
        await client.seriesInfo(seriesItem.toXtreamCodeSeriesItem());
    return seriesInfo;
  }

    Future<XTremeCodeVodInfo?> vodInfo(
      VodItem vodItem, IptvServer activeIptvServer) async {
    final vodInfo =
        await client.vodInfo(vodItem.toXtreamCodeVodItem());
    return vodInfo;
  }

  Future<XTremeCodeGeneralInformation> loadServerInformation() async {
    return await client.serverInformation();
  }

  void dispose() {
    _progressController.close();
  }
}
