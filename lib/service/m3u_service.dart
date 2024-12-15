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

  // MARK: - Server Management
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

  // MARK: - Category Methods
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

  // MARK: - Channel and EPG Methods
  Stream<List<ChannelItem>> findAllChannels(
      String? searchValue, ItemCategory? category) {
    if (_activeIptvServer == null) {
      throw StateError('No active IPTV server selected');
    }
    var query = isarService.isar.collection<ChannelItem>().filter();

    if (searchValue?.isNotEmpty ?? false) {
      query = query.nameContains(searchValue!, caseSensitive: false);
    }
    if (category != null) {
      if (category.categoryName == "Favorites") {
        query = query.isFavoriteEqualTo(true);
      } else {
        query = query.categoryIdEqualTo(category.id);
      }
    }

    return query.iptvServer((q) {
      return q.idEqualTo(_activeIptvServer!.id);
    }).watch(fireImmediately: true);
  }

  ChannelItem? findChannel(int streamId) {
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

  List<ChannelItem> findChannelsByEpgTitle(String epgTitle) {
    if (_activeIptvServer == null) {
      return [];
    }

    final now = DateTime.now();
    var currentEpgItems = isarService.isar.epgItems
        .filter()
        .iptvServer((q) => q.idEqualTo(_activeIptvServer!.id))
        .titleEqualTo(epgTitle)
        .startLessThan(now)
        .and()
        .endGreaterThan(now)
        .findAllSync();

    var channelIds = currentEpgItems.map((e) => e.channelId).toSet();

    return isarService.isar.channelItems
        .filter()
        .iptvServer((q) => q.idEqualTo(_activeIptvServer!.id))
        .anyOf(channelIds,
            (q, String channelId) => q.epgChannelIdEqualTo(channelId))
        .findAllSync();
  }

  // MARK: - VOD (Movies) Methods
  Stream<List<VodItem>> findAllMovies(IptvServer activeIptvServer,
      String? searchValue, ItemCategory? category) {
    QueryBuilder<VodItem, VodItem, QFilterCondition> query =
        isarService.isar.vodItems.filter();
    if (searchValue != null && searchValue.isNotEmpty) {
      query = query.titleContains(searchValue, caseSensitive: false);
    }
    if (category != null) {
      if (category.categoryName == "Favorites") {
        query = query.isFavoriteEqualTo(true);
      } else {
        query = query.categoryIdEqualTo(category.id);
      }
    }
    return query.iptvServer((q) {
      return q.idEqualTo(_activeIptvServer!.id);
    }).watch(fireImmediately: true);
  }

  VodItem? findVod(int streamId) {
    QueryBuilder<VodItem, VodItem, QFilterCondition> query =
        isarService.isar.vodItems.filter();
    query = query.idEqualTo(streamId);
    return query.iptvServer((q) {
      return q.idEqualTo(_activeIptvServer!.id);
    }).findFirstSync();
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

  // MARK: - Series Methods
  Stream<List<SeriesItem>> findAllSeries(IptvServer activeIptvServer,
      String? searchValue, ItemCategory? category) {
    QueryBuilder<SeriesItem, SeriesItem, QFilterCondition> query =
        isarService.isar.seriesItems.filter();
    if (searchValue != null && searchValue.isNotEmpty) {
      query = query.titleContains(searchValue, caseSensitive: false);
    }
    if (category != null) {
      if (category.categoryName == "Favorites") {
        query = query.isFavoriteEqualTo(true);
      } else {
        query = query.categoryIdEqualTo(category.id);
      }
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

  Future<void> updateLastWatchedEpisode(int seriesId, int episodeId) async {
    await isarService.isar.writeTxn(() async {
      var series = await isarService.isar.seriesItems.get(seriesId);
      if (series != null) {
        series.lastWatchedEpisodeId = episodeId;
        await isarService.isar.seriesItems.put(series);
      }
    });
  }

  SeriesEpisode? getLastWatchedEpisode(int seriesId) {
    var series = isarService.isar.seriesItems.getSync(seriesId);
    if (series?.lastWatchedEpisodeId == null) {
      return null;
    }
    return isarService.isar.seriesEpisodes
        .getSync(series!.lastWatchedEpisodeId!);
  }

  // MARK: - Progress Tracking Methods
  Future<void> updateMovieProgress(int movieId, double duration) async {
    await isarService.isar.writeTxn(() async {
      var movie = await isarService.isar.vodItems.get(movieId);
      if (movie != null) {
        movie.watchedDuration = duration;
        movie.lastWatched = DateTime.now();
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

  // Favorite methods
  Future<void> toggleChannelFavorite(int channelId) async {
    await isarService.isar.writeTxn(() async {
      var channel = await isarService.isar.channelItems.get(channelId);
      if (channel != null) {
        channel.isFavorite = !channel.isFavorite;
        await isarService.isar.channelItems.put(channel);
      }
    });
  }

  Future<void> toggleMovieFavorite(int movieId) async {
    await isarService.isar.writeTxn(() async {
      var movie = await isarService.isar.vodItems.get(movieId);
      if (movie != null) {
        movie.isFavorite = !movie.isFavorite;
        await isarService.isar.vodItems.put(movie);
      }
    });
  }

  Future<void> toggleSeriesFavorite(int seriesId) async {
    await isarService.isar.writeTxn(() async {
      var series = await isarService.isar.seriesItems.get(seriesId);
      if (series != null) {
        series.isFavorite = !series.isFavorite;
        await isarService.isar.seriesItems.put(series);
      }
    });
  }

  Stream<List<ChannelItem>> getFavoriteChannels() {
    return isarService.isar.channelItems
        .filter()
        .iptvServer((q) => q.idEqualTo(_activeIptvServer!.id))
        .isFavoriteEqualTo(true)
        .watch(fireImmediately: true);
  }

  Stream<List<VodItem>> getFavoriteMovies() {
    return isarService.isar.vodItems
        .filter()
        .iptvServer((q) => q.idEqualTo(_activeIptvServer!.id))
        .isFavoriteEqualTo(true)
        .watch(fireImmediately: true);
  }

  Stream<List<SeriesItem>> getFavoriteSeries() {
    return isarService.isar.seriesItems
        .filter()
        .iptvServer((q) => q.idEqualTo(_activeIptvServer!.id))
        .isFavoriteEqualTo(true)
        .watch(fireImmediately: true);
  }

  Stream<bool> isChannelFavorite(int channelId) {
    return isarService.isar.channelItems
        .filter()
        .idEqualTo(channelId)
        .watch(fireImmediately: true)
        .map((channels) => channels.firstOrNull?.isFavorite ?? false);
  }

  Stream<bool> isMovieFavorite(int movieId) {
    return isarService.isar.vodItems
        .filter()
        .idEqualTo(movieId)
        .watch(fireImmediately: true)
        .map((movies) => movies.firstOrNull?.isFavorite ?? false);
  }

  Stream<bool> isSeriesFavorite(int seriesId) {
    return isarService.isar.seriesItems
        .filter()
        .idEqualTo(seriesId)
        .watch(fireImmediately: true)
        .map((series) => series.firstOrNull?.isFavorite ?? false);
  }
}
