import 'package:play_shift/provider/isar/isar_provider.dart';
import 'package:play_shift/service/collections/channel_item.dart';
import 'package:play_shift/service/collections/epg_item.dart';
import 'package:play_shift/service/collections/iptv_server/iptv_server.dart';
import 'package:play_shift/service/collections/item_category.dart';
import 'package:play_shift/service/collections/series_episode.dart';
import 'package:play_shift/service/collections/series_item.dart';
import 'package:play_shift/service/collections/vod_item.dart';
import 'package:isar/isar.dart';
import 'package:xtream_code_client/xtream_code_client.dart';

final client = XtreamCode.instance.client;

class M3uService {
  M3uService(this.isarService);

  final IsarService isarService;
  IptvServer? _activeIptvServer;

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
        .not()
        .idEqualTo(movie.id)
        .limit(limit)
        .findAllSync();
  }

  List<ChannelItem> findChannelsByEpgTitle(String epgTitle) {
    if (_activeIptvServer == null) {
      return [];
    }

    var currentEpgItems = isarService.isar.epgItems
        .filter()
        .iptvServer((q) => q.idEqualTo(_activeIptvServer!.id))
        .titleEqualTo(epgTitle)
        .findAllSync();

    var channelIds = currentEpgItems.map((e) => e.channelId).toSet();

    return isarService.isar.channelItems
        .filter()
        .iptvServer((q) => q.idEqualTo(_activeIptvServer!.id))
        .anyOf(channelIds,
            (q, String channelId) => q.epgChannelIdEqualTo(channelId))
        .findAllSync();
  }

  Future<void> updateMovieProgress(int movieId, double duration) async {
    await isarService.isar.writeTxn(() async {
      var movie = await isarService.isar.vodItems.get(movieId);
      if (movie != null) {
        movie = VodItem(
          id: movie.id,
          categoryIds: movie.categoryIds,
          streamUrl: movie.streamUrl,
          watchedDuration: duration,
          lastWatched: DateTime.now(),
          num: movie.num,
          name: movie.name,
          title: movie.title,
          year: movie.year,
          streamType: movie.streamType,
          streamIcon: movie.streamIcon,
          rating: movie.rating,
          rating5based: movie.rating5based,
          added: movie.added,
          categoryId: movie.categoryId,
          containerExtension: movie.containerExtension,
          customSid: movie.customSid,
          directSource: movie.directSource,
        );
        await isarService.isar.vodItems.put(movie);
      }
    });
  }

  Future<void> updateSeriesProgress(int seriesId) async {
    await isarService.isar.writeTxn(() async {
      var series = await isarService.isar.seriesItems.get(seriesId);
      if (series != null && series.firstWatched == null) {
        series.firstWatched = DateTime.now();
        await isarService.isar.seriesItems.put(series);
      }
    });
  }

  Future<void> updateEpisodeProgress(int episodeId, double duration) async {
    await isarService.isar.writeTxn(() async {
      var episode = await isarService.isar.seriesEpisodes.get(episodeId);
      if (episode != null) {
        episode.watchedDuration = duration;
        episode.lastWatched = DateTime.now();
        await isarService.isar.seriesEpisodes.put(episode);
      }
    });
  }

  double? getMovieProgress(int movieId) {
    return isarService.isar.vodItems.getSync(movieId)?.watchedDuration;
  }

  bool isSeriesStarted(int seriesId) {
    return isarService.isar.seriesItems.getSync(seriesId)?.firstWatched != null;
  }

  double? getEpisodeProgress(int episodeId) {
    return isarService.isar.seriesEpisodes.getSync(episodeId)?.watchedDuration;
  }

  List<SeriesEpisode> findEpisodesForSeries(int seriesId) {
    return isarService.isar.seriesEpisodes
        .filter()
        .iptvServer((q) => q.idEqualTo(_activeIptvServer!.id))
        .parentSeriesIdEqualTo(seriesId)
        .findAllSync();
  }

  void putEpisodes(List<SeriesEpisode> episodes) {
    isarService.isar.writeTxnSync(() {
      isarService.isar.seriesEpisodes.putAllSync(episodes);
    });
  }
}
