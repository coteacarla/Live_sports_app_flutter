// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MatchModel {
  String get id => throw _privateConstructorUsedError;
  String get leagueId => throw _privateConstructorUsedError;
  String get sportId => throw _privateConstructorUsedError;
  TeamModel get homeTeam => throw _privateConstructorUsedError;
  TeamModel get awayTeam => throw _privateConstructorUsedError;
  DateTime get scheduledAt => throw _privateConstructorUsedError;
  MatchStatus get status => throw _privateConstructorUsedError;
  int? get homeScore => throw _privateConstructorUsedError;
  int? get awayScore => throw _privateConstructorUsedError;
  int? get elapsed => throw _privateConstructorUsedError;
  String? get venue => throw _privateConstructorUsedError;
  String? get round => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MatchModelCopyWith<MatchModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchModelCopyWith<$Res> {
  factory $MatchModelCopyWith(
          MatchModel value, $Res Function(MatchModel) then) =
      _$MatchModelCopyWithImpl<$Res, MatchModel>;
  @useResult
  $Res call(
      {String id,
      String leagueId,
      String sportId,
      TeamModel homeTeam,
      TeamModel awayTeam,
      DateTime scheduledAt,
      MatchStatus status,
      int? homeScore,
      int? awayScore,
      int? elapsed,
      String? venue,
      String? round});

  $TeamModelCopyWith<$Res> get homeTeam;
  $TeamModelCopyWith<$Res> get awayTeam;
}

/// @nodoc
class _$MatchModelCopyWithImpl<$Res, $Val extends MatchModel>
    implements $MatchModelCopyWith<$Res> {
  _$MatchModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? leagueId = null,
    Object? sportId = null,
    Object? homeTeam = null,
    Object? awayTeam = null,
    Object? scheduledAt = null,
    Object? status = null,
    Object? homeScore = freezed,
    Object? awayScore = freezed,
    Object? elapsed = freezed,
    Object? venue = freezed,
    Object? round = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      leagueId: null == leagueId
          ? _value.leagueId
          : leagueId // ignore: cast_nullable_to_non_nullable
              as String,
      sportId: null == sportId
          ? _value.sportId
          : sportId // ignore: cast_nullable_to_non_nullable
              as String,
      homeTeam: null == homeTeam
          ? _value.homeTeam
          : homeTeam // ignore: cast_nullable_to_non_nullable
              as TeamModel,
      awayTeam: null == awayTeam
          ? _value.awayTeam
          : awayTeam // ignore: cast_nullable_to_non_nullable
              as TeamModel,
      scheduledAt: null == scheduledAt
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MatchStatus,
      homeScore: freezed == homeScore
          ? _value.homeScore
          : homeScore // ignore: cast_nullable_to_non_nullable
              as int?,
      awayScore: freezed == awayScore
          ? _value.awayScore
          : awayScore // ignore: cast_nullable_to_non_nullable
              as int?,
      elapsed: freezed == elapsed
          ? _value.elapsed
          : elapsed // ignore: cast_nullable_to_non_nullable
              as int?,
      venue: freezed == venue
          ? _value.venue
          : venue // ignore: cast_nullable_to_non_nullable
              as String?,
      round: freezed == round
          ? _value.round
          : round // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TeamModelCopyWith<$Res> get homeTeam {
    return $TeamModelCopyWith<$Res>(_value.homeTeam, (value) {
      return _then(_value.copyWith(homeTeam: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TeamModelCopyWith<$Res> get awayTeam {
    return $TeamModelCopyWith<$Res>(_value.awayTeam, (value) {
      return _then(_value.copyWith(awayTeam: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MatchModelImplCopyWith<$Res>
    implements $MatchModelCopyWith<$Res> {
  factory _$$MatchModelImplCopyWith(
          _$MatchModelImpl value, $Res Function(_$MatchModelImpl) then) =
      __$$MatchModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String leagueId,
      String sportId,
      TeamModel homeTeam,
      TeamModel awayTeam,
      DateTime scheduledAt,
      MatchStatus status,
      int? homeScore,
      int? awayScore,
      int? elapsed,
      String? venue,
      String? round});

  @override
  $TeamModelCopyWith<$Res> get homeTeam;
  @override
  $TeamModelCopyWith<$Res> get awayTeam;
}

/// @nodoc
class __$$MatchModelImplCopyWithImpl<$Res>
    extends _$MatchModelCopyWithImpl<$Res, _$MatchModelImpl>
    implements _$$MatchModelImplCopyWith<$Res> {
  __$$MatchModelImplCopyWithImpl(
      _$MatchModelImpl _value, $Res Function(_$MatchModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? leagueId = null,
    Object? sportId = null,
    Object? homeTeam = null,
    Object? awayTeam = null,
    Object? scheduledAt = null,
    Object? status = null,
    Object? homeScore = freezed,
    Object? awayScore = freezed,
    Object? elapsed = freezed,
    Object? venue = freezed,
    Object? round = freezed,
  }) {
    return _then(_$MatchModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      leagueId: null == leagueId
          ? _value.leagueId
          : leagueId // ignore: cast_nullable_to_non_nullable
              as String,
      sportId: null == sportId
          ? _value.sportId
          : sportId // ignore: cast_nullable_to_non_nullable
              as String,
      homeTeam: null == homeTeam
          ? _value.homeTeam
          : homeTeam // ignore: cast_nullable_to_non_nullable
              as TeamModel,
      awayTeam: null == awayTeam
          ? _value.awayTeam
          : awayTeam // ignore: cast_nullable_to_non_nullable
              as TeamModel,
      scheduledAt: null == scheduledAt
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MatchStatus,
      homeScore: freezed == homeScore
          ? _value.homeScore
          : homeScore // ignore: cast_nullable_to_non_nullable
              as int?,
      awayScore: freezed == awayScore
          ? _value.awayScore
          : awayScore // ignore: cast_nullable_to_non_nullable
              as int?,
      elapsed: freezed == elapsed
          ? _value.elapsed
          : elapsed // ignore: cast_nullable_to_non_nullable
              as int?,
      venue: freezed == venue
          ? _value.venue
          : venue // ignore: cast_nullable_to_non_nullable
              as String?,
      round: freezed == round
          ? _value.round
          : round // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$MatchModelImpl extends _MatchModel {
  const _$MatchModelImpl(
      {required this.id,
      required this.leagueId,
      required this.sportId,
      required this.homeTeam,
      required this.awayTeam,
      required this.scheduledAt,
      required this.status,
      this.homeScore,
      this.awayScore,
      this.elapsed,
      this.venue,
      this.round})
      : super._();

  @override
  final String id;
  @override
  final String leagueId;
  @override
  final String sportId;
  @override
  final TeamModel homeTeam;
  @override
  final TeamModel awayTeam;
  @override
  final DateTime scheduledAt;
  @override
  final MatchStatus status;
  @override
  final int? homeScore;
  @override
  final int? awayScore;
  @override
  final int? elapsed;
  @override
  final String? venue;
  @override
  final String? round;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchModelImplCopyWith<_$MatchModelImpl> get copyWith =>
      __$$MatchModelImplCopyWithImpl<_$MatchModelImpl>(this, _$identity);
}

abstract class _MatchModel extends MatchModel {
  const factory _MatchModel(
      {required final String id,
      required final String leagueId,
      required final String sportId,
      required final TeamModel homeTeam,
      required final TeamModel awayTeam,
      required final DateTime scheduledAt,
      required final MatchStatus status,
      final int? homeScore,
      final int? awayScore,
      final int? elapsed,
      final String? venue,
      final String? round}) = _$MatchModelImpl;
  const _MatchModel._() : super._();

  @override
  String get id;
  @override
  String get leagueId;
  @override
  String get sportId;
  @override
  TeamModel get homeTeam;
  @override
  TeamModel get awayTeam;
  @override
  DateTime get scheduledAt;
  @override
  MatchStatus get status;
  @override
  int? get homeScore;
  @override
  int? get awayScore;
  @override
  int? get elapsed;
  @override
  String? get venue;
  @override
  String? get round;
  @override
  @JsonKey(ignore: true)
  _$$MatchModelImplCopyWith<_$MatchModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
