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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
