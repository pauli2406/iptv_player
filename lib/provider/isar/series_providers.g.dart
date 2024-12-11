// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$seriesInfoHash() => r'007da51039ba42af3c654de27554eeb09b0de0b7';

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

/// See also [seriesInfo].
@ProviderFor(seriesInfo)
const seriesInfoProvider = SeriesInfoFamily();

/// See also [seriesInfo].
class SeriesInfoFamily extends Family {
  /// See also [seriesInfo].
  const SeriesInfoFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'seriesInfoProvider';

  /// See also [seriesInfo].
  SeriesInfoProvider call({
    required int seriesId,
  }) {
    return SeriesInfoProvider(
      seriesId: seriesId,
    );
  }

  @visibleForOverriding
  @override
  SeriesInfoProvider getProviderOverride(
    covariant SeriesInfoProvider provider,
  ) {
    return call(
      seriesId: provider.seriesId,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<XTremeCodeSeriesInfo?> Function(SeriesInfoRef ref) create) {
    return _$SeriesInfoFamilyOverride(this, create);
  }
}

class _$SeriesInfoFamilyOverride implements FamilyOverride {
  _$SeriesInfoFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<XTremeCodeSeriesInfo?> Function(SeriesInfoRef ref) create;

  @override
  final SeriesInfoFamily overriddenFamily;

  @override
  SeriesInfoProvider getProviderOverride(
    covariant SeriesInfoProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [seriesInfo].
class SeriesInfoProvider
    extends AutoDisposeFutureProvider<XTremeCodeSeriesInfo?> {
  /// See also [seriesInfo].
  SeriesInfoProvider({
    required int seriesId,
  }) : this._internal(
          (ref) => seriesInfo(
            ref as SeriesInfoRef,
            seriesId: seriesId,
          ),
          from: seriesInfoProvider,
          name: r'seriesInfoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$seriesInfoHash,
          dependencies: SeriesInfoFamily._dependencies,
          allTransitiveDependencies:
              SeriesInfoFamily._allTransitiveDependencies,
          seriesId: seriesId,
        );

  SeriesInfoProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.seriesId,
  }) : super.internal();

  final int seriesId;

  @override
  Override overrideWith(
    FutureOr<XTremeCodeSeriesInfo?> Function(SeriesInfoRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SeriesInfoProvider._internal(
        (ref) => create(ref as SeriesInfoRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        seriesId: seriesId,
      ),
    );
  }

  @override
  ({
    int seriesId,
  }) get argument {
    return (seriesId: seriesId,);
  }

  @override
  AutoDisposeFutureProviderElement<XTremeCodeSeriesInfo?> createElement() {
    return _SeriesInfoProviderElement(this);
  }

  SeriesInfoProvider _copyWith(
    FutureOr<XTremeCodeSeriesInfo?> Function(SeriesInfoRef ref) create,
  ) {
    return SeriesInfoProvider._internal(
      (ref) => create(ref as SeriesInfoRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      seriesId: seriesId,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SeriesInfoProvider && other.seriesId == seriesId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, seriesId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SeriesInfoRef on AutoDisposeFutureProviderRef<XTremeCodeSeriesInfo?> {
  /// The parameter `seriesId` of this provider.
  int get seriesId;
}

class _SeriesInfoProviderElement
    extends AutoDisposeFutureProviderElement<XTremeCodeSeriesInfo?>
    with SeriesInfoRef {
  _SeriesInfoProviderElement(super.provider);

  @override
  int get seriesId => (origin as SeriesInfoProvider).seriesId;
}

String _$seriesHash() => r'c13dc49774aaa1bbc2e33736468d16456fad102f';

/// See also [series].
@ProviderFor(series)
const seriesProvider = SeriesFamily();

/// See also [series].
class SeriesFamily extends Family {
  /// See also [series].
  const SeriesFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'seriesProvider';

  /// See also [series].
  SeriesProvider call({
    required int seriesId,
  }) {
    return SeriesProvider(
      seriesId: seriesId,
    );
  }

  @visibleForOverriding
  @override
  SeriesProvider getProviderOverride(
    covariant SeriesProvider provider,
  ) {
    return call(
      seriesId: provider.seriesId,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(Stream<SeriesItem> Function(SeriesRef ref) create) {
    return _$SeriesFamilyOverride(this, create);
  }
}

class _$SeriesFamilyOverride implements FamilyOverride {
  _$SeriesFamilyOverride(this.overriddenFamily, this.create);

  final Stream<SeriesItem> Function(SeriesRef ref) create;

  @override
  final SeriesFamily overriddenFamily;

  @override
  SeriesProvider getProviderOverride(
    covariant SeriesProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [series].
class SeriesProvider extends AutoDisposeStreamProvider<SeriesItem> {
  /// See also [series].
  SeriesProvider({
    required int seriesId,
  }) : this._internal(
          (ref) => series(
            ref as SeriesRef,
            seriesId: seriesId,
          ),
          from: seriesProvider,
          name: r'seriesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$seriesHash,
          dependencies: SeriesFamily._dependencies,
          allTransitiveDependencies: SeriesFamily._allTransitiveDependencies,
          seriesId: seriesId,
        );

  SeriesProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.seriesId,
  }) : super.internal();

  final int seriesId;

  @override
  Override overrideWith(
    Stream<SeriesItem> Function(SeriesRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SeriesProvider._internal(
        (ref) => create(ref as SeriesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        seriesId: seriesId,
      ),
    );
  }

  @override
  ({
    int seriesId,
  }) get argument {
    return (seriesId: seriesId,);
  }

  @override
  AutoDisposeStreamProviderElement<SeriesItem> createElement() {
    return _SeriesProviderElement(this);
  }

  SeriesProvider _copyWith(
    Stream<SeriesItem> Function(SeriesRef ref) create,
  ) {
    return SeriesProvider._internal(
      (ref) => create(ref as SeriesRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      seriesId: seriesId,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SeriesProvider && other.seriesId == seriesId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, seriesId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SeriesRef on AutoDisposeStreamProviderRef<SeriesItem> {
  /// The parameter `seriesId` of this provider.
  int get seriesId;
}

class _SeriesProviderElement
    extends AutoDisposeStreamProviderElement<SeriesItem> with SeriesRef {
  _SeriesProviderElement(super.provider);

  @override
  int get seriesId => (origin as SeriesProvider).seriesId;
}

String _$findAllSeriesHash() => r'e0ff29ea7e54e0cbe2e5eeb755e434b7e8dfb952';

/// See also [findAllSeries].
@ProviderFor(findAllSeries)
const findAllSeriesProvider = FindAllSeriesFamily();

/// See also [findAllSeries].
class FindAllSeriesFamily extends Family {
  /// See also [findAllSeries].
  const FindAllSeriesFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'findAllSeriesProvider';

  /// See also [findAllSeries].
  FindAllSeriesProvider call({
    ItemCategory? category,
  }) {
    return FindAllSeriesProvider(
      category: category,
    );
  }

  @visibleForOverriding
  @override
  FindAllSeriesProvider getProviderOverride(
    covariant FindAllSeriesProvider provider,
  ) {
    return call(
      category: provider.category,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      Stream<List<SeriesItem>> Function(FindAllSeriesRef ref) create) {
    return _$FindAllSeriesFamilyOverride(this, create);
  }
}

class _$FindAllSeriesFamilyOverride implements FamilyOverride {
  _$FindAllSeriesFamilyOverride(this.overriddenFamily, this.create);

  final Stream<List<SeriesItem>> Function(FindAllSeriesRef ref) create;

  @override
  final FindAllSeriesFamily overriddenFamily;

  @override
  FindAllSeriesProvider getProviderOverride(
    covariant FindAllSeriesProvider provider,
  ) {
    return provider._copyWith(create);
  }
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
    Stream<List<SeriesItem>> Function(FindAllSeriesRef ref) create,
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
  ({
    ItemCategory? category,
  }) get argument {
    return (category: category,);
  }

  @override
  AutoDisposeStreamProviderElement<List<SeriesItem>> createElement() {
    return _FindAllSeriesProviderElement(this);
  }

  FindAllSeriesProvider _copyWith(
    Stream<List<SeriesItem>> Function(FindAllSeriesRef ref) create,
  ) {
    return FindAllSeriesProvider._internal(
      (ref) => create(ref as FindAllSeriesRef),
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

String _$findSeriesHash() => r'8dcb791af11d9be05cc7a6ce8df422d53d764aad';

/// See also [findSeries].
@ProviderFor(findSeries)
const findSeriesProvider = FindSeriesFamily();

/// See also [findSeries].
class FindSeriesFamily extends Family {
  /// See also [findSeries].
  const FindSeriesFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'findSeriesProvider';

  /// See also [findSeries].
  FindSeriesProvider call({
    required int seriesId,
  }) {
    return FindSeriesProvider(
      seriesId: seriesId,
    );
  }

  @visibleForOverriding
  @override
  FindSeriesProvider getProviderOverride(
    covariant FindSeriesProvider provider,
  ) {
    return call(
      seriesId: provider.seriesId,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(Stream<SeriesItem> Function(FindSeriesRef ref) create) {
    return _$FindSeriesFamilyOverride(this, create);
  }
}

class _$FindSeriesFamilyOverride implements FamilyOverride {
  _$FindSeriesFamilyOverride(this.overriddenFamily, this.create);

  final Stream<SeriesItem> Function(FindSeriesRef ref) create;

  @override
  final FindSeriesFamily overriddenFamily;

  @override
  FindSeriesProvider getProviderOverride(
    covariant FindSeriesProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [findSeries].
class FindSeriesProvider extends AutoDisposeStreamProvider<SeriesItem> {
  /// See also [findSeries].
  FindSeriesProvider({
    required int seriesId,
  }) : this._internal(
          (ref) => findSeries(
            ref as FindSeriesRef,
            seriesId: seriesId,
          ),
          from: findSeriesProvider,
          name: r'findSeriesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findSeriesHash,
          dependencies: FindSeriesFamily._dependencies,
          allTransitiveDependencies:
              FindSeriesFamily._allTransitiveDependencies,
          seriesId: seriesId,
        );

  FindSeriesProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.seriesId,
  }) : super.internal();

  final int seriesId;

  @override
  Override overrideWith(
    Stream<SeriesItem> Function(FindSeriesRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindSeriesProvider._internal(
        (ref) => create(ref as FindSeriesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        seriesId: seriesId,
      ),
    );
  }

  @override
  ({
    int seriesId,
  }) get argument {
    return (seriesId: seriesId,);
  }

  @override
  AutoDisposeStreamProviderElement<SeriesItem> createElement() {
    return _FindSeriesProviderElement(this);
  }

  FindSeriesProvider _copyWith(
    Stream<SeriesItem> Function(FindSeriesRef ref) create,
  ) {
    return FindSeriesProvider._internal(
      (ref) => create(ref as FindSeriesRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      seriesId: seriesId,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FindSeriesProvider && other.seriesId == seriesId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, seriesId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FindSeriesRef on AutoDisposeStreamProviderRef<SeriesItem> {
  /// The parameter `seriesId` of this provider.
  int get seriesId;
}

class _FindSeriesProviderElement
    extends AutoDisposeStreamProviderElement<SeriesItem> with FindSeriesRef {
  _FindSeriesProviderElement(super.provider);

  @override
  int get seriesId => (origin as FindSeriesProvider).seriesId;
}

String _$findSeriesInfoHash() => r'3478ca839e12537e15a4c78ed2d4e6c238006216';

/// See also [findSeriesInfo].
@ProviderFor(findSeriesInfo)
const findSeriesInfoProvider = FindSeriesInfoFamily();

/// See also [findSeriesInfo].
class FindSeriesInfoFamily extends Family {
  /// See also [findSeriesInfo].
  const FindSeriesInfoFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'findSeriesInfoProvider';

  /// See also [findSeriesInfo].
  FindSeriesInfoProvider call({
    required int seriesId,
  }) {
    return FindSeriesInfoProvider(
      seriesId: seriesId,
    );
  }

  @visibleForOverriding
  @override
  FindSeriesInfoProvider getProviderOverride(
    covariant FindSeriesInfoProvider provider,
  ) {
    return call(
      seriesId: provider.seriesId,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<XTremeCodeSeriesInfo?> Function(FindSeriesInfoRef ref) create) {
    return _$FindSeriesInfoFamilyOverride(this, create);
  }
}

class _$FindSeriesInfoFamilyOverride implements FamilyOverride {
  _$FindSeriesInfoFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<XTremeCodeSeriesInfo?> Function(FindSeriesInfoRef ref) create;

  @override
  final FindSeriesInfoFamily overriddenFamily;

  @override
  FindSeriesInfoProvider getProviderOverride(
    covariant FindSeriesInfoProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [findSeriesInfo].
class FindSeriesInfoProvider
    extends AutoDisposeFutureProvider<XTremeCodeSeriesInfo?> {
  /// See also [findSeriesInfo].
  FindSeriesInfoProvider({
    required int seriesId,
  }) : this._internal(
          (ref) => findSeriesInfo(
            ref as FindSeriesInfoRef,
            seriesId: seriesId,
          ),
          from: findSeriesInfoProvider,
          name: r'findSeriesInfoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findSeriesInfoHash,
          dependencies: FindSeriesInfoFamily._dependencies,
          allTransitiveDependencies:
              FindSeriesInfoFamily._allTransitiveDependencies,
          seriesId: seriesId,
        );

  FindSeriesInfoProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.seriesId,
  }) : super.internal();

  final int seriesId;

  @override
  Override overrideWith(
    FutureOr<XTremeCodeSeriesInfo?> Function(FindSeriesInfoRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindSeriesInfoProvider._internal(
        (ref) => create(ref as FindSeriesInfoRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        seriesId: seriesId,
      ),
    );
  }

  @override
  ({
    int seriesId,
  }) get argument {
    return (seriesId: seriesId,);
  }

  @override
  AutoDisposeFutureProviderElement<XTremeCodeSeriesInfo?> createElement() {
    return _FindSeriesInfoProviderElement(this);
  }

  FindSeriesInfoProvider _copyWith(
    FutureOr<XTremeCodeSeriesInfo?> Function(FindSeriesInfoRef ref) create,
  ) {
    return FindSeriesInfoProvider._internal(
      (ref) => create(ref as FindSeriesInfoRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      seriesId: seriesId,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FindSeriesInfoProvider && other.seriesId == seriesId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, seriesId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FindSeriesInfoRef on AutoDisposeFutureProviderRef<XTremeCodeSeriesInfo?> {
  /// The parameter `seriesId` of this provider.
  int get seriesId;
}

class _FindSeriesInfoProviderElement
    extends AutoDisposeFutureProviderElement<XTremeCodeSeriesInfo?>
    with FindSeriesInfoRef {
  _FindSeriesInfoProviderElement(super.provider);

  @override
  int get seriesId => (origin as FindSeriesInfoProvider).seriesId;
}

String _$findAllSeriesEpisodesHash() =>
    r'12e2c1699ba3857ef75530d6e4dc17c1a05d6230';

/// See also [findAllSeriesEpisodes].
@ProviderFor(findAllSeriesEpisodes)
const findAllSeriesEpisodesProvider = FindAllSeriesEpisodesFamily();

/// See also [findAllSeriesEpisodes].
class FindAllSeriesEpisodesFamily extends Family {
  /// See also [findAllSeriesEpisodes].
  const FindAllSeriesEpisodesFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'findAllSeriesEpisodesProvider';

  /// See also [findAllSeriesEpisodes].
  FindAllSeriesEpisodesProvider call({
    required int seriesId,
    ItemCategory? season,
  }) {
    return FindAllSeriesEpisodesProvider(
      seriesId: seriesId,
      season: season,
    );
  }

  @visibleForOverriding
  @override
  FindAllSeriesEpisodesProvider getProviderOverride(
    covariant FindAllSeriesEpisodesProvider provider,
  ) {
    return call(
      seriesId: provider.seriesId,
      season: provider.season,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<List<ChannelViewModel>> Function(FindAllSeriesEpisodesRef ref)
          create) {
    return _$FindAllSeriesEpisodesFamilyOverride(this, create);
  }
}

class _$FindAllSeriesEpisodesFamilyOverride implements FamilyOverride {
  _$FindAllSeriesEpisodesFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<List<ChannelViewModel>> Function(FindAllSeriesEpisodesRef ref)
      create;

  @override
  final FindAllSeriesEpisodesFamily overriddenFamily;

  @override
  FindAllSeriesEpisodesProvider getProviderOverride(
    covariant FindAllSeriesEpisodesProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [findAllSeriesEpisodes].
class FindAllSeriesEpisodesProvider
    extends AutoDisposeFutureProvider<List<ChannelViewModel>> {
  /// See also [findAllSeriesEpisodes].
  FindAllSeriesEpisodesProvider({
    required int seriesId,
    ItemCategory? season,
  }) : this._internal(
          (ref) => findAllSeriesEpisodes(
            ref as FindAllSeriesEpisodesRef,
            seriesId: seriesId,
            season: season,
          ),
          from: findAllSeriesEpisodesProvider,
          name: r'findAllSeriesEpisodesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findAllSeriesEpisodesHash,
          dependencies: FindAllSeriesEpisodesFamily._dependencies,
          allTransitiveDependencies:
              FindAllSeriesEpisodesFamily._allTransitiveDependencies,
          seriesId: seriesId,
          season: season,
        );

  FindAllSeriesEpisodesProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.seriesId,
    required this.season,
  }) : super.internal();

  final int seriesId;
  final ItemCategory? season;

  @override
  Override overrideWith(
    FutureOr<List<ChannelViewModel>> Function(FindAllSeriesEpisodesRef ref)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindAllSeriesEpisodesProvider._internal(
        (ref) => create(ref as FindAllSeriesEpisodesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        seriesId: seriesId,
        season: season,
      ),
    );
  }

  @override
  ({
    int seriesId,
    ItemCategory? season,
  }) get argument {
    return (
      seriesId: seriesId,
      season: season,
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ChannelViewModel>> createElement() {
    return _FindAllSeriesEpisodesProviderElement(this);
  }

  FindAllSeriesEpisodesProvider _copyWith(
    FutureOr<List<ChannelViewModel>> Function(FindAllSeriesEpisodesRef ref)
        create,
  ) {
    return FindAllSeriesEpisodesProvider._internal(
      (ref) => create(ref as FindAllSeriesEpisodesRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      seriesId: seriesId,
      season: season,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FindAllSeriesEpisodesProvider &&
        other.seriesId == seriesId &&
        other.season == season;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, seriesId.hashCode);
    hash = _SystemHash.combine(hash, season.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FindAllSeriesEpisodesRef
    on AutoDisposeFutureProviderRef<List<ChannelViewModel>> {
  /// The parameter `seriesId` of this provider.
  int get seriesId;

  /// The parameter `season` of this provider.
  ItemCategory? get season;
}

class _FindAllSeriesEpisodesProviderElement
    extends AutoDisposeFutureProviderElement<List<ChannelViewModel>>
    with FindAllSeriesEpisodesRef {
  _FindAllSeriesEpisodesProviderElement(super.provider);

  @override
  int get seriesId => (origin as FindAllSeriesEpisodesProvider).seriesId;
  @override
  ItemCategory? get season => (origin as FindAllSeriesEpisodesProvider).season;
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
String _$getSeriesProgressHash() => r'53c2485e37c2d78164fcc548dca55cf060f29237';

/// See also [getSeriesProgress].
@ProviderFor(getSeriesProgress)
const getSeriesProgressProvider = GetSeriesProgressFamily();

/// See also [getSeriesProgress].
class GetSeriesProgressFamily extends Family {
  /// See also [getSeriesProgress].
  const GetSeriesProgressFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getSeriesProgressProvider';

  /// See also [getSeriesProgress].
  GetSeriesProgressProvider call({
    required int seriesId,
  }) {
    return GetSeriesProgressProvider(
      seriesId: seriesId,
    );
  }

  @visibleForOverriding
  @override
  GetSeriesProgressProvider getProviderOverride(
    covariant GetSeriesProgressProvider provider,
  ) {
    return call(
      seriesId: provider.seriesId,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(double? Function(GetSeriesProgressRef ref) create) {
    return _$GetSeriesProgressFamilyOverride(this, create);
  }
}

class _$GetSeriesProgressFamilyOverride implements FamilyOverride {
  _$GetSeriesProgressFamilyOverride(this.overriddenFamily, this.create);

  final double? Function(GetSeriesProgressRef ref) create;

  @override
  final GetSeriesProgressFamily overriddenFamily;

  @override
  GetSeriesProgressProvider getProviderOverride(
    covariant GetSeriesProgressProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [getSeriesProgress].
class GetSeriesProgressProvider extends AutoDisposeProvider<double?> {
  /// See also [getSeriesProgress].
  GetSeriesProgressProvider({
    required int seriesId,
  }) : this._internal(
          (ref) => getSeriesProgress(
            ref as GetSeriesProgressRef,
            seriesId: seriesId,
          ),
          from: getSeriesProgressProvider,
          name: r'getSeriesProgressProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getSeriesProgressHash,
          dependencies: GetSeriesProgressFamily._dependencies,
          allTransitiveDependencies:
              GetSeriesProgressFamily._allTransitiveDependencies,
          seriesId: seriesId,
        );

  GetSeriesProgressProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.seriesId,
  }) : super.internal();

  final int seriesId;

  @override
  Override overrideWith(
    double? Function(GetSeriesProgressRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetSeriesProgressProvider._internal(
        (ref) => create(ref as GetSeriesProgressRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        seriesId: seriesId,
      ),
    );
  }

  @override
  ({
    int seriesId,
  }) get argument {
    return (seriesId: seriesId,);
  }

  @override
  AutoDisposeProviderElement<double?> createElement() {
    return _GetSeriesProgressProviderElement(this);
  }

  GetSeriesProgressProvider _copyWith(
    double? Function(GetSeriesProgressRef ref) create,
  ) {
    return GetSeriesProgressProvider._internal(
      (ref) => create(ref as GetSeriesProgressRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      seriesId: seriesId,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetSeriesProgressProvider && other.seriesId == seriesId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, seriesId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetSeriesProgressRef on AutoDisposeProviderRef<double?> {
  /// The parameter `seriesId` of this provider.
  int get seriesId;
}

class _GetSeriesProgressProviderElement
    extends AutoDisposeProviderElement<double?> with GetSeriesProgressRef {
  _GetSeriesProgressProviderElement(super.provider);

  @override
  int get seriesId => (origin as GetSeriesProgressProvider).seriesId;
}

String _$seriesProgressHash() => r'74f8f4dd6c3219336fe10a71460607c175cf62ab';

abstract class _$SeriesProgress extends BuildlessAutoDisposeNotifier<bool> {
  late final int seriesId;

  bool build(
    int seriesId,
  );
}

/// See also [SeriesProgress].
@ProviderFor(SeriesProgress)
const seriesProgressProvider = SeriesProgressFamily();

/// See also [SeriesProgress].
class SeriesProgressFamily extends Family {
  /// See also [SeriesProgress].
  const SeriesProgressFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'seriesProgressProvider';

  /// See also [SeriesProgress].
  SeriesProgressProvider call(
    int seriesId,
  ) {
    return SeriesProgressProvider(
      seriesId,
    );
  }

  @visibleForOverriding
  @override
  SeriesProgressProvider getProviderOverride(
    covariant SeriesProgressProvider provider,
  ) {
    return call(
      provider.seriesId,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(SeriesProgress Function() create) {
    return _$SeriesProgressFamilyOverride(this, create);
  }
}

class _$SeriesProgressFamilyOverride implements FamilyOverride {
  _$SeriesProgressFamilyOverride(this.overriddenFamily, this.create);

  final SeriesProgress Function() create;

  @override
  final SeriesProgressFamily overriddenFamily;

  @override
  SeriesProgressProvider getProviderOverride(
    covariant SeriesProgressProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [SeriesProgress].
class SeriesProgressProvider
    extends AutoDisposeNotifierProviderImpl<SeriesProgress, bool> {
  /// See also [SeriesProgress].
  SeriesProgressProvider(
    int seriesId,
  ) : this._internal(
          () => SeriesProgress()..seriesId = seriesId,
          from: seriesProgressProvider,
          name: r'seriesProgressProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$seriesProgressHash,
          dependencies: SeriesProgressFamily._dependencies,
          allTransitiveDependencies:
              SeriesProgressFamily._allTransitiveDependencies,
          seriesId: seriesId,
        );

  SeriesProgressProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.seriesId,
  }) : super.internal();

  final int seriesId;

  @override
  bool runNotifierBuild(
    covariant SeriesProgress notifier,
  ) {
    return notifier.build(
      seriesId,
    );
  }

  @override
  Override overrideWith(SeriesProgress Function() create) {
    return ProviderOverride(
      origin: this,
      override: SeriesProgressProvider._internal(
        () => create()..seriesId = seriesId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        seriesId: seriesId,
      ),
    );
  }

  @override
  (int,) get argument {
    return (seriesId,);
  }

  @override
  AutoDisposeNotifierProviderElement<SeriesProgress, bool> createElement() {
    return _SeriesProgressProviderElement(this);
  }

  SeriesProgressProvider _copyWith(
    SeriesProgress Function() create,
  ) {
    return SeriesProgressProvider._internal(
      () => create()..seriesId = seriesId,
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      seriesId: seriesId,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SeriesProgressProvider && other.seriesId == seriesId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, seriesId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SeriesProgressRef on AutoDisposeNotifierProviderRef<bool> {
  /// The parameter `seriesId` of this provider.
  int get seriesId;
}

class _SeriesProgressProviderElement
    extends AutoDisposeNotifierProviderElement<SeriesProgress, bool>
    with SeriesProgressRef {
  _SeriesProgressProviderElement(super.provider);

  @override
  int get seriesId => (origin as SeriesProgressProvider).seriesId;
}

String _$episodeProgressHash() => r'b8ecf40b987e6211ac53c7d2a246eefea4d2af6f';

abstract class _$EpisodeProgress extends BuildlessAutoDisposeNotifier<double?> {
  late final int episodeId;

  double? build(
    int episodeId,
  );
}

/// See also [EpisodeProgress].
@ProviderFor(EpisodeProgress)
const episodeProgressProvider = EpisodeProgressFamily();

/// See also [EpisodeProgress].
class EpisodeProgressFamily extends Family {
  /// See also [EpisodeProgress].
  const EpisodeProgressFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'episodeProgressProvider';

  /// See also [EpisodeProgress].
  EpisodeProgressProvider call(
    int episodeId,
  ) {
    return EpisodeProgressProvider(
      episodeId,
    );
  }

  @visibleForOverriding
  @override
  EpisodeProgressProvider getProviderOverride(
    covariant EpisodeProgressProvider provider,
  ) {
    return call(
      provider.episodeId,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(EpisodeProgress Function() create) {
    return _$EpisodeProgressFamilyOverride(this, create);
  }
}

class _$EpisodeProgressFamilyOverride implements FamilyOverride {
  _$EpisodeProgressFamilyOverride(this.overriddenFamily, this.create);

  final EpisodeProgress Function() create;

  @override
  final EpisodeProgressFamily overriddenFamily;

  @override
  EpisodeProgressProvider getProviderOverride(
    covariant EpisodeProgressProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [EpisodeProgress].
class EpisodeProgressProvider
    extends AutoDisposeNotifierProviderImpl<EpisodeProgress, double?> {
  /// See also [EpisodeProgress].
  EpisodeProgressProvider(
    int episodeId,
  ) : this._internal(
          () => EpisodeProgress()..episodeId = episodeId,
          from: episodeProgressProvider,
          name: r'episodeProgressProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$episodeProgressHash,
          dependencies: EpisodeProgressFamily._dependencies,
          allTransitiveDependencies:
              EpisodeProgressFamily._allTransitiveDependencies,
          episodeId: episodeId,
        );

  EpisodeProgressProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.episodeId,
  }) : super.internal();

  final int episodeId;

  @override
  double? runNotifierBuild(
    covariant EpisodeProgress notifier,
  ) {
    return notifier.build(
      episodeId,
    );
  }

  @override
  Override overrideWith(EpisodeProgress Function() create) {
    return ProviderOverride(
      origin: this,
      override: EpisodeProgressProvider._internal(
        () => create()..episodeId = episodeId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        episodeId: episodeId,
      ),
    );
  }

  @override
  (int,) get argument {
    return (episodeId,);
  }

  @override
  AutoDisposeNotifierProviderElement<EpisodeProgress, double?> createElement() {
    return _EpisodeProgressProviderElement(this);
  }

  EpisodeProgressProvider _copyWith(
    EpisodeProgress Function() create,
  ) {
    return EpisodeProgressProvider._internal(
      () => create()..episodeId = episodeId,
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      episodeId: episodeId,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is EpisodeProgressProvider && other.episodeId == episodeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, episodeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin EpisodeProgressRef on AutoDisposeNotifierProviderRef<double?> {
  /// The parameter `episodeId` of this provider.
  int get episodeId;
}

class _EpisodeProgressProviderElement
    extends AutoDisposeNotifierProviderElement<EpisodeProgress, double?>
    with EpisodeProgressRef {
  _EpisodeProgressProviderElement(super.provider);

  @override
  int get episodeId => (origin as EpisodeProgressProvider).episodeId;
}

String _$lastWatchedEpisodeHash() =>
    r'cbe8c2e3fcc5c103618089e53da2609688e0b7ed';

abstract class _$LastWatchedEpisode extends BuildlessAutoDisposeNotifier<int?> {
  late final int seriesId;

  int? build(
    int seriesId,
  );
}

/// See also [LastWatchedEpisode].
@ProviderFor(LastWatchedEpisode)
const lastWatchedEpisodeProvider = LastWatchedEpisodeFamily();

/// See also [LastWatchedEpisode].
class LastWatchedEpisodeFamily extends Family {
  /// See also [LastWatchedEpisode].
  const LastWatchedEpisodeFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'lastWatchedEpisodeProvider';

  /// See also [LastWatchedEpisode].
  LastWatchedEpisodeProvider call(
    int seriesId,
  ) {
    return LastWatchedEpisodeProvider(
      seriesId,
    );
  }

  @visibleForOverriding
  @override
  LastWatchedEpisodeProvider getProviderOverride(
    covariant LastWatchedEpisodeProvider provider,
  ) {
    return call(
      provider.seriesId,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(LastWatchedEpisode Function() create) {
    return _$LastWatchedEpisodeFamilyOverride(this, create);
  }
}

class _$LastWatchedEpisodeFamilyOverride implements FamilyOverride {
  _$LastWatchedEpisodeFamilyOverride(this.overriddenFamily, this.create);

  final LastWatchedEpisode Function() create;

  @override
  final LastWatchedEpisodeFamily overriddenFamily;

  @override
  LastWatchedEpisodeProvider getProviderOverride(
    covariant LastWatchedEpisodeProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [LastWatchedEpisode].
class LastWatchedEpisodeProvider
    extends AutoDisposeNotifierProviderImpl<LastWatchedEpisode, int?> {
  /// See also [LastWatchedEpisode].
  LastWatchedEpisodeProvider(
    int seriesId,
  ) : this._internal(
          () => LastWatchedEpisode()..seriesId = seriesId,
          from: lastWatchedEpisodeProvider,
          name: r'lastWatchedEpisodeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$lastWatchedEpisodeHash,
          dependencies: LastWatchedEpisodeFamily._dependencies,
          allTransitiveDependencies:
              LastWatchedEpisodeFamily._allTransitiveDependencies,
          seriesId: seriesId,
        );

  LastWatchedEpisodeProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.seriesId,
  }) : super.internal();

  final int seriesId;

  @override
  int? runNotifierBuild(
    covariant LastWatchedEpisode notifier,
  ) {
    return notifier.build(
      seriesId,
    );
  }

  @override
  Override overrideWith(LastWatchedEpisode Function() create) {
    return ProviderOverride(
      origin: this,
      override: LastWatchedEpisodeProvider._internal(
        () => create()..seriesId = seriesId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        seriesId: seriesId,
      ),
    );
  }

  @override
  (int,) get argument {
    return (seriesId,);
  }

  @override
  AutoDisposeNotifierProviderElement<LastWatchedEpisode, int?> createElement() {
    return _LastWatchedEpisodeProviderElement(this);
  }

  LastWatchedEpisodeProvider _copyWith(
    LastWatchedEpisode Function() create,
  ) {
    return LastWatchedEpisodeProvider._internal(
      () => create()..seriesId = seriesId,
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      seriesId: seriesId,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is LastWatchedEpisodeProvider && other.seriesId == seriesId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, seriesId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LastWatchedEpisodeRef on AutoDisposeNotifierProviderRef<int?> {
  /// The parameter `seriesId` of this provider.
  int get seriesId;
}

class _LastWatchedEpisodeProviderElement
    extends AutoDisposeNotifierProviderElement<LastWatchedEpisode, int?>
    with LastWatchedEpisodeRef {
  _LastWatchedEpisodeProviderElement(super.provider);

  @override
  int get seriesId => (origin as LastWatchedEpisodeProvider).seriesId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
