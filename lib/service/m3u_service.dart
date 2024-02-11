import 'package:iptv_player/provider/isar/isar_provider.dart';
import 'package:iptv_player/service/collections/channel_item.dart';
import 'package:iptv_player/service/collections/epg_item.dart';
import 'package:iptv_player/service/collections/iptv_server/iptv_server.dart';
import 'package:iptv_player/service/collections/item_category.dart';
import 'package:iptv_player/service/collections/series_item.dart';
import 'package:iptv_player/service/collections/vod_item.dart';
import 'package:isar/isar.dart';
import 'package:xtream_code_client/xtream_code_client.dart';

import 'collections/m3u/m3u_item.dart';

final client = XtreamCode.instance.client;

class M3uService {
  M3uService(this.isarService);

  final IsarService isarService;
  IptvServer? _activeIptvServer;

  set activeIptvServer(IptvServer value) {
    _activeIptvServer = value;
    XtreamCode.initialize(
      url: value.url,
      port: value.port,
      username: value.user,
      password: value.password,
    );
  }

  IptvServer? getActiveIptvServer() {
    return _activeIptvServer;
  }

  Future<List<M3UItem>> findAll(Isar isar, IptvServer iptvServer) async {
    return await isar.m3UItems.filter().iptvServer((q) {
      return q.idEqualTo(iptvServer.id);
    }).findAll();
  }

  Stream<List<VodItem>> findAllMovies(IptvServer activeIptvServer,
      String? searchValue, ItemCategory? category) {
    QueryBuilder<VodItem, VodItem, QFilterCondition> query =
        isarService.isar.vodItems.filter().iptvServer((q) {
      return q.idEqualTo(_activeIptvServer!.id);
    });
    if (searchValue != null && searchValue.isNotEmpty) {
      query = query.titleContains(searchValue, caseSensitive: false);
    }
    if (category != null) {
      query = query.categoryIdEqualTo(category.id.toString());
    }
    return query.iptvServer((q) {
      return q.idEqualTo(_activeIptvServer!.id);
    }).watch(fireImmediately: true);
  }

  // Stream<List<M3UItem>> findAllItemsOfSeriesAndSeason(
  //     IptvServer activeIptvServer, String series, String season) {
  //   return isarService.isar.seriesItems
  //       .filter()
  //       .iptvServer((q) {
  //         return q.idEqualTo(_activeIptvServer!.id);
  //       })
  //       .seriesEqualTo(series)
  //       .seasonEqualTo(season)
  //       .watch(fireImmediately: true);
  // }

  Stream<List<M3UItem>> findAllSeasonsOfSeries(
      IptvServer activeIptvServer, String series) {
    return isarService.isar.m3UItems
        .where(distinct: true)
        .filter()
        .iptvServer((q) {
          return q.idEqualTo(_activeIptvServer!.id);
        })
        .nameEqualTo(M3UType.series)
        .seriesEqualTo(series)
        .distinctBySeason()
        .watch(fireImmediately: true);
  }

  Stream<List<SeriesItem>> findAllSeries(IptvServer activeIptvServer,
      String? searchValue, ItemCategory? category) {
    var query = isarService.isar.seriesItems.filter().iptvServer((q) {
      return q.idEqualTo(_activeIptvServer!.id);
    });
    if (searchValue != null && searchValue.isNotEmpty) {
      query = query.nameContains(searchValue, caseSensitive: false);
    }
    if (category != null) {
      query = query.categoryIdEqualTo(category.id.toString());
    }
    return query.sortByName().watch(fireImmediately: true);
  }

  Stream<List<ItemCategory>> findAllSeriesGroups(IptvServer activeIptvServer) {
    return findAllCategoriesOfType(ItemCategoryType.series);
  }

  Stream<List<ItemCategory>> findAllMovieGroups(IptvServer activeIptvServer) {
    return findAllCategoriesOfType(ItemCategoryType.vod);
  }

  Stream<List<ItemCategory>> findAllChannelGroups(IptvServer activeIptvServer) {
    return findAllCategoriesOfType(ItemCategoryType.channel);
  }

  Stream<List<ItemCategory>> findAllCategoriesOfType(ItemCategoryType type) {
    return isarService.isar.itemCategorys
        .where(distinct: true)
        .filter()
        .typeEqualTo(type)
        .sortByCategoryName()
        .watch(fireImmediately: true);
  }

  Stream<List<ChannelItem>> findAllChannels(
      String? searchValue, ItemCategory? category) {
    QueryBuilder<ChannelItem, ChannelItem, QFilterCondition> query =
        isarService.isar.channelItems.filter();
    if (searchValue != null && searchValue.isNotEmpty) {
      query = query.nameContains(searchValue, caseSensitive: false);
    }
    if (category != null) {
      query = query.categoryIdEqualTo(category.id.toString());
    }
    return query.iptvServer((q) {
      return q.idEqualTo(_activeIptvServer!.id);
    }).watch(fireImmediately: true);
  }

  Future<List<M3UItem>> findByCategory(
      String category, IptvServer activeIptvServer) async {
    return await isarService.isar.m3UItems
        .where()
        .groupTitleEqualTo(category)
        .filter()
        .iptvServer((q) {
      return q.idEqualTo(_activeIptvServer!.id);
    }).findAll();
  }

  Future<M3UItem?> findById(Id id) async {
    return await isarService.isar.m3UItems.get(id);
  }

  Future<Id> put(M3UItem server) async {
    return await isarService.isar.writeTxn(() async {
      return await isarService.isar.m3UItems.put(server);
    });
  }

  Future<void> deleteAll() async {
    return await isarService.isar.writeTxn(() async {
      return await isarService.isar.m3UItems.clear();
    });
  }

  Future<bool> delete(Id id) async {
    return await isarService.isar.writeTxn(() async {
      return await isarService.isar.m3UItems.delete(id);
    });
  }

  Future<int> clear() async {
    return await isarService.isar.writeTxn(() async {
      return await isarService.isar.m3UItems.filter().iptvServer((q) {
        return q.idEqualTo(_activeIptvServer!.id);
      }).deleteAll();
    });
  }

  EpgItem? findCurrentEpgItem(ChannelItem channel) {
    var now = DateTime.now();
    if (channel.epgChannelId == null) {
      return null;
    } else {
      return isarService.isar.epgItems
          .filter()
          .iptvServer((q) {
            return q.idEqualTo(_activeIptvServer!.id);
          })
          .channelIdEqualTo(channel.epgChannelId!)
          .startLessThan(now)
          .endGreaterThan(now)
          .findFirstSync();
    }
  }
}
