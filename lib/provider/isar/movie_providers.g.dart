// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$findAllMoviesHash() => r'54d8383f5fa96528eae914e1a6c61402fa2cc844';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [findAllMovies].
@ProviderFor(findAllMovies)
const findAllMoviesProvider = FindAllMoviesFamily();

/// See also [findAllMovies].
class FindAllMoviesFamily extends Family {
  /// See also [findAllMovies].
  const FindAllMoviesFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'findAllMoviesProvider';

  /// See also [findAllMovies].
  FindAllMoviesProvider call({
    ItemCategory? category,
  }) {
    return FindAllMoviesProvider(
      category: category,
    );
  }

  @visibleForOverriding
  @override
  FindAllMoviesProvider getProviderOverride(
    covariant FindAllMoviesProvider provider,
  ) {
    return call(
      category: provider.category,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      Stream<List<ChannelViewModel>> Function(FindAllMoviesRef ref) create) {
    return _$FindAllMoviesFamilyOverride(this, create);
  }
}

class _$FindAllMoviesFamilyOverride implements FamilyOverride {
  _$FindAllMoviesFamilyOverride(this.overriddenFamily, this.create);

  final Stream<List<ChannelViewModel>> Function(FindAllMoviesRef ref) create;

  @override
  final FindAllMoviesFamily overriddenFamily;

  @override
  FindAllMoviesProvider getProviderOverride(
    covariant FindAllMoviesProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [findAllMovies].
class FindAllMoviesProvider
    extends AutoDisposeStreamProvider<List<ChannelViewModel>> {
  /// See also [findAllMovies].
  FindAllMoviesProvider({
    ItemCategory? category,
  }) : this._internal(
          (ref) => findAllMovies(
            ref as FindAllMoviesRef,
            category: category,
          ),
          from: findAllMoviesProvider,
          name: r'findAllMoviesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findAllMoviesHash,
          dependencies: FindAllMoviesFamily._dependencies,
          allTransitiveDependencies:
              FindAllMoviesFamily._allTransitiveDependencies,
          category: category,
        );

  FindAllMoviesProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.category,
  }) : super.internal();

  final ItemCategory? category;

  @override
  Override overrideWith(
    Stream<List<ChannelViewModel>> Function(FindAllMoviesRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindAllMoviesProvider._internal(
        (ref) => create(ref as FindAllMoviesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        category: category,
      ),
    );
  }

  @override
  ({
    ItemCategory? category,
  }) get argument {
    return (category: category,);
  }

  @override
  AutoDisposeStreamProviderElement<List<ChannelViewModel>> createElement() {
    return _FindAllMoviesProviderElement(this);
  }

  FindAllMoviesProvider _copyWith(
    Stream<List<ChannelViewModel>> Function(FindAllMoviesRef ref) create,
  ) {
    return FindAllMoviesProvider._internal(
      (ref) => create(ref as FindAllMoviesRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      category: category,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FindAllMoviesProvider && other.category == category;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FindAllMoviesRef on AutoDisposeStreamProviderRef<List<ChannelViewModel>> {
  /// The parameter `category` of this provider.
  ItemCategory? get category;
}

class _FindAllMoviesProviderElement
    extends AutoDisposeStreamProviderElement<List<ChannelViewModel>>
    with FindAllMoviesRef {
  _FindAllMoviesProviderElement(super.provider);

  @override
  ItemCategory? get category => (origin as FindAllMoviesProvider).category;
}

String _$findMovieHash() => r'105b99d19f099c5730bd692c913dc6c9aff53b93';

/// See also [findMovie].
@ProviderFor(findMovie)
const findMovieProvider = FindMovieFamily();

/// See also [findMovie].
class FindMovieFamily extends Family {
  /// See also [findMovie].
  const FindMovieFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'findMovieProvider';

  /// See also [findMovie].
  FindMovieProvider call({
    required int streamId,
  }) {
    return FindMovieProvider(
      streamId: streamId,
    );
  }

  @visibleForOverriding
  @override
  FindMovieProvider getProviderOverride(
    covariant FindMovieProvider provider,
  ) {
    return call(
      streamId: provider.streamId,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(MovieViewModel Function(FindMovieRef ref) create) {
    return _$FindMovieFamilyOverride(this, create);
  }
}

class _$FindMovieFamilyOverride implements FamilyOverride {
  _$FindMovieFamilyOverride(this.overriddenFamily, this.create);

  final MovieViewModel Function(FindMovieRef ref) create;

  @override
  final FindMovieFamily overriddenFamily;

  @override
  FindMovieProvider getProviderOverride(
    covariant FindMovieProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [findMovie].
class FindMovieProvider extends AutoDisposeProvider<MovieViewModel> {
  /// See also [findMovie].
  FindMovieProvider({
    required int streamId,
  }) : this._internal(
          (ref) => findMovie(
            ref as FindMovieRef,
            streamId: streamId,
          ),
          from: findMovieProvider,
          name: r'findMovieProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findMovieHash,
          dependencies: FindMovieFamily._dependencies,
          allTransitiveDependencies: FindMovieFamily._allTransitiveDependencies,
          streamId: streamId,
        );

  FindMovieProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.streamId,
  }) : super.internal();

  final int streamId;

  @override
  Override overrideWith(
    MovieViewModel Function(FindMovieRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindMovieProvider._internal(
        (ref) => create(ref as FindMovieRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        streamId: streamId,
      ),
    );
  }

  @override
  ({
    int streamId,
  }) get argument {
    return (streamId: streamId,);
  }

  @override
  AutoDisposeProviderElement<MovieViewModel> createElement() {
    return _FindMovieProviderElement(this);
  }

  FindMovieProvider _copyWith(
    MovieViewModel Function(FindMovieRef ref) create,
  ) {
    return FindMovieProvider._internal(
      (ref) => create(ref as FindMovieRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      streamId: streamId,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FindMovieProvider && other.streamId == streamId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, streamId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FindMovieRef on AutoDisposeProviderRef<MovieViewModel> {
  /// The parameter `streamId` of this provider.
  int get streamId;
}

class _FindMovieProviderElement
    extends AutoDisposeProviderElement<MovieViewModel> with FindMovieRef {
  _FindMovieProviderElement(super.provider);

  @override
  int get streamId => (origin as FindMovieProvider).streamId;
}

String _$findMovieDetailHash() => r'115d6c85956fd72b2148e0bcfa75a1f7a9c311f7';

/// See also [findMovieDetail].
@ProviderFor(findMovieDetail)
const findMovieDetailProvider = FindMovieDetailFamily();

/// See also [findMovieDetail].
class FindMovieDetailFamily extends Family {
  /// See also [findMovieDetail].
  const FindMovieDetailFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'findMovieDetailProvider';

  /// See also [findMovieDetail].
  FindMovieDetailProvider call({
    required int vodId,
  }) {
    return FindMovieDetailProvider(
      vodId: vodId,
    );
  }

  @visibleForOverriding
  @override
  FindMovieDetailProvider getProviderOverride(
    covariant FindMovieDetailProvider provider,
  ) {
    return call(
      vodId: provider.vodId,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<XTremeCodeVodInfo?> Function(FindMovieDetailRef ref) create) {
    return _$FindMovieDetailFamilyOverride(this, create);
  }
}

class _$FindMovieDetailFamilyOverride implements FamilyOverride {
  _$FindMovieDetailFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<XTremeCodeVodInfo?> Function(FindMovieDetailRef ref) create;

  @override
  final FindMovieDetailFamily overriddenFamily;

  @override
  FindMovieDetailProvider getProviderOverride(
    covariant FindMovieDetailProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [findMovieDetail].
class FindMovieDetailProvider
    extends AutoDisposeFutureProvider<XTremeCodeVodInfo?> {
  /// See also [findMovieDetail].
  FindMovieDetailProvider({
    required int vodId,
  }) : this._internal(
          (ref) => findMovieDetail(
            ref as FindMovieDetailRef,
            vodId: vodId,
          ),
          from: findMovieDetailProvider,
          name: r'findMovieDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findMovieDetailHash,
          dependencies: FindMovieDetailFamily._dependencies,
          allTransitiveDependencies:
              FindMovieDetailFamily._allTransitiveDependencies,
          vodId: vodId,
        );

  FindMovieDetailProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.vodId,
  }) : super.internal();

  final int vodId;

  @override
  Override overrideWith(
    FutureOr<XTremeCodeVodInfo?> Function(FindMovieDetailRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindMovieDetailProvider._internal(
        (ref) => create(ref as FindMovieDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        vodId: vodId,
      ),
    );
  }

  @override
  ({
    int vodId,
  }) get argument {
    return (vodId: vodId,);
  }

  @override
  AutoDisposeFutureProviderElement<XTremeCodeVodInfo?> createElement() {
    return _FindMovieDetailProviderElement(this);
  }

  FindMovieDetailProvider _copyWith(
    FutureOr<XTremeCodeVodInfo?> Function(FindMovieDetailRef ref) create,
  ) {
    return FindMovieDetailProvider._internal(
      (ref) => create(ref as FindMovieDetailRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      vodId: vodId,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FindMovieDetailProvider && other.vodId == vodId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, vodId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FindMovieDetailRef on AutoDisposeFutureProviderRef<XTremeCodeVodInfo?> {
  /// The parameter `vodId` of this provider.
  int get vodId;
}

class _FindMovieDetailProviderElement
    extends AutoDisposeFutureProviderElement<XTremeCodeVodInfo?>
    with FindMovieDetailRef {
  _FindMovieDetailProviderElement(super.provider);

  @override
  int get vodId => (origin as FindMovieDetailProvider).vodId;
}

String _$findAllMovieGroupsHash() =>
    r'444d280b2d0be7618f77f90a442b03712063e5b5';

/// See also [findAllMovieGroups].
@ProviderFor(findAllMovieGroups)
final findAllMovieGroupsProvider =
    AutoDisposeStreamProvider<List<ItemCategory>>.internal(
  findAllMovieGroups,
  name: r'findAllMovieGroupsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$findAllMovieGroupsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FindAllMovieGroupsRef
    = AutoDisposeStreamProviderRef<List<ItemCategory>>;
String _$findRelatedMoviesHash() => r'3634b67065151eb8fe1d2f95daa4d8496c4c8d1b';

/// See also [findRelatedMovies].
@ProviderFor(findRelatedMovies)
const findRelatedMoviesProvider = FindRelatedMoviesFamily();

/// See also [findRelatedMovies].
class FindRelatedMoviesFamily extends Family {
  /// See also [findRelatedMovies].
  const FindRelatedMoviesFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'findRelatedMoviesProvider';

  /// See also [findRelatedMovies].
  FindRelatedMoviesProvider call({
    required int streamId,
  }) {
    return FindRelatedMoviesProvider(
      streamId: streamId,
    );
  }

  @visibleForOverriding
  @override
  FindRelatedMoviesProvider getProviderOverride(
    covariant FindRelatedMoviesProvider provider,
  ) {
    return call(
      streamId: provider.streamId,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      List<MovieViewModel> Function(FindRelatedMoviesRef ref) create) {
    return _$FindRelatedMoviesFamilyOverride(this, create);
  }
}

class _$FindRelatedMoviesFamilyOverride implements FamilyOverride {
  _$FindRelatedMoviesFamilyOverride(this.overriddenFamily, this.create);

  final List<MovieViewModel> Function(FindRelatedMoviesRef ref) create;

  @override
  final FindRelatedMoviesFamily overriddenFamily;

  @override
  FindRelatedMoviesProvider getProviderOverride(
    covariant FindRelatedMoviesProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [findRelatedMovies].
class FindRelatedMoviesProvider
    extends AutoDisposeProvider<List<MovieViewModel>> {
  /// See also [findRelatedMovies].
  FindRelatedMoviesProvider({
    required int streamId,
  }) : this._internal(
          (ref) => findRelatedMovies(
            ref as FindRelatedMoviesRef,
            streamId: streamId,
          ),
          from: findRelatedMoviesProvider,
          name: r'findRelatedMoviesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findRelatedMoviesHash,
          dependencies: FindRelatedMoviesFamily._dependencies,
          allTransitiveDependencies:
              FindRelatedMoviesFamily._allTransitiveDependencies,
          streamId: streamId,
        );

  FindRelatedMoviesProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.streamId,
  }) : super.internal();

  final int streamId;

  @override
  Override overrideWith(
    List<MovieViewModel> Function(FindRelatedMoviesRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindRelatedMoviesProvider._internal(
        (ref) => create(ref as FindRelatedMoviesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        streamId: streamId,
      ),
    );
  }

  @override
  ({
    int streamId,
  }) get argument {
    return (streamId: streamId,);
  }

  @override
  AutoDisposeProviderElement<List<MovieViewModel>> createElement() {
    return _FindRelatedMoviesProviderElement(this);
  }

  FindRelatedMoviesProvider _copyWith(
    List<MovieViewModel> Function(FindRelatedMoviesRef ref) create,
  ) {
    return FindRelatedMoviesProvider._internal(
      (ref) => create(ref as FindRelatedMoviesRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      streamId: streamId,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FindRelatedMoviesProvider && other.streamId == streamId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, streamId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FindRelatedMoviesRef on AutoDisposeProviderRef<List<MovieViewModel>> {
  /// The parameter `streamId` of this provider.
  int get streamId;
}

class _FindRelatedMoviesProviderElement
    extends AutoDisposeProviderElement<List<MovieViewModel>>
    with FindRelatedMoviesRef {
  _FindRelatedMoviesProviderElement(super.provider);

  @override
  int get streamId => (origin as FindRelatedMoviesProvider).streamId;
}

String _$movieProgressHash() => r'9051a1ee90e5378e7915f382fc5fa108fb8cba8a';

abstract class _$MovieProgress extends BuildlessAutoDisposeNotifier<double?> {
  late final int movieId;

  double? build(
    int movieId,
  );
}

/// See also [MovieProgress].
@ProviderFor(MovieProgress)
const movieProgressProvider = MovieProgressFamily();

/// See also [MovieProgress].
class MovieProgressFamily extends Family {
  /// See also [MovieProgress].
  const MovieProgressFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'movieProgressProvider';

  /// See also [MovieProgress].
  MovieProgressProvider call(
    int movieId,
  ) {
    return MovieProgressProvider(
      movieId,
    );
  }

  @visibleForOverriding
  @override
  MovieProgressProvider getProviderOverride(
    covariant MovieProgressProvider provider,
  ) {
    return call(
      provider.movieId,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(MovieProgress Function() create) {
    return _$MovieProgressFamilyOverride(this, create);
  }
}

class _$MovieProgressFamilyOverride implements FamilyOverride {
  _$MovieProgressFamilyOverride(this.overriddenFamily, this.create);

  final MovieProgress Function() create;

  @override
  final MovieProgressFamily overriddenFamily;

  @override
  MovieProgressProvider getProviderOverride(
    covariant MovieProgressProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [MovieProgress].
class MovieProgressProvider
    extends AutoDisposeNotifierProviderImpl<MovieProgress, double?> {
  /// See also [MovieProgress].
  MovieProgressProvider(
    int movieId,
  ) : this._internal(
          () => MovieProgress()..movieId = movieId,
          from: movieProgressProvider,
          name: r'movieProgressProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$movieProgressHash,
          dependencies: MovieProgressFamily._dependencies,
          allTransitiveDependencies:
              MovieProgressFamily._allTransitiveDependencies,
          movieId: movieId,
        );

  MovieProgressProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.movieId,
  }) : super.internal();

  final int movieId;

  @override
  double? runNotifierBuild(
    covariant MovieProgress notifier,
  ) {
    return notifier.build(
      movieId,
    );
  }

  @override
  Override overrideWith(MovieProgress Function() create) {
    return ProviderOverride(
      origin: this,
      override: MovieProgressProvider._internal(
        () => create()..movieId = movieId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        movieId: movieId,
      ),
    );
  }

  @override
  (int,) get argument {
    return (movieId,);
  }

  @override
  AutoDisposeNotifierProviderElement<MovieProgress, double?> createElement() {
    return _MovieProgressProviderElement(this);
  }

  MovieProgressProvider _copyWith(
    MovieProgress Function() create,
  ) {
    return MovieProgressProvider._internal(
      () => create()..movieId = movieId,
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      movieId: movieId,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MovieProgressProvider && other.movieId == movieId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, movieId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MovieProgressRef on AutoDisposeNotifierProviderRef<double?> {
  /// The parameter `movieId` of this provider.
  int get movieId;
}

class _MovieProgressProviderElement
    extends AutoDisposeNotifierProviderElement<MovieProgress, double?>
    with MovieProgressRef {
  _MovieProgressProviderElement(super.provider);

  @override
  int get movieId => (origin as MovieProgressProvider).movieId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
