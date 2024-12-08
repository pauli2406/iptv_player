import 'package:play_shift/home/provider/search_value_provider.dart';
import 'package:play_shift/provider/isar/iptv_server_provider.dart';
import 'package:play_shift/provider/models/channel_view_model.dart';
import 'package:play_shift/provider/models/provider_models.dart';
import 'package:play_shift/service/m3u_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:play_shift/provider/isar/m3u_provider.dart';
import 'package:play_shift/service/collections/series_item.dart';
import 'package:play_shift/service/collections/item_category.dart';
import 'package:play_shift/service/collections/series_episode.dart';
import 'package:xtream_code_client/xtream_code_client.dart';

part 'series_providers.g.dart';

@riverpod
Stream<SeriesWithInfo> findSeriesWithInfo(
  FindSeriesWithInfoRef ref, {
  required int seriesId,
}) async* {
  final series = await ref.watch(findSeriesProvider(seriesId: seriesId).future);
  final info = await ref.watch(findSeriesInfoProvider(seriesId: seriesId).future);
  yield SeriesWithInfo(series, info);
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

@riverpod
class SeriesProgress extends _$SeriesProgress {
  @override
  bool build(int seriesId) {
    return ref.watch(m3uServiceProvider).isSeriesStarted(seriesId);
  }

  Future<void> markAsStarted() async {
    await ref.read(m3uServiceProvider).updateSeriesProgress(seriesId);
    ref.invalidateSelf();
  }
}

@riverpod
class EpisodeProgress extends _$EpisodeProgress {
  @override
  double? build(int episodeId) {
    return ref.watch(m3uServiceProvider).getEpisodeProgress(episodeId);
  }

  Future<void> updateProgress(double duration) async {
    await ref.read(m3uServiceProvider).updateEpisodeProgress(episodeId, duration);
    ref.invalidateSelf();
  }
}