// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm3u_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$m3uServiceHash() => r'f8e3f5625df4e0bac5ea4b71b04e93c50db1cc9a';

/// Core service provider
///
/// Copied from [m3uService].
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
String _$clearDownloadAndPersistActivePlaylistItemsHash() =>
    r'd5021d948f6ef7acba4cdb77d29d9f6ff95cb088';

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

/// Service operations
///
/// Copied from [clearDownloadAndPersistActivePlaylistItems].
@ProviderFor(clearDownloadAndPersistActivePlaylistItems)
const clearDownloadAndPersistActivePlaylistItemsProvider =
    ClearDownloadAndPersistActivePlaylistItemsFamily();

/// Service operations
///
/// Copied from [clearDownloadAndPersistActivePlaylistItems].
class ClearDownloadAndPersistActivePlaylistItemsFamily extends Family {
  /// Service operations
  ///
  /// Copied from [clearDownloadAndPersistActivePlaylistItems].
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

  /// Service operations
  ///
  /// Copied from [clearDownloadAndPersistActivePlaylistItems].
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

/// Service operations
///
/// Copied from [clearDownloadAndPersistActivePlaylistItems].
class ClearDownloadAndPersistActivePlaylistItemsProvider
    extends AutoDisposeFutureProvider<bool> {
  /// Service operations
  ///
  /// Copied from [clearDownloadAndPersistActivePlaylistItems].
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

String _$findAllChannelsHash() => r'5b8c6cd21a383d5cb5146555839cff78b4014a11';

/// Channel related providers
///
/// Copied from [findAllChannels].
@ProviderFor(findAllChannels)
const findAllChannelsProvider = FindAllChannelsFamily();

/// Channel related providers
///
/// Copied from [findAllChannels].
class FindAllChannelsFamily extends Family {
  /// Channel related providers
  ///
  /// Copied from [findAllChannels].
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

  /// Channel related providers
  ///
  /// Copied from [findAllChannels].
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

/// Channel related providers
///
/// Copied from [findAllChannels].
class FindAllChannelsProvider
    extends AutoDisposeStreamProvider<List<ChannelViewModel>> {
  /// Channel related providers
  ///
  /// Copied from [findAllChannels].
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

String _$findChannelHash() => r'4469ef468aa79a478d8ce594cddf3394a23472cb';

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

String _$findAlternativeChannelsHash() =>
    r'ee796f397fefea7ea741e522aba35b2bb765b6e0';

/// See also [findAlternativeChannels].
@ProviderFor(findAlternativeChannels)
const findAlternativeChannelsProvider = FindAlternativeChannelsFamily();

/// See also [findAlternativeChannels].
class FindAlternativeChannelsFamily extends Family {
  /// See also [findAlternativeChannels].
  const FindAlternativeChannelsFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'findAlternativeChannelsProvider';

  /// See also [findAlternativeChannels].
  FindAlternativeChannelsProvider call(
    String epgTitle,
    int currentChannelId,
  ) {
    return FindAlternativeChannelsProvider(
      epgTitle,
      currentChannelId,
    );
  }

  @visibleForOverriding
  @override
  FindAlternativeChannelsProvider getProviderOverride(
    covariant FindAlternativeChannelsProvider provider,
  ) {
    return call(
      provider.epgTitle,
      provider.currentChannelId,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      List<ChannelViewModel> Function(FindAlternativeChannelsRef ref) create) {
    return _$FindAlternativeChannelsFamilyOverride(this, create);
  }
}

class _$FindAlternativeChannelsFamilyOverride implements FamilyOverride {
  _$FindAlternativeChannelsFamilyOverride(this.overriddenFamily, this.create);

  final List<ChannelViewModel> Function(FindAlternativeChannelsRef ref) create;

  @override
  final FindAlternativeChannelsFamily overriddenFamily;

  @override
  FindAlternativeChannelsProvider getProviderOverride(
    covariant FindAlternativeChannelsProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [findAlternativeChannels].
class FindAlternativeChannelsProvider
    extends AutoDisposeProvider<List<ChannelViewModel>> {
  /// See also [findAlternativeChannels].
  FindAlternativeChannelsProvider(
    String epgTitle,
    int currentChannelId,
  ) : this._internal(
          (ref) => findAlternativeChannels(
            ref as FindAlternativeChannelsRef,
            epgTitle,
            currentChannelId,
          ),
          from: findAlternativeChannelsProvider,
          name: r'findAlternativeChannelsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findAlternativeChannelsHash,
          dependencies: FindAlternativeChannelsFamily._dependencies,
          allTransitiveDependencies:
              FindAlternativeChannelsFamily._allTransitiveDependencies,
          epgTitle: epgTitle,
          currentChannelId: currentChannelId,
        );

  FindAlternativeChannelsProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.epgTitle,
    required this.currentChannelId,
  }) : super.internal();

  final String epgTitle;
  final int currentChannelId;

  @override
  Override overrideWith(
    List<ChannelViewModel> Function(FindAlternativeChannelsRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindAlternativeChannelsProvider._internal(
        (ref) => create(ref as FindAlternativeChannelsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        epgTitle: epgTitle,
        currentChannelId: currentChannelId,
      ),
    );
  }

  @override
  (
    String,
    int,
  ) get argument {
    return (
      epgTitle,
      currentChannelId,
    );
  }

  @override
  AutoDisposeProviderElement<List<ChannelViewModel>> createElement() {
    return _FindAlternativeChannelsProviderElement(this);
  }

  FindAlternativeChannelsProvider _copyWith(
    List<ChannelViewModel> Function(FindAlternativeChannelsRef ref) create,
  ) {
    return FindAlternativeChannelsProvider._internal(
      (ref) => create(ref as FindAlternativeChannelsRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      epgTitle: epgTitle,
      currentChannelId: currentChannelId,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FindAlternativeChannelsProvider &&
        other.epgTitle == epgTitle &&
        other.currentChannelId == currentChannelId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, epgTitle.hashCode);
    hash = _SystemHash.combine(hash, currentChannelId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FindAlternativeChannelsRef
    on AutoDisposeProviderRef<List<ChannelViewModel>> {
  /// The parameter `epgTitle` of this provider.
  String get epgTitle;

  /// The parameter `currentChannelId` of this provider.
  int get currentChannelId;
}

class _FindAlternativeChannelsProviderElement
    extends AutoDisposeProviderElement<List<ChannelViewModel>>
    with FindAlternativeChannelsRef {
  _FindAlternativeChannelsProviderElement(super.provider);

  @override
  String get epgTitle => (origin as FindAlternativeChannelsProvider).epgTitle;
  @override
  int get currentChannelId =>
      (origin as FindAlternativeChannelsProvider).currentChannelId;
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
String _$findAllMoviesHash() => r'5683786ab9a0b784c0602d11f7f116aea24426ac';

/// Movie related providers
///
/// Copied from [findAllMovies].
@ProviderFor(findAllMovies)
const findAllMoviesProvider = FindAllMoviesFamily();

/// Movie related providers
///
/// Copied from [findAllMovies].
class FindAllMoviesFamily extends Family {
  /// Movie related providers
  ///
  /// Copied from [findAllMovies].
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

  /// Movie related providers
  ///
  /// Copied from [findAllMovies].
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

/// Movie related providers
///
/// Copied from [findAllMovies].
class FindAllMoviesProvider
    extends AutoDisposeStreamProvider<List<ChannelViewModel>> {
  /// Movie related providers
  ///
  /// Copied from [findAllMovies].
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

String _$findAllSeriesHash() => r'e0ff29ea7e54e0cbe2e5eeb755e434b7e8dfb952';

/// Series related providers
///
/// Copied from [findAllSeries].
@ProviderFor(findAllSeries)
const findAllSeriesProvider = FindAllSeriesFamily();

/// Series related providers
///
/// Copied from [findAllSeries].
class FindAllSeriesFamily extends Family {
  /// Series related providers
  ///
  /// Copied from [findAllSeries].
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

  /// Series related providers
  ///
  /// Copied from [findAllSeries].
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

/// Series related providers
///
/// Copied from [findAllSeries].
class FindAllSeriesProvider
    extends AutoDisposeStreamProvider<List<SeriesItem>> {
  /// Series related providers
  ///
  /// Copied from [findAllSeries].
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
    r'2d78cb4954c84883f31c9a674395dbfd6d89ab45';

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
String _$findSeriesWithInfoHash() =>
    r'16b7825ac880b7509875e3165ce2f5ba36a382e6';

/// Combined series provider
///
/// Copied from [findSeriesWithInfo].
@ProviderFor(findSeriesWithInfo)
const findSeriesWithInfoProvider = FindSeriesWithInfoFamily();

/// Combined series provider
///
/// Copied from [findSeriesWithInfo].
class FindSeriesWithInfoFamily extends Family {
  /// Combined series provider
  ///
  /// Copied from [findSeriesWithInfo].
  const FindSeriesWithInfoFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'findSeriesWithInfoProvider';

  /// Combined series provider
  ///
  /// Copied from [findSeriesWithInfo].
  FindSeriesWithInfoProvider call({
    required int seriesId,
  }) {
    return FindSeriesWithInfoProvider(
      seriesId: seriesId,
    );
  }

  @visibleForOverriding
  @override
  FindSeriesWithInfoProvider getProviderOverride(
    covariant FindSeriesWithInfoProvider provider,
  ) {
    return call(
      seriesId: provider.seriesId,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      Stream<SeriesWithInfo> Function(FindSeriesWithInfoRef ref) create) {
    return _$FindSeriesWithInfoFamilyOverride(this, create);
  }
}

class _$FindSeriesWithInfoFamilyOverride implements FamilyOverride {
  _$FindSeriesWithInfoFamilyOverride(this.overriddenFamily, this.create);

  final Stream<SeriesWithInfo> Function(FindSeriesWithInfoRef ref) create;

  @override
  final FindSeriesWithInfoFamily overriddenFamily;

  @override
  FindSeriesWithInfoProvider getProviderOverride(
    covariant FindSeriesWithInfoProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// Combined series provider
///
/// Copied from [findSeriesWithInfo].
class FindSeriesWithInfoProvider
    extends AutoDisposeStreamProvider<SeriesWithInfo> {
  /// Combined series provider
  ///
  /// Copied from [findSeriesWithInfo].
  FindSeriesWithInfoProvider({
    required int seriesId,
  }) : this._internal(
          (ref) => findSeriesWithInfo(
            ref as FindSeriesWithInfoRef,
            seriesId: seriesId,
          ),
          from: findSeriesWithInfoProvider,
          name: r'findSeriesWithInfoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findSeriesWithInfoHash,
          dependencies: FindSeriesWithInfoFamily._dependencies,
          allTransitiveDependencies:
              FindSeriesWithInfoFamily._allTransitiveDependencies,
          seriesId: seriesId,
        );

  FindSeriesWithInfoProvider._internal(
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
    Stream<SeriesWithInfo> Function(FindSeriesWithInfoRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindSeriesWithInfoProvider._internal(
        (ref) => create(ref as FindSeriesWithInfoRef),
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
  AutoDisposeStreamProviderElement<SeriesWithInfo> createElement() {
    return _FindSeriesWithInfoProviderElement(this);
  }

  FindSeriesWithInfoProvider _copyWith(
    Stream<SeriesWithInfo> Function(FindSeriesWithInfoRef ref) create,
  ) {
    return FindSeriesWithInfoProvider._internal(
      (ref) => create(ref as FindSeriesWithInfoRef),
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
    return other is FindSeriesWithInfoProvider && other.seriesId == seriesId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, seriesId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FindSeriesWithInfoRef on AutoDisposeStreamProviderRef<SeriesWithInfo> {
  /// The parameter `seriesId` of this provider.
  int get seriesId;
}

class _FindSeriesWithInfoProviderElement
    extends AutoDisposeStreamProviderElement<SeriesWithInfo>
    with FindSeriesWithInfoRef {
  _FindSeriesWithInfoProviderElement(super.provider);

  @override
  int get seriesId => (origin as FindSeriesWithInfoProvider).seriesId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
