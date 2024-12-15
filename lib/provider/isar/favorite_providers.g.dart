// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$favoriteChannelsHash() => r'd48c9db16ea996c5eb56ae39837d3159b21ae514';

/// See also [favoriteChannels].
@ProviderFor(favoriteChannels)
final favoriteChannelsProvider =
    AutoDisposeStreamProvider<List<ChannelItem>>.internal(
  favoriteChannels,
  name: r'favoriteChannelsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$favoriteChannelsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FavoriteChannelsRef = AutoDisposeStreamProviderRef<List<ChannelItem>>;
String _$favoriteMoviesHash() => r'c7ef3133fcee5b1740014bf9a113808d2b6230ed';

/// See also [favoriteMovies].
@ProviderFor(favoriteMovies)
final favoriteMoviesProvider =
    AutoDisposeStreamProvider<List<VodItem>>.internal(
  favoriteMovies,
  name: r'favoriteMoviesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$favoriteMoviesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FavoriteMoviesRef = AutoDisposeStreamProviderRef<List<VodItem>>;
String _$favoriteSeriesHash() => r'f66272f96be9f38a3f19f6a8db1d938253b87988';

/// See also [favoriteSeries].
@ProviderFor(favoriteSeries)
final favoriteSeriesProvider =
    AutoDisposeStreamProvider<List<SeriesItem>>.internal(
  favoriteSeries,
  name: r'favoriteSeriesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$favoriteSeriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FavoriteSeriesRef = AutoDisposeStreamProviderRef<List<SeriesItem>>;
String _$favoritesHash() => r'1e96150f7787a9104fdbc50be0341820357e4100';

/// See also [Favorites].
@ProviderFor(Favorites)
final favoritesProvider =
    AutoDisposeAsyncNotifierProvider<Favorites, void>.internal(
  Favorites.new,
  name: r'favoritesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$favoritesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Favorites = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
