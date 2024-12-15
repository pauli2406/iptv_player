import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:play_shift/provider/isar/m3u_provider.dart';
import 'package:play_shift/service/collections/channel_item.dart';
import 'package:play_shift/service/collections/vod_item.dart';
import 'package:play_shift/service/collections/series_item.dart';

part 'favorite_providers.g.dart';

@riverpod
class Favorites extends _$Favorites {
  @override
  Future<void> build() async {}

  Future<void> toggleChannelFavorite(int channelId) async {
    await ref.read(m3uServiceProvider).toggleChannelFavorite(channelId);
  }

  Future<void> toggleMovieFavorite(int movieId) async {
    await ref.read(m3uServiceProvider).toggleMovieFavorite(movieId);
  }

  Future<void> toggleSeriesFavorite(int seriesId) async {
    await ref.read(m3uServiceProvider).toggleSeriesFavorite(seriesId);
  }
}

@riverpod
Stream<List<ChannelItem>> favoriteChannels(FavoriteChannelsRef ref) {
  return ref.watch(m3uServiceProvider).getFavoriteChannels();
}

@riverpod
Stream<List<VodItem>> favoriteMovies(FavoriteMoviesRef ref) {
  return ref.watch(m3uServiceProvider).getFavoriteMovies();
}

@riverpod
Stream<List<SeriesItem>> favoriteSeries(FavoriteSeriesRef ref) {
  return ref.watch(m3uServiceProvider).getFavoriteSeries();
}

final isChannelFavoriteProvider = StreamProvider.family<bool, int>((ref, channelId) {
  final m3uService = ref.watch(m3uServiceProvider);
  return m3uService.isChannelFavorite(channelId);
});

final isMovieFavoriteProvider = StreamProvider.family<bool, int>((ref, movieId) {
  final m3uService = ref.watch(m3uServiceProvider);
  return m3uService.isMovieFavorite(movieId);
});

final isSeriesFavoriteProvider = StreamProvider.family<bool, int>((ref, seriesId) {
  final m3uService = ref.watch(m3uServiceProvider);
  return m3uService.isSeriesFavorite(seriesId);
});
