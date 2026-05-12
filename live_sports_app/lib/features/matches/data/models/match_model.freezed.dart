// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MatchModel {

 String get id; String get leagueId; SportType get sportType; TeamModel get homeTeam; TeamModel get awayTeam; DateTime get scheduledAt; MatchStatus get status; String? get homeScore; String? get awayScore; int? get elapsed; String? get venue; String? get round;
/// Create a copy of MatchModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchModelCopyWith<MatchModel> get copyWith => _$MatchModelCopyWithImpl<MatchModel>(this as MatchModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchModel&&(identical(other.id, id) || other.id == id)&&(identical(other.leagueId, leagueId) || other.leagueId == leagueId)&&(identical(other.sportType, sportType) || other.sportType == sportType)&&(identical(other.homeTeam, homeTeam) || other.homeTeam == homeTeam)&&(identical(other.awayTeam, awayTeam) || other.awayTeam == awayTeam)&&(identical(other.scheduledAt, scheduledAt) || other.scheduledAt == scheduledAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.homeScore, homeScore) || other.homeScore == homeScore)&&(identical(other.awayScore, awayScore) || other.awayScore == awayScore)&&(identical(other.elapsed, elapsed) || other.elapsed == elapsed)&&(identical(other.venue, venue) || other.venue == venue)&&(identical(other.round, round) || other.round == round));
}


@override
int get hashCode => Object.hash(runtimeType,id,leagueId,sportType,homeTeam,awayTeam,scheduledAt,status,homeScore,awayScore,elapsed,venue,round);

@override
String toString() {
  return 'MatchModel(id: $id, leagueId: $leagueId, sportType: $sportType, homeTeam: $homeTeam, awayTeam: $awayTeam, scheduledAt: $scheduledAt, status: $status, homeScore: $homeScore, awayScore: $awayScore, elapsed: $elapsed, venue: $venue, round: $round)';
}


}

/// @nodoc
abstract mixin class $MatchModelCopyWith<$Res>  {
  factory $MatchModelCopyWith(MatchModel value, $Res Function(MatchModel) _then) = _$MatchModelCopyWithImpl;
@useResult
$Res call({
 String id, String leagueId, SportType sportType, TeamModel homeTeam, TeamModel awayTeam, DateTime scheduledAt, MatchStatus status, String? homeScore, String? awayScore, int? elapsed, String? venue, String? round
});


$TeamModelCopyWith<$Res> get homeTeam;$TeamModelCopyWith<$Res> get awayTeam;

}
/// @nodoc
class _$MatchModelCopyWithImpl<$Res>
    implements $MatchModelCopyWith<$Res> {
  _$MatchModelCopyWithImpl(this._self, this._then);

  final MatchModel _self;
  final $Res Function(MatchModel) _then;

/// Create a copy of MatchModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? leagueId = null,Object? sportType = null,Object? homeTeam = null,Object? awayTeam = null,Object? scheduledAt = null,Object? status = null,Object? homeScore = freezed,Object? awayScore = freezed,Object? elapsed = freezed,Object? venue = freezed,Object? round = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,leagueId: null == leagueId ? _self.leagueId : leagueId // ignore: cast_nullable_to_non_nullable
as String,sportType: null == sportType ? _self.sportType : sportType // ignore: cast_nullable_to_non_nullable
as SportType,homeTeam: null == homeTeam ? _self.homeTeam : homeTeam // ignore: cast_nullable_to_non_nullable
as TeamModel,awayTeam: null == awayTeam ? _self.awayTeam : awayTeam // ignore: cast_nullable_to_non_nullable
as TeamModel,scheduledAt: null == scheduledAt ? _self.scheduledAt : scheduledAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MatchStatus,homeScore: freezed == homeScore ? _self.homeScore : homeScore // ignore: cast_nullable_to_non_nullable
as String?,awayScore: freezed == awayScore ? _self.awayScore : awayScore // ignore: cast_nullable_to_non_nullable
as String?,elapsed: freezed == elapsed ? _self.elapsed : elapsed // ignore: cast_nullable_to_non_nullable
as int?,venue: freezed == venue ? _self.venue : venue // ignore: cast_nullable_to_non_nullable
as String?,round: freezed == round ? _self.round : round // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of MatchModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamModelCopyWith<$Res> get homeTeam {
  
  return $TeamModelCopyWith<$Res>(_self.homeTeam, (value) {
    return _then(_self.copyWith(homeTeam: value));
  });
}/// Create a copy of MatchModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamModelCopyWith<$Res> get awayTeam {
  
  return $TeamModelCopyWith<$Res>(_self.awayTeam, (value) {
    return _then(_self.copyWith(awayTeam: value));
  });
}
}


/// Adds pattern-matching-related methods to [MatchModel].
extension MatchModelPatterns on MatchModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchModel value)  $default,){
final _that = this;
switch (_that) {
case _MatchModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchModel value)?  $default,){
final _that = this;
switch (_that) {
case _MatchModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String leagueId,  SportType sportType,  TeamModel homeTeam,  TeamModel awayTeam,  DateTime scheduledAt,  MatchStatus status,  String? homeScore,  String? awayScore,  int? elapsed,  String? venue,  String? round)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatchModel() when $default != null:
return $default(_that.id,_that.leagueId,_that.sportType,_that.homeTeam,_that.awayTeam,_that.scheduledAt,_that.status,_that.homeScore,_that.awayScore,_that.elapsed,_that.venue,_that.round);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String leagueId,  SportType sportType,  TeamModel homeTeam,  TeamModel awayTeam,  DateTime scheduledAt,  MatchStatus status,  String? homeScore,  String? awayScore,  int? elapsed,  String? venue,  String? round)  $default,) {final _that = this;
switch (_that) {
case _MatchModel():
return $default(_that.id,_that.leagueId,_that.sportType,_that.homeTeam,_that.awayTeam,_that.scheduledAt,_that.status,_that.homeScore,_that.awayScore,_that.elapsed,_that.venue,_that.round);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String leagueId,  SportType sportType,  TeamModel homeTeam,  TeamModel awayTeam,  DateTime scheduledAt,  MatchStatus status,  String? homeScore,  String? awayScore,  int? elapsed,  String? venue,  String? round)?  $default,) {final _that = this;
switch (_that) {
case _MatchModel() when $default != null:
return $default(_that.id,_that.leagueId,_that.sportType,_that.homeTeam,_that.awayTeam,_that.scheduledAt,_that.status,_that.homeScore,_that.awayScore,_that.elapsed,_that.venue,_that.round);case _:
  return null;

}
}

}

/// @nodoc


class _MatchModel extends MatchModel {
  const _MatchModel({required this.id, required this.leagueId, required this.sportType, required this.homeTeam, required this.awayTeam, required this.scheduledAt, required this.status, this.homeScore, this.awayScore, this.elapsed, this.venue, this.round}): super._();
  

@override final  String id;
@override final  String leagueId;
@override final  SportType sportType;
@override final  TeamModel homeTeam;
@override final  TeamModel awayTeam;
@override final  DateTime scheduledAt;
@override final  MatchStatus status;
@override final  String? homeScore;
@override final  String? awayScore;
@override final  int? elapsed;
@override final  String? venue;
@override final  String? round;

/// Create a copy of MatchModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchModelCopyWith<_MatchModel> get copyWith => __$MatchModelCopyWithImpl<_MatchModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchModel&&(identical(other.id, id) || other.id == id)&&(identical(other.leagueId, leagueId) || other.leagueId == leagueId)&&(identical(other.sportType, sportType) || other.sportType == sportType)&&(identical(other.homeTeam, homeTeam) || other.homeTeam == homeTeam)&&(identical(other.awayTeam, awayTeam) || other.awayTeam == awayTeam)&&(identical(other.scheduledAt, scheduledAt) || other.scheduledAt == scheduledAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.homeScore, homeScore) || other.homeScore == homeScore)&&(identical(other.awayScore, awayScore) || other.awayScore == awayScore)&&(identical(other.elapsed, elapsed) || other.elapsed == elapsed)&&(identical(other.venue, venue) || other.venue == venue)&&(identical(other.round, round) || other.round == round));
}


@override
int get hashCode => Object.hash(runtimeType,id,leagueId,sportType,homeTeam,awayTeam,scheduledAt,status,homeScore,awayScore,elapsed,venue,round);

@override
String toString() {
  return 'MatchModel(id: $id, leagueId: $leagueId, sportType: $sportType, homeTeam: $homeTeam, awayTeam: $awayTeam, scheduledAt: $scheduledAt, status: $status, homeScore: $homeScore, awayScore: $awayScore, elapsed: $elapsed, venue: $venue, round: $round)';
}


}

/// @nodoc
abstract mixin class _$MatchModelCopyWith<$Res> implements $MatchModelCopyWith<$Res> {
  factory _$MatchModelCopyWith(_MatchModel value, $Res Function(_MatchModel) _then) = __$MatchModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String leagueId, SportType sportType, TeamModel homeTeam, TeamModel awayTeam, DateTime scheduledAt, MatchStatus status, String? homeScore, String? awayScore, int? elapsed, String? venue, String? round
});


@override $TeamModelCopyWith<$Res> get homeTeam;@override $TeamModelCopyWith<$Res> get awayTeam;

}
/// @nodoc
class __$MatchModelCopyWithImpl<$Res>
    implements _$MatchModelCopyWith<$Res> {
  __$MatchModelCopyWithImpl(this._self, this._then);

  final _MatchModel _self;
  final $Res Function(_MatchModel) _then;

/// Create a copy of MatchModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? leagueId = null,Object? sportType = null,Object? homeTeam = null,Object? awayTeam = null,Object? scheduledAt = null,Object? status = null,Object? homeScore = freezed,Object? awayScore = freezed,Object? elapsed = freezed,Object? venue = freezed,Object? round = freezed,}) {
  return _then(_MatchModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,leagueId: null == leagueId ? _self.leagueId : leagueId // ignore: cast_nullable_to_non_nullable
as String,sportType: null == sportType ? _self.sportType : sportType // ignore: cast_nullable_to_non_nullable
as SportType,homeTeam: null == homeTeam ? _self.homeTeam : homeTeam // ignore: cast_nullable_to_non_nullable
as TeamModel,awayTeam: null == awayTeam ? _self.awayTeam : awayTeam // ignore: cast_nullable_to_non_nullable
as TeamModel,scheduledAt: null == scheduledAt ? _self.scheduledAt : scheduledAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MatchStatus,homeScore: freezed == homeScore ? _self.homeScore : homeScore // ignore: cast_nullable_to_non_nullable
as String?,awayScore: freezed == awayScore ? _self.awayScore : awayScore // ignore: cast_nullable_to_non_nullable
as String?,elapsed: freezed == elapsed ? _self.elapsed : elapsed // ignore: cast_nullable_to_non_nullable
as int?,venue: freezed == venue ? _self.venue : venue // ignore: cast_nullable_to_non_nullable
as String?,round: freezed == round ? _self.round : round // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of MatchModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamModelCopyWith<$Res> get homeTeam {
  
  return $TeamModelCopyWith<$Res>(_self.homeTeam, (value) {
    return _then(_self.copyWith(homeTeam: value));
  });
}/// Create a copy of MatchModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamModelCopyWith<$Res> get awayTeam {
  
  return $TeamModelCopyWith<$Res>(_self.awayTeam, (value) {
    return _then(_self.copyWith(awayTeam: value));
  });
}
}

// dart format on
