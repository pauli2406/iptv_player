// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$findAllChannelsHash() => r'49fc74a72f5f6c998acb32407c793806e57233cf';

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

String _$findChannelHash() => r'335a806831ca74dd0a18f03001ec14efb6e62948';

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
String _$updateChannelProgressHash() =>
    r'6d50dee26ed079a8e80c1d567c834c4a5ab93b52';

/// See also [updateChannelProgress].
@ProviderFor(updateChannelProgress)
const updateChannelProgressProvider = UpdateChannelProgressFamily();

/// See also [updateChannelProgress].
class UpdateChannelProgressFamily extends Family {
  /// See also [updateChannelProgress].
  const UpdateChannelProgressFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'updateChannelProgressProvider';

  /// See also [updateChannelProgress].
  UpdateChannelProgressProvider call(
    int movieId,
  ) {
    return UpdateChannelProgressProvider(
      movieId,
    );
  }

  @visibleForOverriding
  @override
  UpdateChannelProgressProvider getProviderOverride(
    covariant UpdateChannelProgressProvider provider,
  ) {
    return call(
      provider.movieId,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<void> Function(UpdateChannelProgressRef ref) create) {
    return _$UpdateChannelProgressFamilyOverride(this, create);
  }
}

class _$UpdateChannelProgressFamilyOverride implements FamilyOverride {
  _$UpdateChannelProgressFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<void> Function(UpdateChannelProgressRef ref) create;

  @override
  final UpdateChannelProgressFamily overriddenFamily;

  @override
  UpdateChannelProgressProvider getProviderOverride(
    covariant UpdateChannelProgressProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [updateChannelProgress].
class UpdateChannelProgressProvider extends AutoDisposeFutureProvider<void> {
  /// See also [updateChannelProgress].
  UpdateChannelProgressProvider(
    int movieId,
  ) : this._internal(
          (ref) => updateChannelProgress(
            ref as UpdateChannelProgressRef,
            movieId,
          ),
          from: updateChannelProgressProvider,
          name: r'updateChannelProgressProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateChannelProgressHash,
          dependencies: UpdateChannelProgressFamily._dependencies,
          allTransitiveDependencies:
              UpdateChannelProgressFamily._allTransitiveDependencies,
          movieId: movieId,
        );

  UpdateChannelProgressProvider._internal(
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
  Override overrideWith(
    FutureOr<void> Function(UpdateChannelProgressRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateChannelProgressProvider._internal(
        (ref) => create(ref as UpdateChannelProgressRef),
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
  AutoDisposeFutureProviderElement<void> createElement() {
    return _UpdateChannelProgressProviderElement(this);
  }

  UpdateChannelProgressProvider _copyWith(
    FutureOr<void> Function(UpdateChannelProgressRef ref) create,
  ) {
    return UpdateChannelProgressProvider._internal(
      (ref) => create(ref as UpdateChannelProgressRef),
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
    return other is UpdateChannelProgressProvider && other.movieId == movieId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, movieId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpdateChannelProgressRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `movieId` of this provider.
  int get movieId;
}

class _UpdateChannelProgressProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with UpdateChannelProgressRef {
  _UpdateChannelProgressProviderElement(super.provider);

  @override
  int get movieId => (origin as UpdateChannelProgressProvider).movieId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
