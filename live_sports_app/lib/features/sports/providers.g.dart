// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Sports)
final sportsProvider = SportsProvider._();

final class SportsProvider extends $NotifierProvider<Sports, SportsState> {
  SportsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sportsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sportsHash();

  @$internal
  @override
  Sports create() => Sports();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SportsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SportsState>(value),
    );
  }
}

String _$sportsHash() => r'ce59230dde8d298646d3f8553777e5e3cb7e1d76';

abstract class _$Sports extends $Notifier<SportsState> {
  SportsState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<SportsState, SportsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SportsState, SportsState>,
              SportsState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
