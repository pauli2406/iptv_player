import 'package:iptv_player/home/provider/search_value_provider.dart';
import 'package:iptv_player/provider/isar/iptv_server_provider.dart';
import 'package:iptv_player/service/collections/epg_item.dart';
import 'package:iptv_player/service/collections/item_category.dart';
import 'package:iptv_player/service/collections/series_episode.dart';
import 'package:iptv_player/service/collections/series_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xtream_code_client/xtream_code_client.dart';

import '../../service/m3u_service.dart';
import 'isar_provider.dart';

part 'm3u_provider.g.dart';

@Riverpod(keepAlive: true)
M3uService m3uService(M3uServiceRef ref) {
  final isar = ref.read(getIsarProvider);
  return M3uService(isar);
}

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
Stream<SeriesItem> findSeries(FindSeriesRef ref, {required int seriesId}) {
  final m3uService = ref.watch(m3uServiceProvider);
  final activeIptvServer = m3uService.getActiveIptvServer()!;
  return m3uService.findSeries(activeIptvServer, seriesId);
}

@riverpod
Stream<SeriesEpisode> findSeriesEpisode(FindSeriesEpisodeRef ref,
    {required int streamId}) {
  final m3uService = ref.watch(m3uServiceProvider);
  final activeIptvServer = m3uService.getActiveIptvServer()!;
  return m3uService.findSeriesEpisode(activeIptvServer, streamId);
}

@riverpod
Stream<List<SeriesItem>> findAllSeries(FindAllSeriesRef ref,
    {ItemCategory? category}) {
  final searchValue = ref.watch(seriesSearchValueProvider);
  final m3uService = ref.watch(m3uServiceProvider);
  final activeIptvServer = m3uService.getActiveIptvServer()!;

  return m3uService.findAllSeries(activeIptvServer, searchValue, category);
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

class ChannelViewModel {
  int? streamId;
  String link, title, logoUrl;
  bool isLive;
  EpgItem? currentEpgItem;
  List<EpgItem> epgItems;

  ChannelViewModel(
    this.streamId,
    this.link,
    this.title,
    this.logoUrl,
    this.isLive,
    this.currentEpgItem,
    this.epgItems,
  );
}

class SeriesViewModel {
  int? streamId;
  String link, title, logoUrl;
  bool isLive;
  EpgItem? currentEpgItem;

  SeriesViewModel(
    this.streamId,
    this.link,
    this.title,
    this.logoUrl,
    this.isLive,
    this.currentEpgItem,
  );
}

@riverpod
ChannelViewModel findMovie(FindMovieRef ref, {required int streamId}) {
  final m3uService = ref.watch(m3uServiceProvider);
  final vod = m3uService.findVod(streamId)!;
  return ChannelViewModel(vod.id, vod.streamUrl, vod.name ?? "",
      vod.streamIcon ?? "", vod.streamType == "live", null, []);
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
Stream<List<ItemCategory>> findAllSeriesGroups(FindAllSeriesGroupsRef ref) {
  final m3uService = ref.watch(m3uServiceProvider);
  final activeIptvServer = m3uService.getActiveIptvServer()!;
  return m3uService.findAllSeriesGroups(activeIptvServer);
}

@riverpod
Stream<List<ItemCategory>> findAllChannelGroups(FindAllChannelGroupsRef ref) {
  final m3uService = ref.watch(m3uServiceProvider);
  final activeIptvServer = m3uService.getActiveIptvServer()!;
  return m3uService.findAllChannelGroups(activeIptvServer);
}

@riverpod
Stream<List<ItemCategory>> findAllMovieGroups(FindAllMovieGroupsRef ref) {
  final m3uService = ref.watch(m3uServiceProvider);
  final activeIptvServer = m3uService.getActiveIptvServer()!;
  return m3uService.findAllMovieGroups(activeIptvServer);
}
