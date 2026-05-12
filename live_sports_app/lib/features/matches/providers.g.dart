// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MatchCommentary)
final matchCommentaryProvider = MatchCommentaryFamily._();

final class MatchCommentaryProvider
    extends $AsyncNotifierProvider<MatchCommentary, List<Commentary>> {
  MatchCommentaryProvider._({
    required MatchCommentaryFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'matchCommentaryProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$matchCommentaryHash();

  @override
  String toString() {
    return r'matchCommentaryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  MatchCommentary create() => MatchCommentary();

  @override
  bool operator ==(Object other) {
    return other is MatchCommentaryProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$matchCommentaryHash() => r'7726aa7fddcef83f796935837081907f54af6344';

final class MatchCommentaryFamily extends $Family
    with
        $ClassFamilyOverride<
          MatchCommentary,
          AsyncValue<List<Commentary>>,
          List<Commentary>,
          FutureOr<List<Commentary>>,
          String
        > {
  MatchCommentaryFamily._()
    : super(
        retry: null,
        name: r'matchCommentaryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MatchCommentaryProvider call(String matchId) =>
      MatchCommentaryProvider._(argument: matchId, from: this);

  @override
  String toString() => r'matchCommentaryProvider';
}

abstract class _$MatchCommentary extends $AsyncNotifier<List<Commentary>> {
  late final _$args = ref.$arg as String;
  String get matchId => _$args;

  FutureOr<List<Commentary>> build(String matchId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<Commentary>>, List<Commentary>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Commentary>>, List<Commentary>>,
              AsyncValue<List<Commentary>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

@ProviderFor(SelectedSportId)
final selectedSportIdProvider = SelectedSportIdProvider._();

final class SelectedSportIdProvider
    extends $NotifierProvider<SelectedSportId, String> {
  SelectedSportIdProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedSportIdProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedSportIdHash();

  @$internal
  @override
  SelectedSportId create() => SelectedSportId();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$selectedSportIdHash() => r'4a960f9be0794057b91494d3bc0abe596771e1b0';

abstract class _$SelectedSportId extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(SelectedLeagueId)
final selectedLeagueIdProvider = SelectedLeagueIdProvider._();

final class SelectedLeagueIdProvider
    extends $NotifierProvider<SelectedLeagueId, String?> {
  SelectedLeagueIdProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedLeagueIdProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedLeagueIdHash();

  @$internal
  @override
  SelectedLeagueId create() => SelectedLeagueId();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$selectedLeagueIdHash() => r'0410875953a3711149217600a1764f5f18b15338';

abstract class _$SelectedLeagueId extends $Notifier<String?> {
  String? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<String?, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String?, String?>,
              String?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(LiveMatches)
final liveMatchesProvider = LiveMatchesProvider._();

final class LiveMatchesProvider
    extends $NotifierProvider<LiveMatches, LiveMatchesState> {
  LiveMatchesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'liveMatchesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$liveMatchesHash();

  @$internal
  @override
  LiveMatches create() => LiveMatches();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LiveMatchesState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LiveMatchesState>(value),
    );
  }
}

String _$liveMatchesHash() => r'1c24a07bc94263ba150fc015d0c3f0d78c737349';

abstract class _$LiveMatches extends $Notifier<LiveMatchesState> {
  LiveMatchesState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<LiveMatchesState, LiveMatchesState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<LiveMatchesState, LiveMatchesState>,
              LiveMatchesState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(Results)
final resultsProvider = ResultsProvider._();

final class ResultsProvider extends $NotifierProvider<Results, ResultsState> {
  ResultsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'resultsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$resultsHash();

  @$internal
  @override
  Results create() => Results();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ResultsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ResultsState>(value),
    );
  }
}

String _$resultsHash() => r'65cacd7071583dde14bd9d87589823a5be6ee9ac';

abstract class _$Results extends $Notifier<ResultsState> {
  ResultsState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ResultsState, ResultsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ResultsState, ResultsState>,
              ResultsState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(MatchDetail)
final matchDetailProvider = MatchDetailFamily._();

final class MatchDetailProvider
    extends $NotifierProvider<MatchDetail, MatchDetailState> {
  MatchDetailProvider._({
    required MatchDetailFamily super.from,
    required MatchDetailArgs super.argument,
  }) : super(
         retry: null,
         name: r'matchDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$matchDetailHash();

  @override
  String toString() {
    return r'matchDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  MatchDetail create() => MatchDetail();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MatchDetailState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MatchDetailState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MatchDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$matchDetailHash() => r'56761f5e6aaf6eea295b37470bca49b51733fb61';

final class MatchDetailFamily extends $Family
    with
        $ClassFamilyOverride<
          MatchDetail,
          MatchDetailState,
          MatchDetailState,
          MatchDetailState,
          MatchDetailArgs
        > {
  MatchDetailFamily._()
    : super(
        retry: null,
        name: r'matchDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MatchDetailProvider call(MatchDetailArgs args) =>
      MatchDetailProvider._(argument: args, from: this);

  @override
  String toString() => r'matchDetailProvider';
}

abstract class _$MatchDetail extends $Notifier<MatchDetailState> {
  late final _$args = ref.$arg as MatchDetailArgs;
  MatchDetailArgs get args => _$args;

  MatchDetailState build(MatchDetailArgs args);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<MatchDetailState, MatchDetailState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MatchDetailState, MatchDetailState>,
              MatchDetailState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
