import 'package:play_shift/provider/isar/isar_provider.dart';
import 'package:play_shift/service/collections/channel_item.dart';
import 'package:play_shift/service/collections/epg_item.dart';
import 'package:play_shift/service/collections/iptv_server/iptv_server.dart';
import 'package:play_shift/service/collections/item_category.dart';
import 'package:play_shift/service/collections/series_item.dart';
import 'package:play_shift/service/collections/vod_item.dart';
import 'package:isar/isar.dart';
import 'package:xtream_code_client/xtream_code_client.dart';

final client = XtreamCode.instance.client;

class M3uService {
  M3uService(this.isarService);

  final IsarService isarService;
  IptvServer? _activeIptvServer;

  // Improved error handling for server initialization
  void setActiveIptvServer(IptvServer value) {
    try {
      _activeIptvServer = value;
      XtreamCode.initialize(
        url: value.url,
        port: value.port,
        username: value.user,
        password: value.password,
      );
    } catch (e) {
      throw Exception('Failed to initialize IPTV server: $e');
    }
  }

  void disposeXtreamCodeClient() {
    XtreamCode.instance.dispose();
  }

  IptvServer? getActiveIptvServer() {
    return _activeIptvServer;
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
      query = query.categoryIdEqualTo(category.id);
    }
    return query.iptvServer((q) {
      return q.idEqualTo(_activeIptvServer!.id);
    }).watch(fireImmediately: true);
  }

  Stream<List<SeriesItem>> findAllSeries(IptvServer activeIptvServer,
      String? searchValue, ItemCategory? category) {
    QueryBuilder<SeriesItem, SeriesItem, QFilterCondition> query =
        isarService.isar.seriesItems.filter().iptvServer((q) {
      return q.idEqualTo(_activeIptvServer!.id);
    });
    if (searchValue != null && searchValue.isNotEmpty) {
      query = query.titleContains(searchValue, caseSensitive: false);
    }
    if (category != null) {
      query = query.categoryIdEqualTo(category.id);
    }
    return query.iptvServer((q) {
      return q.idEqualTo(_activeIptvServer!.id);
    }).watch(fireImmediately: true);
  }

  Stream<SeriesItem> findSeries(IptvServer activeIptvServer, int seriesId) {
    QueryBuilder<SeriesItem, SeriesItem, QFilterCondition> query =
        isarService.isar.seriesItems.filter().iptvServer((q) {
      return q.idEqualTo(_activeIptvServer!.id);
    });
    return query
        .idEqualTo(seriesId)
        .watch(fireImmediately: true)
        .map((event) => event.first);
  }

  SeriesItem? findSeriesSync(IptvServer activeIptvServer, int seriesId) {
    QueryBuilder<SeriesItem, SeriesItem, QFilterCondition> query =
        isarService.isar.seriesItems.filter().iptvServer((q) {
      return q.idEqualTo(_activeIptvServer!.id);
    });
    return query.idEqualTo(seriesId).findFirstSync();
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
        .iptvServer((q) {
          return q.idEqualTo(_activeIptvServer!.id);
        })
        .typeEqualTo(type)
        .sortByCategoryName()
        .watch(fireImmediately: true);
  }

  VodItem? findVod(
    int streamId,
  ) {
    QueryBuilder<VodItem, VodItem, QFilterCondition> query =
        isarService.isar.vodItems.filter();
    query = query.idEqualTo(streamId);
    return query.iptvServer((q) {
      return q.idEqualTo(_activeIptvServer!.id);
    }).findFirstSync();
  }

  ChannelItem? findChannel(
    int streamId,
  ) {
    QueryBuilder<ChannelItem, ChannelItem, QFilterCondition> query =
        isarService.isar.channelItems.filter();
    query = query.idEqualTo(streamId);
    return query.iptvServer((q) {
      return q.idEqualTo(_activeIptvServer!.id);
    }).findFirstSync();
  }

  List<EpgItem> epgOfChannel(String epgChannelId) {
    QueryBuilder<EpgItem, EpgItem, QFilterCondition> query =
        isarService.isar.epgItems.filter();
    query = query.channelIdEqualTo(epgChannelId);
    return query.iptvServer((q) {
      return q.idEqualTo(_activeIptvServer!.id);
    }).findAllSync();
  }

  // Optimized EPG query with caching
  List<EpgItem> epgOfChannels() {
    if (_activeIptvServer == null) {
      throw StateError('No active IPTV server selected');
    }
    var query = isarService.isar.collection<EpgItem>().filter().iptvServer((q) {
      return q.idEqualTo(_activeIptvServer!.id);
    });

    final now = DateTime.now();
    return query.startLessThan(now).and().endGreaterThan(now).findAllSync();
  }

  // Improved channel search with combined filters
  Stream<List<ChannelItem>> findAllChannels(
      String? searchValue, ItemCategory? category) {
    if (_activeIptvServer == null) {
      throw StateError('No active IPTV server selected');
    }
    var query =
        isarService.isar.collection<ChannelItem>().filter().iptvServer((q) {
      return q.idEqualTo(_activeIptvServer!.id);
    });

    if (searchValue?.isNotEmpty ?? false) {
      query = query.nameContains(searchValue!, caseSensitive: false);
    }
    if (category != null) {
      query = query.categoryIdEqualTo(category.id);
    }

    return query.watch(fireImmediately: true);
  }

  EpgItem? findCurrentEpgItem(ChannelItem channel) {
    if (channel.epgChannelId == null) {
      return null;
    } else {
      return isarService.isar.epgItems
          .filter()
          .iptvServer((q) {
            return q.idEqualTo(_activeIptvServer!.id);
          })
          .channelIdEqualTo(channel.epgChannelId!)
          .findFirstSync();
    }
  }

  List<VodItem> findRelatedMovies(VodItem movie, {int limit = 6}) {
    if (_activeIptvServer == null || movie.categoryId == null) {
      return [];
    }

    return isarService.isar.vodItems
        .filter()
        .iptvServer((q) => q.idEqualTo(_activeIptvServer!.id))
        .categoryIdEqualTo(movie.categoryId!)
        .not().idEqualTo(movie.id)
        .limit(limit)
        .findAllSync();
  }
}
