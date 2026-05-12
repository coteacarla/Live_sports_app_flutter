// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_event_commentary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MatchEventModel {

 String get id; String get matchId; MatchEventType get type; int get minute; String? get teamId; String? get playerId; String? get playerName; String? get assistPlayerId; String? get assistPlayerName; int? get extraMinute; String? get detail;
/// Create a copy of MatchEventModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchEventModelCopyWith<MatchEventModel> get copyWith => _$MatchEventModelCopyWithImpl<MatchEventModel>(this as MatchEventModel, _$identity);

  /// Serializes this MatchEventModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchEventModel&&(identical(other.id, id) || other.id == id)&&(identical(other.matchId, matchId) || other.matchId == matchId)&&(identical(other.type, type) || other.type == type)&&(identical(other.minute, minute) || other.minute == minute)&&(identical(other.teamId, teamId) || other.teamId == teamId)&&(identical(other.playerId, playerId) || other.playerId == playerId)&&(identical(other.playerName, playerName) || other.playerName == playerName)&&(identical(other.assistPlayerId, assistPlayerId) || other.assistPlayerId == assistPlayerId)&&(identical(other.assistPlayerName, assistPlayerName) || other.assistPlayerName == assistPlayerName)&&(identical(other.extraMinute, extraMinute) || other.extraMinute == extraMinute)&&(identical(other.detail, detail) || other.detail == detail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,matchId,type,minute,teamId,playerId,playerName,assistPlayerId,assistPlayerName,extraMinute,detail);

@override
String toString() {
  return 'MatchEventModel(id: $id, matchId: $matchId, type: $type, minute: $minute, teamId: $teamId, playerId: $playerId, playerName: $playerName, assistPlayerId: $assistPlayerId, assistPlayerName: $assistPlayerName, extraMinute: $extraMinute, detail: $detail)';
}


}

/// @nodoc
abstract mixin class $MatchEventModelCopyWith<$Res>  {
  factory $MatchEventModelCopyWith(MatchEventModel value, $Res Function(MatchEventModel) _then) = _$MatchEventModelCopyWithImpl;
@useResult
$Res call({
 String id, String matchId, MatchEventType type, int minute, String? teamId, String? playerId, String? playerName, String? assistPlayerId, String? assistPlayerName, int? extraMinute, String? detail
});




}
/// @nodoc
class _$MatchEventModelCopyWithImpl<$Res>
    implements $MatchEventModelCopyWith<$Res> {
  _$MatchEventModelCopyWithImpl(this._self, this._then);

  final MatchEventModel _self;
  final $Res Function(MatchEventModel) _then;

/// Create a copy of MatchEventModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? matchId = null,Object? type = null,Object? minute = null,Object? teamId = freezed,Object? playerId = freezed,Object? playerName = freezed,Object? assistPlayerId = freezed,Object? assistPlayerName = freezed,Object? extraMinute = freezed,Object? detail = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,matchId: null == matchId ? _self.matchId : matchId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MatchEventType,minute: null == minute ? _self.minute : minute // ignore: cast_nullable_to_non_nullable
as int,teamId: freezed == teamId ? _self.teamId : teamId // ignore: cast_nullable_to_non_nullable
as String?,playerId: freezed == playerId ? _self.playerId : playerId // ignore: cast_nullable_to_non_nullable
as String?,playerName: freezed == playerName ? _self.playerName : playerName // ignore: cast_nullable_to_non_nullable
as String?,assistPlayerId: freezed == assistPlayerId ? _self.assistPlayerId : assistPlayerId // ignore: cast_nullable_to_non_nullable
as String?,assistPlayerName: freezed == assistPlayerName ? _self.assistPlayerName : assistPlayerName // ignore: cast_nullable_to_non_nullable
as String?,extraMinute: freezed == extraMinute ? _self.extraMinute : extraMinute // ignore: cast_nullable_to_non_nullable
as int?,detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MatchEventModel].
extension MatchEventModelPatterns on MatchEventModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchEventModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchEventModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchEventModel value)  $default,){
final _that = this;
switch (_that) {
case _MatchEventModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchEventModel value)?  $default,){
final _that = this;
switch (_that) {
case _MatchEventModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String matchId,  MatchEventType type,  int minute,  String? teamId,  String? playerId,  String? playerName,  String? assistPlayerId,  String? assistPlayerName,  int? extraMinute,  String? detail)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatchEventModel() when $default != null:
return $default(_that.id,_that.matchId,_that.type,_that.minute,_that.teamId,_that.playerId,_that.playerName,_that.assistPlayerId,_that.assistPlayerName,_that.extraMinute,_that.detail);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String matchId,  MatchEventType type,  int minute,  String? teamId,  String? playerId,  String? playerName,  String? assistPlayerId,  String? assistPlayerName,  int? extraMinute,  String? detail)  $default,) {final _that = this;
switch (_that) {
case _MatchEventModel():
return $default(_that.id,_that.matchId,_that.type,_that.minute,_that.teamId,_that.playerId,_that.playerName,_that.assistPlayerId,_that.assistPlayerName,_that.extraMinute,_that.detail);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String matchId,  MatchEventType type,  int minute,  String? teamId,  String? playerId,  String? playerName,  String? assistPlayerId,  String? assistPlayerName,  int? extraMinute,  String? detail)?  $default,) {final _that = this;
switch (_that) {
case _MatchEventModel() when $default != null:
return $default(_that.id,_that.matchId,_that.type,_that.minute,_that.teamId,_that.playerId,_that.playerName,_that.assistPlayerId,_that.assistPlayerName,_that.extraMinute,_that.detail);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MatchEventModel extends MatchEventModel {
  const _MatchEventModel({required this.id, required this.matchId, required this.type, required this.minute, this.teamId, this.playerId, this.playerName, this.assistPlayerId, this.assistPlayerName, this.extraMinute, this.detail}): super._();
  factory _MatchEventModel.fromJson(Map<String, dynamic> json) => _$MatchEventModelFromJson(json);

@override final  String id;
@override final  String matchId;
@override final  MatchEventType type;
@override final  int minute;
@override final  String? teamId;
@override final  String? playerId;
@override final  String? playerName;
@override final  String? assistPlayerId;
@override final  String? assistPlayerName;
@override final  int? extraMinute;
@override final  String? detail;

/// Create a copy of MatchEventModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchEventModelCopyWith<_MatchEventModel> get copyWith => __$MatchEventModelCopyWithImpl<_MatchEventModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchEventModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchEventModel&&(identical(other.id, id) || other.id == id)&&(identical(other.matchId, matchId) || other.matchId == matchId)&&(identical(other.type, type) || other.type == type)&&(identical(other.minute, minute) || other.minute == minute)&&(identical(other.teamId, teamId) || other.teamId == teamId)&&(identical(other.playerId, playerId) || other.playerId == playerId)&&(identical(other.playerName, playerName) || other.playerName == playerName)&&(identical(other.assistPlayerId, assistPlayerId) || other.assistPlayerId == assistPlayerId)&&(identical(other.assistPlayerName, assistPlayerName) || other.assistPlayerName == assistPlayerName)&&(identical(other.extraMinute, extraMinute) || other.extraMinute == extraMinute)&&(identical(other.detail, detail) || other.detail == detail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,matchId,type,minute,teamId,playerId,playerName,assistPlayerId,assistPlayerName,extraMinute,detail);

@override
String toString() {
  return 'MatchEventModel(id: $id, matchId: $matchId, type: $type, minute: $minute, teamId: $teamId, playerId: $playerId, playerName: $playerName, assistPlayerId: $assistPlayerId, assistPlayerName: $assistPlayerName, extraMinute: $extraMinute, detail: $detail)';
}


}

/// @nodoc
abstract mixin class _$MatchEventModelCopyWith<$Res> implements $MatchEventModelCopyWith<$Res> {
  factory _$MatchEventModelCopyWith(_MatchEventModel value, $Res Function(_MatchEventModel) _then) = __$MatchEventModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String matchId, MatchEventType type, int minute, String? teamId, String? playerId, String? playerName, String? assistPlayerId, String? assistPlayerName, int? extraMinute, String? detail
});




}
/// @nodoc
class __$MatchEventModelCopyWithImpl<$Res>
    implements _$MatchEventModelCopyWith<$Res> {
  __$MatchEventModelCopyWithImpl(this._self, this._then);

  final _MatchEventModel _self;
  final $Res Function(_MatchEventModel) _then;

/// Create a copy of MatchEventModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? matchId = null,Object? type = null,Object? minute = null,Object? teamId = freezed,Object? playerId = freezed,Object? playerName = freezed,Object? assistPlayerId = freezed,Object? assistPlayerName = freezed,Object? extraMinute = freezed,Object? detail = freezed,}) {
  return _then(_MatchEventModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,matchId: null == matchId ? _self.matchId : matchId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MatchEventType,minute: null == minute ? _self.minute : minute // ignore: cast_nullable_to_non_nullable
as int,teamId: freezed == teamId ? _self.teamId : teamId // ignore: cast_nullable_to_non_nullable
as String?,playerId: freezed == playerId ? _self.playerId : playerId // ignore: cast_nullable_to_non_nullable
as String?,playerName: freezed == playerName ? _self.playerName : playerName // ignore: cast_nullable_to_non_nullable
as String?,assistPlayerId: freezed == assistPlayerId ? _self.assistPlayerId : assistPlayerId // ignore: cast_nullable_to_non_nullable
as String?,assistPlayerName: freezed == assistPlayerName ? _self.assistPlayerName : assistPlayerName // ignore: cast_nullable_to_non_nullable
as String?,extraMinute: freezed == extraMinute ? _self.extraMinute : extraMinute // ignore: cast_nullable_to_non_nullable
as int?,detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CommentaryModel {

 String get id; String get matchId; int get minute; String get text; bool get isKeyEvent; String? get relatedEventId; DateTime? get publishedAt;
/// Create a copy of CommentaryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentaryModelCopyWith<CommentaryModel> get copyWith => _$CommentaryModelCopyWithImpl<CommentaryModel>(this as CommentaryModel, _$identity);

  /// Serializes this CommentaryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentaryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.matchId, matchId) || other.matchId == matchId)&&(identical(other.minute, minute) || other.minute == minute)&&(identical(other.text, text) || other.text == text)&&(identical(other.isKeyEvent, isKeyEvent) || other.isKeyEvent == isKeyEvent)&&(identical(other.relatedEventId, relatedEventId) || other.relatedEventId == relatedEventId)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,matchId,minute,text,isKeyEvent,relatedEventId,publishedAt);

@override
String toString() {
  return 'CommentaryModel(id: $id, matchId: $matchId, minute: $minute, text: $text, isKeyEvent: $isKeyEvent, relatedEventId: $relatedEventId, publishedAt: $publishedAt)';
}


}

/// @nodoc
abstract mixin class $CommentaryModelCopyWith<$Res>  {
  factory $CommentaryModelCopyWith(CommentaryModel value, $Res Function(CommentaryModel) _then) = _$CommentaryModelCopyWithImpl;
@useResult
$Res call({
 String id, String matchId, int minute, String text, bool isKeyEvent, String? relatedEventId, DateTime? publishedAt
});




}
/// @nodoc
class _$CommentaryModelCopyWithImpl<$Res>
    implements $CommentaryModelCopyWith<$Res> {
  _$CommentaryModelCopyWithImpl(this._self, this._then);

  final CommentaryModel _self;
  final $Res Function(CommentaryModel) _then;

/// Create a copy of CommentaryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? matchId = null,Object? minute = null,Object? text = null,Object? isKeyEvent = null,Object? relatedEventId = freezed,Object? publishedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,matchId: null == matchId ? _self.matchId : matchId // ignore: cast_nullable_to_non_nullable
as String,minute: null == minute ? _self.minute : minute // ignore: cast_nullable_to_non_nullable
as int,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,isKeyEvent: null == isKeyEvent ? _self.isKeyEvent : isKeyEvent // ignore: cast_nullable_to_non_nullable
as bool,relatedEventId: freezed == relatedEventId ? _self.relatedEventId : relatedEventId // ignore: cast_nullable_to_non_nullable
as String?,publishedAt: freezed == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [CommentaryModel].
extension CommentaryModelPatterns on CommentaryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommentaryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommentaryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommentaryModel value)  $default,){
final _that = this;
switch (_that) {
case _CommentaryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommentaryModel value)?  $default,){
final _that = this;
switch (_that) {
case _CommentaryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String matchId,  int minute,  String text,  bool isKeyEvent,  String? relatedEventId,  DateTime? publishedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommentaryModel() when $default != null:
return $default(_that.id,_that.matchId,_that.minute,_that.text,_that.isKeyEvent,_that.relatedEventId,_that.publishedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String matchId,  int minute,  String text,  bool isKeyEvent,  String? relatedEventId,  DateTime? publishedAt)  $default,) {final _that = this;
switch (_that) {
case _CommentaryModel():
return $default(_that.id,_that.matchId,_that.minute,_that.text,_that.isKeyEvent,_that.relatedEventId,_that.publishedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String matchId,  int minute,  String text,  bool isKeyEvent,  String? relatedEventId,  DateTime? publishedAt)?  $default,) {final _that = this;
switch (_that) {
case _CommentaryModel() when $default != null:
return $default(_that.id,_that.matchId,_that.minute,_that.text,_that.isKeyEvent,_that.relatedEventId,_that.publishedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CommentaryModel extends CommentaryModel {
  const _CommentaryModel({required this.id, required this.matchId, required this.minute, required this.text, this.isKeyEvent = false, this.relatedEventId, this.publishedAt}): super._();
  factory _CommentaryModel.fromJson(Map<String, dynamic> json) => _$CommentaryModelFromJson(json);

@override final  String id;
@override final  String matchId;
@override final  int minute;
@override final  String text;
@override@JsonKey() final  bool isKeyEvent;
@override final  String? relatedEventId;
@override final  DateTime? publishedAt;

/// Create a copy of CommentaryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommentaryModelCopyWith<_CommentaryModel> get copyWith => __$CommentaryModelCopyWithImpl<_CommentaryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommentaryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommentaryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.matchId, matchId) || other.matchId == matchId)&&(identical(other.minute, minute) || other.minute == minute)&&(identical(other.text, text) || other.text == text)&&(identical(other.isKeyEvent, isKeyEvent) || other.isKeyEvent == isKeyEvent)&&(identical(other.relatedEventId, relatedEventId) || other.relatedEventId == relatedEventId)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,matchId,minute,text,isKeyEvent,relatedEventId,publishedAt);

@override
String toString() {
  return 'CommentaryModel(id: $id, matchId: $matchId, minute: $minute, text: $text, isKeyEvent: $isKeyEvent, relatedEventId: $relatedEventId, publishedAt: $publishedAt)';
}


}

/// @nodoc
abstract mixin class _$CommentaryModelCopyWith<$Res> implements $CommentaryModelCopyWith<$Res> {
  factory _$CommentaryModelCopyWith(_CommentaryModel value, $Res Function(_CommentaryModel) _then) = __$CommentaryModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String matchId, int minute, String text, bool isKeyEvent, String? relatedEventId, DateTime? publishedAt
});




}
/// @nodoc
class __$CommentaryModelCopyWithImpl<$Res>
    implements _$CommentaryModelCopyWith<$Res> {
  __$CommentaryModelCopyWithImpl(this._self, this._then);

  final _CommentaryModel _self;
  final $Res Function(_CommentaryModel) _then;

/// Create a copy of CommentaryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? matchId = null,Object? minute = null,Object? text = null,Object? isKeyEvent = null,Object? relatedEventId = freezed,Object? publishedAt = freezed,}) {
  return _then(_CommentaryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,matchId: null == matchId ? _self.matchId : matchId // ignore: cast_nullable_to_non_nullable
as String,minute: null == minute ? _self.minute : minute // ignore: cast_nullable_to_non_nullable
as int,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,isKeyEvent: null == isKeyEvent ? _self.isKeyEvent : isKeyEvent // ignore: cast_nullable_to_non_nullable
as bool,relatedEventId: freezed == relatedEventId ? _self.relatedEventId : relatedEventId // ignore: cast_nullable_to_non_nullable
as String?,publishedAt: freezed == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
