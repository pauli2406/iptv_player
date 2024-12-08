import 'dart:async';

import 'package:play_shift/home/provider/search_value_provider.dart';
import 'package:play_shift/provider/isar/iptv_server_provider.dart';
import 'package:play_shift/provider/isar/isar_provider.dart';
import 'package:play_shift/provider/models/channel_view_model.dart';
import 'package:play_shift/provider/models/movie_view_model.dart';
import 'package:play_shift/service/collections/epg_item.dart';
import 'package:play_shift/service/collections/item_category.dart';
import 'package:play_shift/service/collections/series_episode.dart';
import 'package:play_shift/service/collections/series_item.dart';
import 'package:play_shift/service/m3u_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xtream_code_client/xtream_code_client.dart';

part 'm3u_provider.g.dart';

/// Core service provider
@Riverpod(keepAlive: true)
M3uService m3uService(M3uServiceRef ref) {
  final isar = ref.read(getIsarProvider);
  return M3uService(isar);
}

/// Service operations
@riverpod
Future<bool> clearDownloadAndPersistActivePlaylistItems(
  ClearDownloadAndPersistActivePlaylistItemsRef ref, {
  bool? forced,
}) async {
  final iptvService = ref.watch(iptvServerServiceProvider);
  await iptvService.refreshServerItems(forced: forced);
  ref.notifyListeners();
  return true;
}

/// Channel related providers
@riverpod
Stream<List<ChannelViewModel>> findAllChannels(FindAllChannelsRef ref,
    {ItemCategory? category}) {
  final searchValue = ref.watch(channelSearchValueProvider);
  final m3uService = ref.watch(m3uServiceProvider);

  return m3uService
      .findAllChannels(searchValue, category)
      .asyncMap((channels) async {
    final latestEpgItems = m3uService.epgOfChannels();
    var now = DateTime.now();
    final epgMap = Map.fromEntries(latestEpgItems
        .where((item) =>
            item.start != null &&
            item.end != null &&
            item.start!.isBefore(now) &&
            item.end!.isAfter(now))
        .map((item) => MapEntry(item.channelId, item)));

    return channels.map((e) {
      return ChannelViewModel(
        e.id,
        e.streamUrl,
        e.name ?? "",
        e.streamIcon ?? "",
        e.streamType == "live",
        epgMap[e.epgChannelId],
        [],
      );
    }).toList();
  });
}

@riverpod
ChannelViewModel findChannel(FindChannelRef ref, {required int streamId}) {
  final m3uService = ref.watch(m3uServiceProvider);
  final channel = m3uService.findChannel(streamId)!;
  var now = DateTime.now();
  EpgItem? latestEpgItem;
  List<EpgItem> epgItems = [];

  if (channel.epgChannelId != null) {
    epgItems = m3uService.epgOfChannel(channel.epgChannelId!);
    if (epgItems.isNotEmpty) {
      latestEpgItem = epgItems.firstWhere(
        (item) =>
            item.start != null &&
            item.end != null &&
            item.start!.isBefore(now) &&
            item.end!.isAfter(now),
        orElse: () => epgItems.first,
      );
    }
  }

  return ChannelViewModel(
    channel.id,
    channel.streamUrl,
    channel.name ?? "",
    channel.streamIcon ?? "",
    channel.streamType == "live",
    latestEpgItem,
    epgItems,
  );
}

@riverpod
List<ChannelViewModel> findAlternativeChannels(
  FindAlternativeChannelsRef ref,
  String epgTitle,
  int currentChannelId,
) {
  final m3uService = ref.watch(m3uServiceProvider);
  final channels = m3uService.findChannelsByEpgTitle(epgTitle);
  
  return channels
      .where((channel) => channel.id != currentChannelId)
      .map((channel) {
        final currentEpg = m3uService.findCurrentEpgItem(channel);
        return ChannelViewModel(
          channel.id,
          channel.streamUrl,
          channel.name ?? "",
          channel.streamIcon ?? "",
          channel.streamType == "live",
          currentEpg,
          [],
        );
      })
      .toList();
}

@riverpod
Stream<List<ItemCategory>> findAllChannelGroups(FindAllChannelGroupsRef ref) {
  final m3uService = ref.watch(m3uServiceProvider);
  final activeIptvServer = m3uService.getActiveIptvServer()!;
  return m3uService.findAllChannelGroups(activeIptvServer);
}

/// Movie related providers
@riverpod
Stream<List<ChannelViewModel>> findAllMovies(FindAllMoviesRef ref,
    {ItemCategory? category}) {
  final searchValue = ref.watch(movieSearchValueProvider);
  final activeIptvServer = ref.watch(m3uServiceProvider).getActiveIptvServer()!;

  final m3uService = ref.watch(m3uServiceProvider);

  return m3uService
      .findAllMovies(activeIptvServer, searchValue, category)
      .asyncMap((event) async {
    return event.map((e) {
      return ChannelViewModel(
        e.id,
        e.streamUrl,
        e.name ?? "",
        e.streamIcon ?? "",
        e.streamType == "live",
        null,
        [],
      );
    }).toList();
  });
}

@riverpod
MovieViewModel findMovie(FindMovieRef ref, {required int streamId}) {
  final m3uService = ref.watch(m3uServiceProvider);
  final vod = m3uService.findVod(streamId)!;
  return MovieViewModel(
    streamId: vod.id,
    streamUrl: vod.streamUrl,
    title: vod.name ?? "",
    streamIcon: vod.streamIcon ?? "",
    year: vod.year,
    rating: vod.rating,
    rating5based: vod.rating5based,
    added: vod.added,
    containerExtension: vod.containerExtension,
    directSource: vod.directSource,
  );
}

@riverpod
Future<XTremeCodeVodInfo?> findMovieDetail(FindMovieDetailRef ref,
    {required int vodId}) async {
  final iptvServerService = ref.watch(iptvServerServiceProvider);
  final activeIptvServer = ref.watch(m3uServiceProvider).getActiveIptvServer()!;
  final m3uService = ref.watch(m3uServiceProvider);
  final vod = m3uService.findVod(vodId)!;
  return await iptvServerService.vodInfo(vod, activeIptvServer);
}

@riverpod
Stream<List<ItemCategory>> findAllMovieGroups(FindAllMovieGroupsRef ref) {
  final m3uService = ref.watch(m3uServiceProvider);
  final activeIptvServer = m3uService.getActiveIptvServer()!;
  return m3uService.findAllMovieGroups(activeIptvServer);
}

@riverpod
List<MovieViewModel> findRelatedMovies(FindRelatedMoviesRef ref, {required int streamId}) {
  final m3uService = ref.watch(m3uServiceProvider);
  final vod = m3uService.findVod(streamId);
  
  if (vod == null) return [];
  
  final relatedMovies = m3uService.findRelatedMovies(vod);
  
  return relatedMovies.map((e) => MovieViewModel(
    streamId: e.id,
    streamUrl: e.streamUrl,
    title: e.name ?? "",
    streamIcon: e.streamIcon ?? "",
    year: e.year,
    rating: e.rating,
    rating5based: e.rating5based,
    added: e.added,
    containerExtension: e.containerExtension,
    directSource: e.directSource,
  )).toList();
}

/// Series related providers
@riverpod
Stream<List<SeriesItem>> findAllSeries(FindAllSeriesRef ref,
    {ItemCategory? category}) {
  final searchValue = ref.watch(seriesSearchValueProvider);
  final m3uService = ref.watch(m3uServiceProvider);
  final activeIptvServer = m3uService.getActiveIptvServer()!;

  return m3uService.findAllSeries(activeIptvServer, searchValue, category);
}

@riverpod
Stream<SeriesItem> findSeries(FindSeriesRef ref, {required int seriesId}) {
  final m3uService = ref.watch(m3uServiceProvider);
  final activeIptvServer = m3uService.getActiveIptvServer()!;
  return m3uService.findSeries(activeIptvServer, seriesId);
}

@riverpod
Future<XTremeCodeSeriesInfo?> findSeriesInfo(FindSeriesInfoRef ref,
    {required int seriesId}) async {
  final iptvServerService = ref.watch(iptvServerServiceProvider);
  final activeIptvServer = ref.watch(m3uServiceProvider).getActiveIptvServer()!;
  final m3uService = ref.watch(m3uServiceProvider);
  final series = m3uService.findSeriesSync(activeIptvServer, seriesId)!;
  return await iptvServerService.seriesInfo(series, activeIptvServer);
}

@riverpod
Future<List<ChannelViewModel>> findAllSeriesEpisodes(
  FindAllSeriesEpisodesRef ref, {
  required int seriesId,
  ItemCategory? season,
}) async {
  final m3uService = ref.watch(m3uServiceProvider);
  final iptvServerService = ref.watch(iptvServerServiceProvider);
  final activeIptvServer = m3uService.getActiveIptvServer()!;
  final series = m3uService.findSeriesSync(activeIptvServer, seriesId)!;
  final seriesInfo =
      await iptvServerService.seriesInfo(series, activeIptvServer);

  final List<SeriesEpisode> episodes;
  if (season != null) {
    episodes = seriesInfo?.episodes?[season.id.toString()]!.map((e) {
          return SeriesEpisode.fromXtreamCodeSeriesEpisode(
            e,
            client.seriesUrl(
              e.id!,
              e.containerExtension!,
            ),
          );
        }).toList() ??
        [];
  } else {
    episodes = seriesInfo?.episodes?.values.expand((x) => x).map((e) {
          return SeriesEpisode.fromXtreamCodeSeriesEpisode(
            e,
            client.seriesUrl(
              e.id!,
              e.containerExtension!,
            ),
          );
        }).toList() ??
        [];
  }

  final sortedEpisodes = episodes.toList()
    ..sort((a, b) => a.episodeNum!.compareTo(b.episodeNum!));

  return sortedEpisodes.map((e) {
    return ChannelViewModel(
      e.id,
      e.streamUrl,
      e.title ?? "",
      e.coverBig ?? "",
      false,
      null,
      [],
    );
  }).toList();
}

@riverpod
Stream<List<ItemCategory>> findAllSeriesGroups(FindAllSeriesGroupsRef ref) {
  final m3uService = ref.watch(m3uServiceProvider);
  final activeIptvServer = m3uService.getActiveIptvServer()!;
  return m3uService.findAllSeriesGroups(activeIptvServer);
}
