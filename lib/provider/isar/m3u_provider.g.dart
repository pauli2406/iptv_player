// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm3u_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$m3uServiceHash() => r'f8e3f5625df4e0bac5ea4b71b04e93c50db1cc9a';

/// See also [m3uService].
@ProviderFor(m3uService)
final m3uServiceProvider = Provider<M3uService>.internal(
  m3uService,
  name: r'm3uServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$m3uServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef M3uServiceRef = ProviderRef<M3uService>;
String _$m3uParseServiceHash() => r'17b0748dc4ee40d0acc35c84597af65fe3f2d959';

/// See also [m3uParseService].
@ProviderFor(m3uParseService)
final m3uParseServiceProvider = Provider<M3uParseService>.internal(
  m3uParseService,
  name: r'm3uParseServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$m3uParseServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef M3uParseServiceRef = ProviderRef<M3uParseService>;
String _$clearDownloadAndPersistActivePlaylistItemsHash() =>
    r'377f3b5f7f40e30875659f2f247dc83adf344f86';

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

/// See also [clearDownloadAndPersistActivePlaylistItems].
@ProviderFor(clearDownloadAndPersistActivePlaylistItems)
const clearDownloadAndPersistActivePlaylistItemsProvider =
    ClearDownloadAndPersistActivePlaylistItemsFamily();

/// See also [clearDownloadAndPersistActivePlaylistItems].
class ClearDownloadAndPersistActivePlaylistItemsFamily
    extends Family<AsyncValue<bool>> {
  /// See also [clearDownloadAndPersistActivePlaylistItems].
  const ClearDownloadAndPersistActivePlaylistItemsFamily();

  /// See also [clearDownloadAndPersistActivePlaylistItems].
  ClearDownloadAndPersistActivePlaylistItemsProvider call({
    bool? forced,
  }) {
    return ClearDownloadAndPersistActivePlaylistItemsProvider(
      forced: forced,
    );
  }

  @override
  ClearDownloadAndPersistActivePlaylistItemsProvider getProviderOverride(
    covariant ClearDownloadAndPersistActivePlaylistItemsProvider provider,
  ) {
    return call(
      forced: provider.forced,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'clearDownloadAndPersistActivePlaylistItemsProvider';
}

/// See also [clearDownloadAndPersistActivePlaylistItems].
class ClearDownloadAndPersistActivePlaylistItemsProvider
    extends AutoDisposeFutureProvider<bool> {
  /// See also [clearDownloadAndPersistActivePlaylistItems].
  ClearDownloadAndPersistActivePlaylistItemsProvider({
    bool? forced,
  }) : this._internal(
          (ref) => clearDownloadAndPersistActivePlaylistItems(
            ref as ClearDownloadAndPersistActivePlaylistItemsRef,
            forced: forced,
          ),
          from: clearDownloadAndPersistActivePlaylistItemsProvider,
          name: r'clearDownloadAndPersistActivePlaylistItemsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$clearDownloadAndPersistActivePlaylistItemsHash,
          dependencies:
              ClearDownloadAndPersistActivePlaylistItemsFamily._dependencies,
          allTransitiveDependencies:
              ClearDownloadAndPersistActivePlaylistItemsFamily
                  ._allTransitiveDependencies,
          forced: forced,
        );

  ClearDownloadAndPersistActivePlaylistItemsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.forced,
  }) : super.internal();

  final bool? forced;

  @override
  Override overrideWith(
    FutureOr<bool> Function(
            ClearDownloadAndPersistActivePlaylistItemsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ClearDownloadAndPersistActivePlaylistItemsProvider._internal(
        (ref) => create(ref as ClearDownloadAndPersistActivePlaylistItemsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        forced: forced,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _ClearDownloadAndPersistActivePlaylistItemsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ClearDownloadAndPersistActivePlaylistItemsProvider &&
        other.forced == forced;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, forced.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ClearDownloadAndPersistActivePlaylistItemsRef
    on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `forced` of this provider.
  bool? get forced;
}

class _ClearDownloadAndPersistActivePlaylistItemsProviderElement
    extends AutoDisposeFutureProviderElement<bool>
    with ClearDownloadAndPersistActivePlaylistItemsRef {
  _ClearDownloadAndPersistActivePlaylistItemsProviderElement(super.provider);

  @override
  bool? get forced =>
      (origin as ClearDownloadAndPersistActivePlaylistItemsProvider).forced;
}

String _$findAllMoviesHash() => r'b46ce6babe319f6437a65ec2ebca6f5956386a49';

/// See also [findAllMovies].
@ProviderFor(findAllMovies)
const findAllMoviesProvider = FindAllMoviesFamily();

/// See also [findAllMovies].
class FindAllMoviesFamily extends Family<AsyncValue<List<VodItem>>> {
  /// See also [findAllMovies].
  const FindAllMoviesFamily();

  /// See also [findAllMovies].
  FindAllMoviesProvider call({
    ItemCategory? category,
  }) {
    return FindAllMoviesProvider(
      category: category,
    );
  }

  @override
  FindAllMoviesProvider getProviderOverride(
    covariant FindAllMoviesProvider provider,
  ) {
    return call(
      category: provider.category,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'findAllMoviesProvider';
}

/// See also [findAllMovies].
class FindAllMoviesProvider extends AutoDisposeStreamProvider<List<VodItem>> {
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
    super._createNotifier, {
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
    Stream<List<VodItem>> Function(FindAllMoviesRef provider) create,
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
  AutoDisposeStreamProviderElement<List<VodItem>> createElement() {
    return _FindAllMoviesProviderElement(this);
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

mixin FindAllMoviesRef on AutoDisposeStreamProviderRef<List<VodItem>> {
  /// The parameter `category` of this provider.
  ItemCategory? get category;
}

class _FindAllMoviesProviderElement
    extends AutoDisposeStreamProviderElement<List<VodItem>>
    with FindAllMoviesRef {
  _FindAllMoviesProviderElement(super.provider);

  @override
  ItemCategory? get category => (origin as FindAllMoviesProvider).category;
}

String _$findAllSeriesHash() => r'e0ff29ea7e54e0cbe2e5eeb755e434b7e8dfb952';

/// See also [findAllSeries].
@ProviderFor(findAllSeries)
const findAllSeriesProvider = FindAllSeriesFamily();

/// See also [findAllSeries].
class FindAllSeriesFamily extends Family<AsyncValue<List<SeriesItem>>> {
  /// See also [findAllSeries].
  const FindAllSeriesFamily();

  /// See also [findAllSeries].
  FindAllSeriesProvider call({
    ItemCategory? category,
  }) {
    return FindAllSeriesProvider(
      category: category,
    );
  }

  @override
  FindAllSeriesProvider getProviderOverride(
    covariant FindAllSeriesProvider provider,
  ) {
    return call(
      category: provider.category,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'findAllSeriesProvider';
}

/// See also [findAllSeries].
class FindAllSeriesProvider
    extends AutoDisposeStreamProvider<List<SeriesItem>> {
  /// See also [findAllSeries].
  FindAllSeriesProvider({
    ItemCategory? category,
  }) : this._internal(
          (ref) => findAllSeries(
            ref as FindAllSeriesRef,
            category: category,
          ),
          from: findAllSeriesProvider,
          name: r'findAllSeriesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findAllSeriesHash,
          dependencies: FindAllSeriesFamily._dependencies,
          allTransitiveDependencies:
              FindAllSeriesFamily._allTransitiveDependencies,
          category: category,
        );

  FindAllSeriesProvider._internal(
    super._createNotifier, {
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
    Stream<List<SeriesItem>> Function(FindAllSeriesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindAllSeriesProvider._internal(
        (ref) => create(ref as FindAllSeriesRef),
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
  AutoDisposeStreamProviderElement<List<SeriesItem>> createElement() {
    return _FindAllSeriesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindAllSeriesProvider && other.category == category;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FindAllSeriesRef on AutoDisposeStreamProviderRef<List<SeriesItem>> {
  /// The parameter `category` of this provider.
  ItemCategory? get category;
}

class _FindAllSeriesProviderElement
    extends AutoDisposeStreamProviderElement<List<SeriesItem>>
    with FindAllSeriesRef {
  _FindAllSeriesProviderElement(super.provider);

  @override
  ItemCategory? get category => (origin as FindAllSeriesProvider).category;
}

String _$findAllChannelsHash() => r'd3083680bf99c158114d0951d405598e71673894';

/// See also [findAllChannels].
@ProviderFor(findAllChannels)
const findAllChannelsProvider = FindAllChannelsFamily();

/// See also [findAllChannels].
class FindAllChannelsFamily extends Family<AsyncValue<List<ChannelViewModel>>> {
  /// See also [findAllChannels].
  const FindAllChannelsFamily();

  /// See also [findAllChannels].
  FindAllChannelsProvider call({
    ItemCategory? category,
  }) {
    return FindAllChannelsProvider(
      category: category,
    );
  }

  @override
  FindAllChannelsProvider getProviderOverride(
    covariant FindAllChannelsProvider provider,
  ) {
    return call(
      category: provider.category,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'findAllChannelsProvider';
}

/// See also [findAllChannels].
class FindAllChannelsProvider
    extends AutoDisposeStreamProvider<List<ChannelViewModel>> {
  /// See also [findAllChannels].
  FindAllChannelsProvider({
    ItemCategory? category,
  }) : this._internal(
          (ref) => findAllChannels(
            ref as FindAllChannelsRef,
            category: category,
          ),
          from: findAllChannelsProvider,
          name: r'findAllChannelsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findAllChannelsHash,
          dependencies: FindAllChannelsFamily._dependencies,
          allTransitiveDependencies:
              FindAllChannelsFamily._allTransitiveDependencies,
          category: category,
        );

  FindAllChannelsProvider._internal(
    super._createNotifier, {
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
    Stream<List<ChannelViewModel>> Function(FindAllChannelsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindAllChannelsProvider._internal(
        (ref) => create(ref as FindAllChannelsRef),
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
  AutoDisposeStreamProviderElement<List<ChannelViewModel>> createElement() {
    return _FindAllChannelsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindAllChannelsProvider && other.category == category;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FindAllChannelsRef
    on AutoDisposeStreamProviderRef<List<ChannelViewModel>> {
  /// The parameter `category` of this provider.
  ItemCategory? get category;
}

class _FindAllChannelsProviderElement
    extends AutoDisposeStreamProviderElement<List<ChannelViewModel>>
    with FindAllChannelsRef {
  _FindAllChannelsProviderElement(super.provider);

  @override
  ItemCategory? get category => (origin as FindAllChannelsProvider).category;
}

String _$findAllSeriesGroupsHash() =>
    r'b6d76d9ab28a1823a5cd38802cd355617a52c40a';

/// See also [findAllSeriesGroups].
@ProviderFor(findAllSeriesGroups)
final findAllSeriesGroupsProvider =
    AutoDisposeStreamProvider<List<ItemCategory>>.internal(
  findAllSeriesGroups,
  name: r'findAllSeriesGroupsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$findAllSeriesGroupsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FindAllSeriesGroupsRef
    = AutoDisposeStreamProviderRef<List<ItemCategory>>;
String _$findAllSeasonsOfSeriesHash() =>
    r'721224f4b3910e7bfec7f1e452ae4b8b6a31cc03';

/// See also [findAllSeasonsOfSeries].
@ProviderFor(findAllSeasonsOfSeries)
const findAllSeasonsOfSeriesProvider = FindAllSeasonsOfSeriesFamily();

/// See also [findAllSeasonsOfSeries].
class FindAllSeasonsOfSeriesFamily extends Family<AsyncValue<List<M3UItem>>> {
  /// See also [findAllSeasonsOfSeries].
  const FindAllSeasonsOfSeriesFamily();

  /// See also [findAllSeasonsOfSeries].
  FindAllSeasonsOfSeriesProvider call({
    required String series,
  }) {
    return FindAllSeasonsOfSeriesProvider(
      series: series,
    );
  }

  @override
  FindAllSeasonsOfSeriesProvider getProviderOverride(
    covariant FindAllSeasonsOfSeriesProvider provider,
  ) {
    return call(
      series: provider.series,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'findAllSeasonsOfSeriesProvider';
}

/// See also [findAllSeasonsOfSeries].
class FindAllSeasonsOfSeriesProvider
    extends AutoDisposeStreamProvider<List<M3UItem>> {
  /// See also [findAllSeasonsOfSeries].
  FindAllSeasonsOfSeriesProvider({
    required String series,
  }) : this._internal(
          (ref) => findAllSeasonsOfSeries(
            ref as FindAllSeasonsOfSeriesRef,
            series: series,
          ),
          from: findAllSeasonsOfSeriesProvider,
          name: r'findAllSeasonsOfSeriesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findAllSeasonsOfSeriesHash,
          dependencies: FindAllSeasonsOfSeriesFamily._dependencies,
          allTransitiveDependencies:
              FindAllSeasonsOfSeriesFamily._allTransitiveDependencies,
          series: series,
        );

  FindAllSeasonsOfSeriesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.series,
  }) : super.internal();

  final String series;

  @override
  Override overrideWith(
    Stream<List<M3UItem>> Function(FindAllSeasonsOfSeriesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindAllSeasonsOfSeriesProvider._internal(
        (ref) => create(ref as FindAllSeasonsOfSeriesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        series: series,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<M3UItem>> createElement() {
    return _FindAllSeasonsOfSeriesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindAllSeasonsOfSeriesProvider && other.series == series;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, series.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FindAllSeasonsOfSeriesRef on AutoDisposeStreamProviderRef<List<M3UItem>> {
  /// The parameter `series` of this provider.
  String get series;
}

class _FindAllSeasonsOfSeriesProviderElement
    extends AutoDisposeStreamProviderElement<List<M3UItem>>
    with FindAllSeasonsOfSeriesRef {
  _FindAllSeasonsOfSeriesProviderElement(super.provider);

  @override
  String get series => (origin as FindAllSeasonsOfSeriesProvider).series;
}

String _$findAllChannelGroupsHash() =>
    r'c6e8fe1df9fe7e5e2896a37bbe95343761bf9abc';

/// See also [findAllChannelGroups].
@ProviderFor(findAllChannelGroups)
final findAllChannelGroupsProvider =
    AutoDisposeStreamProvider<List<ItemCategory>>.internal(
  findAllChannelGroups,
  name: r'findAllChannelGroupsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$findAllChannelGroupsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FindAllChannelGroupsRef
    = AutoDisposeStreamProviderRef<List<ItemCategory>>;
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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
