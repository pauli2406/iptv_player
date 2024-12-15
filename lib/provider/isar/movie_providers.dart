import 'package:play_shift/provider/isar/iptv_server_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:play_shift/home/provider/search_value_provider.dart';
import 'package:play_shift/provider/isar/m3u_provider.dart';
import 'package:play_shift/provider/models/movie_view_model.dart';
import 'package:play_shift/service/collections/item_category.dart';
import 'package:xtream_code_client/xtream_code_client.dart';

part 'movie_providers.g.dart';

@riverpod
Stream<List<MovieViewModel>> findAllMovies(
  FindAllMoviesRef ref, {
  ItemCategory? category,
}) {
  final searchValue = ref.watch(movieSearchValueProvider);
  final m3uService = ref.watch(m3uServiceProvider);
  final activeServer = m3uService.getActiveIptvServer()!;

  return m3uService
      .findAllMovies(activeServer, searchValue, category)
      .map((movies) => movies
        .map((movie) => MovieViewModel(
              streamId: movie.id,
              streamUrl: movie.streamUrl,
              title: movie.name ?? "",
              streamIcon: movie.streamIcon ?? "",
              year: movie.year,
              rating: movie.rating,
              rating5based: movie.rating5based,
              added: movie.added,
              containerExtension: movie.containerExtension,
              directSource: movie.directSource,
              durationSecs: movie.durationSecs,
            ))
        .toList());
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
    durationSecs: vod.durationSecs, // Add this line
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
List<MovieViewModel> findRelatedMovies(FindRelatedMoviesRef ref,
    {required int streamId}) {
  final m3uService = ref.watch(m3uServiceProvider);
  final vod = m3uService.findVod(streamId);

  if (vod == null) return [];

  final relatedMovies = m3uService.findRelatedMovies(vod);

  return relatedMovies
      .map((e) => MovieViewModel(
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
          ))
      .toList();
}

@riverpod
class MovieProgress extends _$MovieProgress {
  @override
  double? build(int movieId) {
    return ref.watch(m3uServiceProvider).getMovieProgress(movieId);
  }

  Future<void> updateProgress(double duration) async {
    await ref.read(m3uServiceProvider).updateMovieProgress(movieId, duration);
    ref.invalidateSelf();
  }
}
