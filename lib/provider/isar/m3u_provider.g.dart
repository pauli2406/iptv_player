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
    r'c8d2b7400af53386464cece9dc355a685a2aed30';

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

String _$findAllMoviesHash() => r'243348ac96e929ef66b94e5e7eedbfece1fe1104';

/// See also [findAllMovies].
@ProviderFor(findAllMovies)
const findAllMoviesProvider = FindAllMoviesFamily();

/// See also [findAllMovies].
class FindAllMoviesFamily extends Family<AsyncValue<List<M3UItem>>> {
  /// See also [findAllMovies].
  const FindAllMoviesFamily();

  /// See also [findAllMovies].
  FindAllMoviesProvider call({
    String? groupTitle,
  }) {
    return FindAllMoviesProvider(
      groupTitle: groupTitle,
    );
  }

  @override
  FindAllMoviesProvider getProviderOverride(
    covariant FindAllMoviesProvider provider,
  ) {
    return call(
      groupTitle: provider.groupTitle,
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
class FindAllMoviesProvider extends AutoDisposeStreamProvider<List<M3UItem>> {
  /// See also [findAllMovies].
  FindAllMoviesProvider({
    String? groupTitle,
  }) : this._internal(
          (ref) => findAllMovies(
            ref as FindAllMoviesRef,
            groupTitle: groupTitle,
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
          groupTitle: groupTitle,
        );

  FindAllMoviesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.groupTitle,
  }) : super.internal();

  final String? groupTitle;

  @override
  Override overrideWith(
    Stream<List<M3UItem>> Function(FindAllMoviesRef provider) create,
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
        groupTitle: groupTitle,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<M3UItem>> createElement() {
    return _FindAllMoviesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindAllMoviesProvider && other.groupTitle == groupTitle;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupTitle.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FindAllMoviesRef on AutoDisposeStreamProviderRef<List<M3UItem>> {
  /// The parameter `groupTitle` of this provider.
  String? get groupTitle;
}

class _FindAllMoviesProviderElement
    extends AutoDisposeStreamProviderElement<List<M3UItem>>
    with FindAllMoviesRef {
  _FindAllMoviesProviderElement(super.provider);

  @override
  String? get groupTitle => (origin as FindAllMoviesProvider).groupTitle;
}

String _$findAllSeriesHash() => r'ce0acce002f9be69a2971fba8fdaff65e7a765cf';

/// See also [findAllSeries].
@ProviderFor(findAllSeries)
const findAllSeriesProvider = FindAllSeriesFamily();

/// See also [findAllSeries].
class FindAllSeriesFamily extends Family<AsyncValue<List<M3UItem>>> {
  /// See also [findAllSeries].
  const FindAllSeriesFamily();

  /// See also [findAllSeries].
  FindAllSeriesProvider call({
    String? groupTitle,
  }) {
    return FindAllSeriesProvider(
      groupTitle: groupTitle,
    );
  }

  @override
  FindAllSeriesProvider getProviderOverride(
    covariant FindAllSeriesProvider provider,
  ) {
    return call(
      groupTitle: provider.groupTitle,
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
class FindAllSeriesProvider extends AutoDisposeStreamProvider<List<M3UItem>> {
  /// See also [findAllSeries].
  FindAllSeriesProvider({
    String? groupTitle,
  }) : this._internal(
          (ref) => findAllSeries(
            ref as FindAllSeriesRef,
            groupTitle: groupTitle,
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
          groupTitle: groupTitle,
        );

  FindAllSeriesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.groupTitle,
  }) : super.internal();

  final String? groupTitle;

  @override
  Override overrideWith(
    Stream<List<M3UItem>> Function(FindAllSeriesRef provider) create,
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
        groupTitle: groupTitle,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<M3UItem>> createElement() {
    return _FindAllSeriesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindAllSeriesProvider && other.groupTitle == groupTitle;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupTitle.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FindAllSeriesRef on AutoDisposeStreamProviderRef<List<M3UItem>> {
  /// The parameter `groupTitle` of this provider.
  String? get groupTitle;
}

class _FindAllSeriesProviderElement
    extends AutoDisposeStreamProviderElement<List<M3UItem>>
    with FindAllSeriesRef {
  _FindAllSeriesProviderElement(super.provider);

  @override
  String? get groupTitle => (origin as FindAllSeriesProvider).groupTitle;
}

String _$findAllSeriesGroupsHash() =>
    r'c281a7ae81fed3ea8f18ba768351d535f3fb801a';

/// See also [findAllSeriesGroups].
@ProviderFor(findAllSeriesGroups)
final findAllSeriesGroupsProvider =
    AutoDisposeStreamProvider<List<M3UItem>>.internal(
  findAllSeriesGroups,
  name: r'findAllSeriesGroupsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$findAllSeriesGroupsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FindAllSeriesGroupsRef = AutoDisposeStreamProviderRef<List<M3UItem>>;
String _$findAllItemsOfSeriesAndSeasonHash() =>
    r'c1c976dac2cf0f8163e0befc0f84111760005816';

/// See also [findAllItemsOfSeriesAndSeason].
@ProviderFor(findAllItemsOfSeriesAndSeason)
const findAllItemsOfSeriesAndSeasonProvider =
    FindAllItemsOfSeriesAndSeasonFamily();

/// See also [findAllItemsOfSeriesAndSeason].
class FindAllItemsOfSeriesAndSeasonFamily
    extends Family<AsyncValue<List<M3UItem>>> {
  /// See also [findAllItemsOfSeriesAndSeason].
  const FindAllItemsOfSeriesAndSeasonFamily();

  /// See also [findAllItemsOfSeriesAndSeason].
  FindAllItemsOfSeriesAndSeasonProvider call({
    required String series,
    required String season,
  }) {
    return FindAllItemsOfSeriesAndSeasonProvider(
      series: series,
      season: season,
    );
  }

  @override
  FindAllItemsOfSeriesAndSeasonProvider getProviderOverride(
    covariant FindAllItemsOfSeriesAndSeasonProvider provider,
  ) {
    return call(
      series: provider.series,
      season: provider.season,
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
  String? get name => r'findAllItemsOfSeriesAndSeasonProvider';
}

/// See also [findAllItemsOfSeriesAndSeason].
class FindAllItemsOfSeriesAndSeasonProvider
    extends AutoDisposeStreamProvider<List<M3UItem>> {
  /// See also [findAllItemsOfSeriesAndSeason].
  FindAllItemsOfSeriesAndSeasonProvider({
    required String series,
    required String season,
  }) : this._internal(
          (ref) => findAllItemsOfSeriesAndSeason(
            ref as FindAllItemsOfSeriesAndSeasonRef,
            series: series,
            season: season,
          ),
          from: findAllItemsOfSeriesAndSeasonProvider,
          name: r'findAllItemsOfSeriesAndSeasonProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findAllItemsOfSeriesAndSeasonHash,
          dependencies: FindAllItemsOfSeriesAndSeasonFamily._dependencies,
          allTransitiveDependencies:
              FindAllItemsOfSeriesAndSeasonFamily._allTransitiveDependencies,
          series: series,
          season: season,
        );

  FindAllItemsOfSeriesAndSeasonProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.series,
    required this.season,
  }) : super.internal();

  final String series;
  final String season;

  @override
  Override overrideWith(
    Stream<List<M3UItem>> Function(FindAllItemsOfSeriesAndSeasonRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindAllItemsOfSeriesAndSeasonProvider._internal(
        (ref) => create(ref as FindAllItemsOfSeriesAndSeasonRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        series: series,
        season: season,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<M3UItem>> createElement() {
    return _FindAllItemsOfSeriesAndSeasonProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindAllItemsOfSeriesAndSeasonProvider &&
        other.series == series &&
        other.season == season;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, series.hashCode);
    hash = _SystemHash.combine(hash, season.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FindAllItemsOfSeriesAndSeasonRef
    on AutoDisposeStreamProviderRef<List<M3UItem>> {
  /// The parameter `series` of this provider.
  String get series;

  /// The parameter `season` of this provider.
  String get season;
}

class _FindAllItemsOfSeriesAndSeasonProviderElement
    extends AutoDisposeStreamProviderElement<List<M3UItem>>
    with FindAllItemsOfSeriesAndSeasonRef {
  _FindAllItemsOfSeriesAndSeasonProviderElement(super.provider);

  @override
  String get series => (origin as FindAllItemsOfSeriesAndSeasonProvider).series;
  @override
  String get season => (origin as FindAllItemsOfSeriesAndSeasonProvider).season;
}

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

String _$findAllChannelsHash() => r'bf243895a58df86515a51d6a5c73829028507404';

/// See also [findAllChannels].
@ProviderFor(findAllChannels)
const findAllChannelsProvider = FindAllChannelsFamily();

/// See also [findAllChannels].
class FindAllChannelsFamily extends Family<AsyncValue<List<M3UItem>>> {
  /// See also [findAllChannels].
  const FindAllChannelsFamily();

  /// See also [findAllChannels].
  FindAllChannelsProvider call({
    String? groupTitle,
  }) {
    return FindAllChannelsProvider(
      groupTitle: groupTitle,
    );
  }

  @override
  FindAllChannelsProvider getProviderOverride(
    covariant FindAllChannelsProvider provider,
  ) {
    return call(
      groupTitle: provider.groupTitle,
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
class FindAllChannelsProvider extends AutoDisposeStreamProvider<List<M3UItem>> {
  /// See also [findAllChannels].
  FindAllChannelsProvider({
    String? groupTitle,
  }) : this._internal(
          (ref) => findAllChannels(
            ref as FindAllChannelsRef,
            groupTitle: groupTitle,
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
          groupTitle: groupTitle,
        );

  FindAllChannelsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.groupTitle,
  }) : super.internal();

  final String? groupTitle;

  @override
  Override overrideWith(
    Stream<List<M3UItem>> Function(FindAllChannelsRef provider) create,
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
        groupTitle: groupTitle,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<M3UItem>> createElement() {
    return _FindAllChannelsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindAllChannelsProvider && other.groupTitle == groupTitle;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupTitle.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FindAllChannelsRef on AutoDisposeStreamProviderRef<List<M3UItem>> {
  /// The parameter `groupTitle` of this provider.
  String? get groupTitle;
}

class _FindAllChannelsProviderElement
    extends AutoDisposeStreamProviderElement<List<M3UItem>>
    with FindAllChannelsRef {
  _FindAllChannelsProviderElement(super.provider);

  @override
  String? get groupTitle => (origin as FindAllChannelsProvider).groupTitle;
}

String _$findAllChannelGroupsHash() =>
    r'6bf4ac3bb6ab9483419a94297fe6fea66d3aa39c';

/// See also [findAllChannelGroups].
@ProviderFor(findAllChannelGroups)
final findAllChannelGroupsProvider =
    AutoDisposeStreamProvider<List<M3UItem>>.internal(
  findAllChannelGroups,
  name: r'findAllChannelGroupsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$findAllChannelGroupsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FindAllChannelGroupsRef = AutoDisposeStreamProviderRef<List<M3UItem>>;
String _$findAllMovieGroupsHash() =>
    r'5b2766eeef09ad9f803100f0e28cdaf12ab330e6';

/// See also [findAllMovieGroups].
@ProviderFor(findAllMovieGroups)
final findAllMovieGroupsProvider =
    AutoDisposeStreamProvider<List<M3UItem>>.internal(
  findAllMovieGroups,
  name: r'findAllMovieGroupsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$findAllMovieGroupsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FindAllMovieGroupsRef = AutoDisposeStreamProviderRef<List<M3UItem>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
