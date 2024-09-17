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
class ClearDownloadAndPersistActivePlaylistItemsFamily extends Family {
  /// See also [clearDownloadAndPersistActivePlaylistItems].
  const ClearDownloadAndPersistActivePlaylistItemsFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'clearDownloadAndPersistActivePlaylistItemsProvider';

  /// See also [clearDownloadAndPersistActivePlaylistItems].
  ClearDownloadAndPersistActivePlaylistItemsProvider call({
    bool? forced,
  }) {
    return ClearDownloadAndPersistActivePlaylistItemsProvider(
      forced: forced,
    );
  }

  @visibleForOverriding
  @override
  ClearDownloadAndPersistActivePlaylistItemsProvider getProviderOverride(
    covariant ClearDownloadAndPersistActivePlaylistItemsProvider provider,
  ) {
    return call(
      forced: provider.forced,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<bool> Function(ClearDownloadAndPersistActivePlaylistItemsRef ref)
          create) {
    return _$ClearDownloadAndPersistActivePlaylistItemsFamilyOverride(
        this, create);
  }
}

class _$ClearDownloadAndPersistActivePlaylistItemsFamilyOverride
    implements FamilyOverride {
  _$ClearDownloadAndPersistActivePlaylistItemsFamilyOverride(
      this.overriddenFamily, this.create);

  final FutureOr<bool> Function(
      ClearDownloadAndPersistActivePlaylistItemsRef ref) create;

  @override
  final ClearDownloadAndPersistActivePlaylistItemsFamily overriddenFamily;

  @override
  ClearDownloadAndPersistActivePlaylistItemsProvider getProviderOverride(
    covariant ClearDownloadAndPersistActivePlaylistItemsProvider provider,
  ) {
    return provider._copyWith(create);
  }
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
    super.create, {
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
    FutureOr<bool> Function(ClearDownloadAndPersistActivePlaylistItemsRef ref)
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
  ({
    bool? forced,
  }) get argument {
    return (forced: forced,);
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _ClearDownloadAndPersistActivePlaylistItemsProviderElement(this);
  }

  ClearDownloadAndPersistActivePlaylistItemsProvider _copyWith(
    FutureOr<bool> Function(ClearDownloadAndPersistActivePlaylistItemsRef ref)
        create,
  ) {
    return ClearDownloadAndPersistActivePlaylistItemsProvider._internal(
      (ref) => create(ref as ClearDownloadAndPersistActivePlaylistItemsRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      forced: forced,
    );
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

String _$findAllMoviesHash() => r'ce4d228c497fcfd931b4a983889551f950386d2c';

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

String _$findMovieHash() => r'e7f4e822850c7cc43b92f0fa2a4a48d3dde9d57a';

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
  Override overrideWith(ChannelViewModel Function(FindMovieRef ref) create) {
    return _$FindMovieFamilyOverride(this, create);
  }
}

class _$FindMovieFamilyOverride implements FamilyOverride {
  _$FindMovieFamilyOverride(this.overriddenFamily, this.create);

  final ChannelViewModel Function(FindMovieRef ref) create;

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
class FindMovieProvider extends AutoDisposeProvider<ChannelViewModel> {
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
    ChannelViewModel Function(FindMovieRef ref) create,
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
  AutoDisposeProviderElement<ChannelViewModel> createElement() {
    return _FindMovieProviderElement(this);
  }

  FindMovieProvider _copyWith(
    ChannelViewModel Function(FindMovieRef ref) create,
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

mixin FindMovieRef on AutoDisposeProviderRef<ChannelViewModel> {
  /// The parameter `streamId` of this provider.
  int get streamId;
}

class _FindMovieProviderElement
    extends AutoDisposeProviderElement<ChannelViewModel> with FindMovieRef {
  _FindMovieProviderElement(super.provider);

  @override
  int get streamId => (origin as FindMovieProvider).streamId;
}

String _$findChannelHash() => r'4776b5a9ae7897038ceed88ee793da654bb8912c';

/// See also [findChannel].
@ProviderFor(findChannel)
const findChannelProvider = FindChannelFamily();

/// See also [findChannel].
class FindChannelFamily extends Family {
  /// See also [findChannel].
  const FindChannelFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'findChannelProvider';

  /// See also [findChannel].
  FindChannelProvider call({
    required int streamId,
  }) {
    return FindChannelProvider(
      streamId: streamId,
    );
  }

  @visibleForOverriding
  @override
  FindChannelProvider getProviderOverride(
    covariant FindChannelProvider provider,
  ) {
    return call(
      streamId: provider.streamId,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(ChannelViewModel Function(FindChannelRef ref) create) {
    return _$FindChannelFamilyOverride(this, create);
  }
}

class _$FindChannelFamilyOverride implements FamilyOverride {
  _$FindChannelFamilyOverride(this.overriddenFamily, this.create);

  final ChannelViewModel Function(FindChannelRef ref) create;

  @override
  final FindChannelFamily overriddenFamily;

  @override
  FindChannelProvider getProviderOverride(
    covariant FindChannelProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [findChannel].
class FindChannelProvider extends AutoDisposeProvider<ChannelViewModel> {
  /// See also [findChannel].
  FindChannelProvider({
    required int streamId,
  }) : this._internal(
          (ref) => findChannel(
            ref as FindChannelRef,
            streamId: streamId,
          ),
          from: findChannelProvider,
          name: r'findChannelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findChannelHash,
          dependencies: FindChannelFamily._dependencies,
          allTransitiveDependencies:
              FindChannelFamily._allTransitiveDependencies,
          streamId: streamId,
        );

  FindChannelProvider._internal(
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
    ChannelViewModel Function(FindChannelRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindChannelProvider._internal(
        (ref) => create(ref as FindChannelRef),
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
  AutoDisposeProviderElement<ChannelViewModel> createElement() {
    return _FindChannelProviderElement(this);
  }

  FindChannelProvider _copyWith(
    ChannelViewModel Function(FindChannelRef ref) create,
  ) {
    return FindChannelProvider._internal(
      (ref) => create(ref as FindChannelRef),
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
    return other is FindChannelProvider && other.streamId == streamId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, streamId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FindChannelRef on AutoDisposeProviderRef<ChannelViewModel> {
  /// The parameter `streamId` of this provider.
  int get streamId;
}

class _FindChannelProviderElement
    extends AutoDisposeProviderElement<ChannelViewModel> with FindChannelRef {
  _FindChannelProviderElement(super.provider);

  @override
  int get streamId => (origin as FindChannelProvider).streamId;
}

String _$findAllChannelsHash() => r'5c2a9c45d332ca8b3aeabad7552322f43503abd1';

/// See also [findAllChannels].
@ProviderFor(findAllChannels)
const findAllChannelsProvider = FindAllChannelsFamily();

/// See also [findAllChannels].
class FindAllChannelsFamily extends Family {
  /// See also [findAllChannels].
  const FindAllChannelsFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'findAllChannelsProvider';

  /// See also [findAllChannels].
  FindAllChannelsProvider call({
    ItemCategory? category,
  }) {
    return FindAllChannelsProvider(
      category: category,
    );
  }

  @visibleForOverriding
  @override
  FindAllChannelsProvider getProviderOverride(
    covariant FindAllChannelsProvider provider,
  ) {
    return call(
      category: provider.category,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      Stream<List<ChannelViewModel>> Function(FindAllChannelsRef ref) create) {
    return _$FindAllChannelsFamilyOverride(this, create);
  }
}

class _$FindAllChannelsFamilyOverride implements FamilyOverride {
  _$FindAllChannelsFamilyOverride(this.overriddenFamily, this.create);

  final Stream<List<ChannelViewModel>> Function(FindAllChannelsRef ref) create;

  @override
  final FindAllChannelsFamily overriddenFamily;

  @override
  FindAllChannelsProvider getProviderOverride(
    covariant FindAllChannelsProvider provider,
  ) {
    return provider._copyWith(create);
  }
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
    Stream<List<ChannelViewModel>> Function(FindAllChannelsRef ref) create,
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
  ({
    ItemCategory? category,
  }) get argument {
    return (category: category,);
  }

  @override
  AutoDisposeStreamProviderElement<List<ChannelViewModel>> createElement() {
    return _FindAllChannelsProviderElement(this);
  }

  FindAllChannelsProvider _copyWith(
    Stream<List<ChannelViewModel>> Function(FindAllChannelsRef ref) create,
  ) {
    return FindAllChannelsProvider._internal(
      (ref) => create(ref as FindAllChannelsRef),
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
class FindAllSeasonsOfSeriesFamily extends Family {
  /// See also [findAllSeasonsOfSeries].
  const FindAllSeasonsOfSeriesFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'findAllSeasonsOfSeriesProvider';

  /// See also [findAllSeasonsOfSeries].
  FindAllSeasonsOfSeriesProvider call({
    required String series,
  }) {
    return FindAllSeasonsOfSeriesProvider(
      series: series,
    );
  }

  @visibleForOverriding
  @override
  FindAllSeasonsOfSeriesProvider getProviderOverride(
    covariant FindAllSeasonsOfSeriesProvider provider,
  ) {
    return call(
      series: provider.series,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      Stream<List<M3UItem>> Function(FindAllSeasonsOfSeriesRef ref) create) {
    return _$FindAllSeasonsOfSeriesFamilyOverride(this, create);
  }
}

class _$FindAllSeasonsOfSeriesFamilyOverride implements FamilyOverride {
  _$FindAllSeasonsOfSeriesFamilyOverride(this.overriddenFamily, this.create);

  final Stream<List<M3UItem>> Function(FindAllSeasonsOfSeriesRef ref) create;

  @override
  final FindAllSeasonsOfSeriesFamily overriddenFamily;

  @override
  FindAllSeasonsOfSeriesProvider getProviderOverride(
    covariant FindAllSeasonsOfSeriesProvider provider,
  ) {
    return provider._copyWith(create);
  }
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
    super.create, {
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
    Stream<List<M3UItem>> Function(FindAllSeasonsOfSeriesRef ref) create,
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
  ({
    String series,
  }) get argument {
    return (series: series,);
  }

  @override
  AutoDisposeStreamProviderElement<List<M3UItem>> createElement() {
    return _FindAllSeasonsOfSeriesProviderElement(this);
  }

  FindAllSeasonsOfSeriesProvider _copyWith(
    Stream<List<M3UItem>> Function(FindAllSeasonsOfSeriesRef ref) create,
  ) {
    return FindAllSeasonsOfSeriesProvider._internal(
      (ref) => create(ref as FindAllSeasonsOfSeriesRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      series: series,
    );
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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
