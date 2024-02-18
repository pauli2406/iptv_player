import 'package:iptv_player/home/provider/search_value_provider.dart';
import 'package:iptv_player/provider/isar/iptv_server_provider.dart';
import 'package:iptv_player/service/collections/epg_item.dart';
import 'package:iptv_player/service/collections/item_category.dart';
import 'package:iptv_player/service/collections/m3u/m3u_item.dart';
import 'package:iptv_player/service/collections/series_item.dart';
import 'package:iptv_player/service/collections/vod_item.dart';
import 'package:iptv_player/service/m3u_parse_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../service/m3u_service.dart';
import 'isar_provider.dart';

part 'm3u_provider.g.dart';

@Riverpod(keepAlive: true)
M3uService m3uService(M3uServiceRef ref) {
  final isar = ref.read(getIsarProvider);
  return M3uService(isar);
}

@Riverpod(keepAlive: true)
M3uParseService m3uParseService(M3uParseServiceRef ref) {
  final isar = ref.read(getIsarProvider);
  return M3uParseService(isar);
}

@riverpod
Future<bool> clearDownloadAndPersistActivePlaylistItems(
  ClearDownloadAndPersistActivePlaylistItemsRef ref, {
  bool? forced,
}) async {
  final iptvService = ref.watch(iptvServerServiceProvider);
  await iptvService.refreshServerItems(forced: forced);
  return true;
}

@riverpod
Stream<List<VodItem>> findAllMovies(FindAllMoviesRef ref,
    {ItemCategory? category}) {
  final searchValue = ref.watch(movieSearchValueProvider);
  final activeIptvServer = ref.watch(m3uServiceProvider).getActiveIptvServer()!;

  final m3uService = ref.watch(m3uServiceProvider);
  return m3uService.findAllMovies(activeIptvServer, searchValue, category);
}

@riverpod
Stream<List<SeriesItem>> findAllSeries(FindAllSeriesRef ref,
    {ItemCategory? category}) {
  final searchValue = ref.watch(seriesSearchValueProvider);
  final m3uService = ref.watch(m3uServiceProvider);
  final activeIptvServer = m3uService.getActiveIptvServer()!;

  return m3uService.findAllSeries(activeIptvServer, searchValue, category);
}

class ChannelViewModel {
  int? streamId;
  String link, title, logoUrl;
  bool isLive;
  EpgItem? currentEpgItem;

  ChannelViewModel(
    this.streamId,
    this.link,
    this.title,
    this.logoUrl,
    this.isLive,
    this.currentEpgItem,
  );
}

@riverpod
ChannelViewModel findChannel(FindChannelRef ref, {required int streamId}) {
  final m3uService = ref.watch(m3uServiceProvider);
  final channel = m3uService.findChannel(streamId)!;
  final now = DateTime.now();
  final latestEpgItem = channel.epgItems
      .where((element) =>
          element.start!.isBefore(now) && element.end!.isAfter(now))
      .firstOrNull;
  return ChannelViewModel(
    channel.id,
    channel.streamUrl,
    channel.name ?? "",
    channel.streamIcon ?? "",
    channel.streamType == "live",
    latestEpgItem,
  );
}

@riverpod
Stream<List<ChannelViewModel>> findAllChannels(FindAllChannelsRef ref,
    {ItemCategory? category}) {
  final searchValue = ref.watch(channelSearchValueProvider);
  final m3uService = ref.watch(m3uServiceProvider);
  return m3uService
      .findAllChannels(searchValue, category)
      .asyncMap((event) async {
    return event.map((e) {
      var now = DateTime.now();
      var latestEpgItem = e.epgItems
          .where((element) =>
              element.start!.isBefore(now) && element.end!.isAfter(now))
          .firstOrNull;
      return ChannelViewModel(
        e.id,
        e.streamUrl,
        e.name ?? "",
        e.streamIcon ?? "",
        e.streamType == "live",
        latestEpgItem,
      );
    }).toList();
  });
  // return m3uService.findAllChannels(searchValue, category);
}

@riverpod
Stream<List<ItemCategory>> findAllSeriesGroups(FindAllSeriesGroupsRef ref) {
  final m3uService = ref.watch(m3uServiceProvider);
  final activeIptvServer = m3uService.getActiveIptvServer()!;
  return m3uService.findAllSeriesGroups(activeIptvServer);
}

// @riverpod
// Stream<List<SeriesItem>> findAllItemsOfSeriesAndSeason(
//   FindAllItemsOfSeriesAndSeasonRef ref, {
//   required String series,
//   required String season,
// }) {
//   final m3uService = ref.watch(m3uServiceProvider);
//   final activeIptvServer = m3uService.getActiveIptvServer()!;

//   return m3uService.findAllItemsOfSeriesAndSeason(
//       activeIptvServer, series, season);
// }

@riverpod
Stream<List<M3UItem>> findAllSeasonsOfSeries(FindAllSeasonsOfSeriesRef ref,
    {required String series}) {
  final m3uService = ref.watch(m3uServiceProvider);
  final activeIptvServer = m3uService.getActiveIptvServer()!;

  return m3uService.findAllSeasonsOfSeries(activeIptvServer, series);
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
