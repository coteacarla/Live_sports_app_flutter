// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'espn_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EspnScoreboardResponse {

 List<EspnEvent> get events;
/// Create a copy of EspnScoreboardResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EspnScoreboardResponseCopyWith<EspnScoreboardResponse> get copyWith => _$EspnScoreboardResponseCopyWithImpl<EspnScoreboardResponse>(this as EspnScoreboardResponse, _$identity);

  /// Serializes this EspnScoreboardResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EspnScoreboardResponse&&const DeepCollectionEquality().equals(other.events, events));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(events));

@override
String toString() {
  return 'EspnScoreboardResponse(events: $events)';
}


}

/// @nodoc
abstract mixin class $EspnScoreboardResponseCopyWith<$Res>  {
  factory $EspnScoreboardResponseCopyWith(EspnScoreboardResponse value, $Res Function(EspnScoreboardResponse) _then) = _$EspnScoreboardResponseCopyWithImpl;
@useResult
$Res call({
 List<EspnEvent> events
});




}
/// @nodoc
class _$EspnScoreboardResponseCopyWithImpl<$Res>
    implements $EspnScoreboardResponseCopyWith<$Res> {
  _$EspnScoreboardResponseCopyWithImpl(this._self, this._then);

  final EspnScoreboardResponse _self;
  final $Res Function(EspnScoreboardResponse) _then;

/// Create a copy of EspnScoreboardResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? events = null,}) {
  return _then(_self.copyWith(
events: null == events ? _self.events : events // ignore: cast_nullable_to_non_nullable
as List<EspnEvent>,
  ));
}

}


/// Adds pattern-matching-related methods to [EspnScoreboardResponse].
extension EspnScoreboardResponsePatterns on EspnScoreboardResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EspnScoreboardResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EspnScoreboardResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EspnScoreboardResponse value)  $default,){
final _that = this;
switch (_that) {
case _EspnScoreboardResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EspnScoreboardResponse value)?  $default,){
final _that = this;
switch (_that) {
case _EspnScoreboardResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<EspnEvent> events)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EspnScoreboardResponse() when $default != null:
return $default(_that.events);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<EspnEvent> events)  $default,) {final _that = this;
switch (_that) {
case _EspnScoreboardResponse():
return $default(_that.events);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<EspnEvent> events)?  $default,) {final _that = this;
switch (_that) {
case _EspnScoreboardResponse() when $default != null:
return $default(_that.events);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EspnScoreboardResponse implements EspnScoreboardResponse {
  const _EspnScoreboardResponse({final  List<EspnEvent> events = const []}): _events = events;
  factory _EspnScoreboardResponse.fromJson(Map<String, dynamic> json) => _$EspnScoreboardResponseFromJson(json);

 final  List<EspnEvent> _events;
@override@JsonKey() List<EspnEvent> get events {
  if (_events is EqualUnmodifiableListView) return _events;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_events);
}


/// Create a copy of EspnScoreboardResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EspnScoreboardResponseCopyWith<_EspnScoreboardResponse> get copyWith => __$EspnScoreboardResponseCopyWithImpl<_EspnScoreboardResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EspnScoreboardResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EspnScoreboardResponse&&const DeepCollectionEquality().equals(other._events, _events));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_events));

@override
String toString() {
  return 'EspnScoreboardResponse(events: $events)';
}


}

/// @nodoc
abstract mixin class _$EspnScoreboardResponseCopyWith<$Res> implements $EspnScoreboardResponseCopyWith<$Res> {
  factory _$EspnScoreboardResponseCopyWith(_EspnScoreboardResponse value, $Res Function(_EspnScoreboardResponse) _then) = __$EspnScoreboardResponseCopyWithImpl;
@override @useResult
$Res call({
 List<EspnEvent> events
});




}
/// @nodoc
class __$EspnScoreboardResponseCopyWithImpl<$Res>
    implements _$EspnScoreboardResponseCopyWith<$Res> {
  __$EspnScoreboardResponseCopyWithImpl(this._self, this._then);

  final _EspnScoreboardResponse _self;
  final $Res Function(_EspnScoreboardResponse) _then;

/// Create a copy of EspnScoreboardResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? events = null,}) {
  return _then(_EspnScoreboardResponse(
events: null == events ? _self._events : events // ignore: cast_nullable_to_non_nullable
as List<EspnEvent>,
  ));
}


}


/// @nodoc
mixin _$EspnEvent {

 String get id; String get date; String get name; EspnStatus get status; List<EspnCompetition> get competitions; EspnLeague? get league; EspnSport? get sport; List<EspnLink> get links;
/// Create a copy of EspnEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EspnEventCopyWith<EspnEvent> get copyWith => _$EspnEventCopyWithImpl<EspnEvent>(this as EspnEvent, _$identity);

  /// Serializes this EspnEvent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EspnEvent&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.competitions, competitions)&&(identical(other.league, league) || other.league == league)&&(identical(other.sport, sport) || other.sport == sport)&&const DeepCollectionEquality().equals(other.links, links));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,date,name,status,const DeepCollectionEquality().hash(competitions),league,sport,const DeepCollectionEquality().hash(links));

@override
String toString() {
  return 'EspnEvent(id: $id, date: $date, name: $name, status: $status, competitions: $competitions, league: $league, sport: $sport, links: $links)';
}


}

/// @nodoc
abstract mixin class $EspnEventCopyWith<$Res>  {
  factory $EspnEventCopyWith(EspnEvent value, $Res Function(EspnEvent) _then) = _$EspnEventCopyWithImpl;
@useResult
$Res call({
 String id, String date, String name, EspnStatus status, List<EspnCompetition> competitions, EspnLeague? league, EspnSport? sport, List<EspnLink> links
});


$EspnStatusCopyWith<$Res> get status;$EspnLeagueCopyWith<$Res>? get league;$EspnSportCopyWith<$Res>? get sport;

}
/// @nodoc
class _$EspnEventCopyWithImpl<$Res>
    implements $EspnEventCopyWith<$Res> {
  _$EspnEventCopyWithImpl(this._self, this._then);

  final EspnEvent _self;
  final $Res Function(EspnEvent) _then;

/// Create a copy of EspnEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? date = null,Object? name = null,Object? status = null,Object? competitions = null,Object? league = freezed,Object? sport = freezed,Object? links = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EspnStatus,competitions: null == competitions ? _self.competitions : competitions // ignore: cast_nullable_to_non_nullable
as List<EspnCompetition>,league: freezed == league ? _self.league : league // ignore: cast_nullable_to_non_nullable
as EspnLeague?,sport: freezed == sport ? _self.sport : sport // ignore: cast_nullable_to_non_nullable
as EspnSport?,links: null == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as List<EspnLink>,
  ));
}
/// Create a copy of EspnEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EspnStatusCopyWith<$Res> get status {
  
  return $EspnStatusCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}/// Create a copy of EspnEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EspnLeagueCopyWith<$Res>? get league {
    if (_self.league == null) {
    return null;
  }

  return $EspnLeagueCopyWith<$Res>(_self.league!, (value) {
    return _then(_self.copyWith(league: value));
  });
}/// Create a copy of EspnEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EspnSportCopyWith<$Res>? get sport {
    if (_self.sport == null) {
    return null;
  }

  return $EspnSportCopyWith<$Res>(_self.sport!, (value) {
    return _then(_self.copyWith(sport: value));
  });
}
}


/// Adds pattern-matching-related methods to [EspnEvent].
extension EspnEventPatterns on EspnEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EspnEvent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EspnEvent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EspnEvent value)  $default,){
final _that = this;
switch (_that) {
case _EspnEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EspnEvent value)?  $default,){
final _that = this;
switch (_that) {
case _EspnEvent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String date,  String name,  EspnStatus status,  List<EspnCompetition> competitions,  EspnLeague? league,  EspnSport? sport,  List<EspnLink> links)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EspnEvent() when $default != null:
return $default(_that.id,_that.date,_that.name,_that.status,_that.competitions,_that.league,_that.sport,_that.links);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String date,  String name,  EspnStatus status,  List<EspnCompetition> competitions,  EspnLeague? league,  EspnSport? sport,  List<EspnLink> links)  $default,) {final _that = this;
switch (_that) {
case _EspnEvent():
return $default(_that.id,_that.date,_that.name,_that.status,_that.competitions,_that.league,_that.sport,_that.links);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String date,  String name,  EspnStatus status,  List<EspnCompetition> competitions,  EspnLeague? league,  EspnSport? sport,  List<EspnLink> links)?  $default,) {final _that = this;
switch (_that) {
case _EspnEvent() when $default != null:
return $default(_that.id,_that.date,_that.name,_that.status,_that.competitions,_that.league,_that.sport,_that.links);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EspnEvent implements EspnEvent {
  const _EspnEvent({required this.id, required this.date, required this.name, required this.status, final  List<EspnCompetition> competitions = const [], this.league, this.sport, final  List<EspnLink> links = const []}): _competitions = competitions,_links = links;
  factory _EspnEvent.fromJson(Map<String, dynamic> json) => _$EspnEventFromJson(json);

@override final  String id;
@override final  String date;
@override final  String name;
@override final  EspnStatus status;
 final  List<EspnCompetition> _competitions;
@override@JsonKey() List<EspnCompetition> get competitions {
  if (_competitions is EqualUnmodifiableListView) return _competitions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_competitions);
}

@override final  EspnLeague? league;
@override final  EspnSport? sport;
 final  List<EspnLink> _links;
@override@JsonKey() List<EspnLink> get links {
  if (_links is EqualUnmodifiableListView) return _links;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_links);
}


/// Create a copy of EspnEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EspnEventCopyWith<_EspnEvent> get copyWith => __$EspnEventCopyWithImpl<_EspnEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EspnEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EspnEvent&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._competitions, _competitions)&&(identical(other.league, league) || other.league == league)&&(identical(other.sport, sport) || other.sport == sport)&&const DeepCollectionEquality().equals(other._links, _links));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,date,name,status,const DeepCollectionEquality().hash(_competitions),league,sport,const DeepCollectionEquality().hash(_links));

@override
String toString() {
  return 'EspnEvent(id: $id, date: $date, name: $name, status: $status, competitions: $competitions, league: $league, sport: $sport, links: $links)';
}


}

/// @nodoc
abstract mixin class _$EspnEventCopyWith<$Res> implements $EspnEventCopyWith<$Res> {
  factory _$EspnEventCopyWith(_EspnEvent value, $Res Function(_EspnEvent) _then) = __$EspnEventCopyWithImpl;
@override @useResult
$Res call({
 String id, String date, String name, EspnStatus status, List<EspnCompetition> competitions, EspnLeague? league, EspnSport? sport, List<EspnLink> links
});


@override $EspnStatusCopyWith<$Res> get status;@override $EspnLeagueCopyWith<$Res>? get league;@override $EspnSportCopyWith<$Res>? get sport;

}
/// @nodoc
class __$EspnEventCopyWithImpl<$Res>
    implements _$EspnEventCopyWith<$Res> {
  __$EspnEventCopyWithImpl(this._self, this._then);

  final _EspnEvent _self;
  final $Res Function(_EspnEvent) _then;

/// Create a copy of EspnEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? date = null,Object? name = null,Object? status = null,Object? competitions = null,Object? league = freezed,Object? sport = freezed,Object? links = null,}) {
  return _then(_EspnEvent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EspnStatus,competitions: null == competitions ? _self._competitions : competitions // ignore: cast_nullable_to_non_nullable
as List<EspnCompetition>,league: freezed == league ? _self.league : league // ignore: cast_nullable_to_non_nullable
as EspnLeague?,sport: freezed == sport ? _self.sport : sport // ignore: cast_nullable_to_non_nullable
as EspnSport?,links: null == links ? _self._links : links // ignore: cast_nullable_to_non_nullable
as List<EspnLink>,
  ));
}

/// Create a copy of EspnEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EspnStatusCopyWith<$Res> get status {
  
  return $EspnStatusCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}/// Create a copy of EspnEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EspnLeagueCopyWith<$Res>? get league {
    if (_self.league == null) {
    return null;
  }

  return $EspnLeagueCopyWith<$Res>(_self.league!, (value) {
    return _then(_self.copyWith(league: value));
  });
}/// Create a copy of EspnEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EspnSportCopyWith<$Res>? get sport {
    if (_self.sport == null) {
    return null;
  }

  return $EspnSportCopyWith<$Res>(_self.sport!, (value) {
    return _then(_self.copyWith(sport: value));
  });
}
}


/// @nodoc
mixin _$EspnCompetition {

 String get id; List<EspnCompetitor> get competitors; EspnVenue? get venue; EspnCompetitionType? get type;
/// Create a copy of EspnCompetition
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EspnCompetitionCopyWith<EspnCompetition> get copyWith => _$EspnCompetitionCopyWithImpl<EspnCompetition>(this as EspnCompetition, _$identity);

  /// Serializes this EspnCompetition to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EspnCompetition&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.competitors, competitors)&&(identical(other.venue, venue) || other.venue == venue)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(competitors),venue,type);

@override
String toString() {
  return 'EspnCompetition(id: $id, competitors: $competitors, venue: $venue, type: $type)';
}


}

/// @nodoc
abstract mixin class $EspnCompetitionCopyWith<$Res>  {
  factory $EspnCompetitionCopyWith(EspnCompetition value, $Res Function(EspnCompetition) _then) = _$EspnCompetitionCopyWithImpl;
@useResult
$Res call({
 String id, List<EspnCompetitor> competitors, EspnVenue? venue, EspnCompetitionType? type
});


$EspnVenueCopyWith<$Res>? get venue;$EspnCompetitionTypeCopyWith<$Res>? get type;

}
/// @nodoc
class _$EspnCompetitionCopyWithImpl<$Res>
    implements $EspnCompetitionCopyWith<$Res> {
  _$EspnCompetitionCopyWithImpl(this._self, this._then);

  final EspnCompetition _self;
  final $Res Function(EspnCompetition) _then;

/// Create a copy of EspnCompetition
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? competitors = null,Object? venue = freezed,Object? type = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,competitors: null == competitors ? _self.competitors : competitors // ignore: cast_nullable_to_non_nullable
as List<EspnCompetitor>,venue: freezed == venue ? _self.venue : venue // ignore: cast_nullable_to_non_nullable
as EspnVenue?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as EspnCompetitionType?,
  ));
}
/// Create a copy of EspnCompetition
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EspnVenueCopyWith<$Res>? get venue {
    if (_self.venue == null) {
    return null;
  }

  return $EspnVenueCopyWith<$Res>(_self.venue!, (value) {
    return _then(_self.copyWith(venue: value));
  });
}/// Create a copy of EspnCompetition
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EspnCompetitionTypeCopyWith<$Res>? get type {
    if (_self.type == null) {
    return null;
  }

  return $EspnCompetitionTypeCopyWith<$Res>(_self.type!, (value) {
    return _then(_self.copyWith(type: value));
  });
}
}


/// Adds pattern-matching-related methods to [EspnCompetition].
extension EspnCompetitionPatterns on EspnCompetition {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EspnCompetition value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EspnCompetition() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EspnCompetition value)  $default,){
final _that = this;
switch (_that) {
case _EspnCompetition():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EspnCompetition value)?  $default,){
final _that = this;
switch (_that) {
case _EspnCompetition() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  List<EspnCompetitor> competitors,  EspnVenue? venue,  EspnCompetitionType? type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EspnCompetition() when $default != null:
return $default(_that.id,_that.competitors,_that.venue,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  List<EspnCompetitor> competitors,  EspnVenue? venue,  EspnCompetitionType? type)  $default,) {final _that = this;
switch (_that) {
case _EspnCompetition():
return $default(_that.id,_that.competitors,_that.venue,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  List<EspnCompetitor> competitors,  EspnVenue? venue,  EspnCompetitionType? type)?  $default,) {final _that = this;
switch (_that) {
case _EspnCompetition() when $default != null:
return $default(_that.id,_that.competitors,_that.venue,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EspnCompetition implements EspnCompetition {
  const _EspnCompetition({required this.id, final  List<EspnCompetitor> competitors = const [], this.venue, this.type}): _competitors = competitors;
  factory _EspnCompetition.fromJson(Map<String, dynamic> json) => _$EspnCompetitionFromJson(json);

@override final  String id;
 final  List<EspnCompetitor> _competitors;
@override@JsonKey() List<EspnCompetitor> get competitors {
  if (_competitors is EqualUnmodifiableListView) return _competitors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_competitors);
}

@override final  EspnVenue? venue;
@override final  EspnCompetitionType? type;

/// Create a copy of EspnCompetition
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EspnCompetitionCopyWith<_EspnCompetition> get copyWith => __$EspnCompetitionCopyWithImpl<_EspnCompetition>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EspnCompetitionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EspnCompetition&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._competitors, _competitors)&&(identical(other.venue, venue) || other.venue == venue)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_competitors),venue,type);

@override
String toString() {
  return 'EspnCompetition(id: $id, competitors: $competitors, venue: $venue, type: $type)';
}


}

/// @nodoc
abstract mixin class _$EspnCompetitionCopyWith<$Res> implements $EspnCompetitionCopyWith<$Res> {
  factory _$EspnCompetitionCopyWith(_EspnCompetition value, $Res Function(_EspnCompetition) _then) = __$EspnCompetitionCopyWithImpl;
@override @useResult
$Res call({
 String id, List<EspnCompetitor> competitors, EspnVenue? venue, EspnCompetitionType? type
});


@override $EspnVenueCopyWith<$Res>? get venue;@override $EspnCompetitionTypeCopyWith<$Res>? get type;

}
/// @nodoc
class __$EspnCompetitionCopyWithImpl<$Res>
    implements _$EspnCompetitionCopyWith<$Res> {
  __$EspnCompetitionCopyWithImpl(this._self, this._then);

  final _EspnCompetition _self;
  final $Res Function(_EspnCompetition) _then;

/// Create a copy of EspnCompetition
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? competitors = null,Object? venue = freezed,Object? type = freezed,}) {
  return _then(_EspnCompetition(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,competitors: null == competitors ? _self._competitors : competitors // ignore: cast_nullable_to_non_nullable
as List<EspnCompetitor>,venue: freezed == venue ? _self.venue : venue // ignore: cast_nullable_to_non_nullable
as EspnVenue?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as EspnCompetitionType?,
  ));
}

/// Create a copy of EspnCompetition
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EspnVenueCopyWith<$Res>? get venue {
    if (_self.venue == null) {
    return null;
  }

  return $EspnVenueCopyWith<$Res>(_self.venue!, (value) {
    return _then(_self.copyWith(venue: value));
  });
}/// Create a copy of EspnCompetition
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EspnCompetitionTypeCopyWith<$Res>? get type {
    if (_self.type == null) {
    return null;
  }

  return $EspnCompetitionTypeCopyWith<$Res>(_self.type!, (value) {
    return _then(_self.copyWith(type: value));
  });
}
}


/// @nodoc
mixin _$EspnCompetitor {

 String get id; EspnTeam get team; String? get homeAway; int? get score;
/// Create a copy of EspnCompetitor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EspnCompetitorCopyWith<EspnCompetitor> get copyWith => _$EspnCompetitorCopyWithImpl<EspnCompetitor>(this as EspnCompetitor, _$identity);

  /// Serializes this EspnCompetitor to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EspnCompetitor&&(identical(other.id, id) || other.id == id)&&(identical(other.team, team) || other.team == team)&&(identical(other.homeAway, homeAway) || other.homeAway == homeAway)&&(identical(other.score, score) || other.score == score));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,team,homeAway,score);

@override
String toString() {
  return 'EspnCompetitor(id: $id, team: $team, homeAway: $homeAway, score: $score)';
}


}

/// @nodoc
abstract mixin class $EspnCompetitorCopyWith<$Res>  {
  factory $EspnCompetitorCopyWith(EspnCompetitor value, $Res Function(EspnCompetitor) _then) = _$EspnCompetitorCopyWithImpl;
@useResult
$Res call({
 String id, EspnTeam team, String? homeAway, int? score
});


$EspnTeamCopyWith<$Res> get team;

}
/// @nodoc
class _$EspnCompetitorCopyWithImpl<$Res>
    implements $EspnCompetitorCopyWith<$Res> {
  _$EspnCompetitorCopyWithImpl(this._self, this._then);

  final EspnCompetitor _self;
  final $Res Function(EspnCompetitor) _then;

/// Create a copy of EspnCompetitor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? team = null,Object? homeAway = freezed,Object? score = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,team: null == team ? _self.team : team // ignore: cast_nullable_to_non_nullable
as EspnTeam,homeAway: freezed == homeAway ? _self.homeAway : homeAway // ignore: cast_nullable_to_non_nullable
as String?,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of EspnCompetitor
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EspnTeamCopyWith<$Res> get team {
  
  return $EspnTeamCopyWith<$Res>(_self.team, (value) {
    return _then(_self.copyWith(team: value));
  });
}
}


/// Adds pattern-matching-related methods to [EspnCompetitor].
extension EspnCompetitorPatterns on EspnCompetitor {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EspnCompetitor value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EspnCompetitor() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EspnCompetitor value)  $default,){
final _that = this;
switch (_that) {
case _EspnCompetitor():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EspnCompetitor value)?  $default,){
final _that = this;
switch (_that) {
case _EspnCompetitor() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  EspnTeam team,  String? homeAway,  int? score)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EspnCompetitor() when $default != null:
return $default(_that.id,_that.team,_that.homeAway,_that.score);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  EspnTeam team,  String? homeAway,  int? score)  $default,) {final _that = this;
switch (_that) {
case _EspnCompetitor():
return $default(_that.id,_that.team,_that.homeAway,_that.score);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  EspnTeam team,  String? homeAway,  int? score)?  $default,) {final _that = this;
switch (_that) {
case _EspnCompetitor() when $default != null:
return $default(_that.id,_that.team,_that.homeAway,_that.score);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EspnCompetitor implements EspnCompetitor {
  const _EspnCompetitor({required this.id, required this.team, this.homeAway, this.score});
  factory _EspnCompetitor.fromJson(Map<String, dynamic> json) => _$EspnCompetitorFromJson(json);

@override final  String id;
@override final  EspnTeam team;
@override final  String? homeAway;
@override final  int? score;

/// Create a copy of EspnCompetitor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EspnCompetitorCopyWith<_EspnCompetitor> get copyWith => __$EspnCompetitorCopyWithImpl<_EspnCompetitor>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EspnCompetitorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EspnCompetitor&&(identical(other.id, id) || other.id == id)&&(identical(other.team, team) || other.team == team)&&(identical(other.homeAway, homeAway) || other.homeAway == homeAway)&&(identical(other.score, score) || other.score == score));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,team,homeAway,score);

@override
String toString() {
  return 'EspnCompetitor(id: $id, team: $team, homeAway: $homeAway, score: $score)';
}


}

/// @nodoc
abstract mixin class _$EspnCompetitorCopyWith<$Res> implements $EspnCompetitorCopyWith<$Res> {
  factory _$EspnCompetitorCopyWith(_EspnCompetitor value, $Res Function(_EspnCompetitor) _then) = __$EspnCompetitorCopyWithImpl;
@override @useResult
$Res call({
 String id, EspnTeam team, String? homeAway, int? score
});


@override $EspnTeamCopyWith<$Res> get team;

}
/// @nodoc
class __$EspnCompetitorCopyWithImpl<$Res>
    implements _$EspnCompetitorCopyWith<$Res> {
  __$EspnCompetitorCopyWithImpl(this._self, this._then);

  final _EspnCompetitor _self;
  final $Res Function(_EspnCompetitor) _then;

/// Create a copy of EspnCompetitor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? team = null,Object? homeAway = freezed,Object? score = freezed,}) {
  return _then(_EspnCompetitor(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,team: null == team ? _self.team : team // ignore: cast_nullable_to_non_nullable
as EspnTeam,homeAway: freezed == homeAway ? _self.homeAway : homeAway // ignore: cast_nullable_to_non_nullable
as String?,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of EspnCompetitor
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EspnTeamCopyWith<$Res> get team {
  
  return $EspnTeamCopyWith<$Res>(_self.team, (value) {
    return _then(_self.copyWith(team: value));
  });
}
}


/// @nodoc
mixin _$EspnStatus {

 EspnStatusType? get type; String? get displayClock; String? get detail;
/// Create a copy of EspnStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EspnStatusCopyWith<EspnStatus> get copyWith => _$EspnStatusCopyWithImpl<EspnStatus>(this as EspnStatus, _$identity);

  /// Serializes this EspnStatus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EspnStatus&&(identical(other.type, type) || other.type == type)&&(identical(other.displayClock, displayClock) || other.displayClock == displayClock)&&(identical(other.detail, detail) || other.detail == detail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,displayClock,detail);

@override
String toString() {
  return 'EspnStatus(type: $type, displayClock: $displayClock, detail: $detail)';
}


}

/// @nodoc
abstract mixin class $EspnStatusCopyWith<$Res>  {
  factory $EspnStatusCopyWith(EspnStatus value, $Res Function(EspnStatus) _then) = _$EspnStatusCopyWithImpl;
@useResult
$Res call({
 EspnStatusType? type, String? displayClock, String? detail
});


$EspnStatusTypeCopyWith<$Res>? get type;

}
/// @nodoc
class _$EspnStatusCopyWithImpl<$Res>
    implements $EspnStatusCopyWith<$Res> {
  _$EspnStatusCopyWithImpl(this._self, this._then);

  final EspnStatus _self;
  final $Res Function(EspnStatus) _then;

/// Create a copy of EspnStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = freezed,Object? displayClock = freezed,Object? detail = freezed,}) {
  return _then(_self.copyWith(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as EspnStatusType?,displayClock: freezed == displayClock ? _self.displayClock : displayClock // ignore: cast_nullable_to_non_nullable
as String?,detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of EspnStatus
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EspnStatusTypeCopyWith<$Res>? get type {
    if (_self.type == null) {
    return null;
  }

  return $EspnStatusTypeCopyWith<$Res>(_self.type!, (value) {
    return _then(_self.copyWith(type: value));
  });
}
}


/// Adds pattern-matching-related methods to [EspnStatus].
extension EspnStatusPatterns on EspnStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EspnStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EspnStatus() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EspnStatus value)  $default,){
final _that = this;
switch (_that) {
case _EspnStatus():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EspnStatus value)?  $default,){
final _that = this;
switch (_that) {
case _EspnStatus() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( EspnStatusType? type,  String? displayClock,  String? detail)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EspnStatus() when $default != null:
return $default(_that.type,_that.displayClock,_that.detail);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( EspnStatusType? type,  String? displayClock,  String? detail)  $default,) {final _that = this;
switch (_that) {
case _EspnStatus():
return $default(_that.type,_that.displayClock,_that.detail);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( EspnStatusType? type,  String? displayClock,  String? detail)?  $default,) {final _that = this;
switch (_that) {
case _EspnStatus() when $default != null:
return $default(_that.type,_that.displayClock,_that.detail);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EspnStatus implements EspnStatus {
  const _EspnStatus({this.type, this.displayClock, this.detail});
  factory _EspnStatus.fromJson(Map<String, dynamic> json) => _$EspnStatusFromJson(json);

@override final  EspnStatusType? type;
@override final  String? displayClock;
@override final  String? detail;

/// Create a copy of EspnStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EspnStatusCopyWith<_EspnStatus> get copyWith => __$EspnStatusCopyWithImpl<_EspnStatus>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EspnStatusToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EspnStatus&&(identical(other.type, type) || other.type == type)&&(identical(other.displayClock, displayClock) || other.displayClock == displayClock)&&(identical(other.detail, detail) || other.detail == detail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,displayClock,detail);

@override
String toString() {
  return 'EspnStatus(type: $type, displayClock: $displayClock, detail: $detail)';
}


}

/// @nodoc
abstract mixin class _$EspnStatusCopyWith<$Res> implements $EspnStatusCopyWith<$Res> {
  factory _$EspnStatusCopyWith(_EspnStatus value, $Res Function(_EspnStatus) _then) = __$EspnStatusCopyWithImpl;
@override @useResult
$Res call({
 EspnStatusType? type, String? displayClock, String? detail
});


@override $EspnStatusTypeCopyWith<$Res>? get type;

}
/// @nodoc
class __$EspnStatusCopyWithImpl<$Res>
    implements _$EspnStatusCopyWith<$Res> {
  __$EspnStatusCopyWithImpl(this._self, this._then);

  final _EspnStatus _self;
  final $Res Function(_EspnStatus) _then;

/// Create a copy of EspnStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = freezed,Object? displayClock = freezed,Object? detail = freezed,}) {
  return _then(_EspnStatus(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as EspnStatusType?,displayClock: freezed == displayClock ? _self.displayClock : displayClock // ignore: cast_nullable_to_non_nullable
as String?,detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of EspnStatus
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EspnStatusTypeCopyWith<$Res>? get type {
    if (_self.type == null) {
    return null;
  }

  return $EspnStatusTypeCopyWith<$Res>(_self.type!, (value) {
    return _then(_self.copyWith(type: value));
  });
}
}


/// @nodoc
mixin _$EspnStatusType {

 String get id; String? get name; bool get completed;
/// Create a copy of EspnStatusType
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EspnStatusTypeCopyWith<EspnStatusType> get copyWith => _$EspnStatusTypeCopyWithImpl<EspnStatusType>(this as EspnStatusType, _$identity);

  /// Serializes this EspnStatusType to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EspnStatusType&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.completed, completed) || other.completed == completed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,completed);

@override
String toString() {
  return 'EspnStatusType(id: $id, name: $name, completed: $completed)';
}


}

/// @nodoc
abstract mixin class $EspnStatusTypeCopyWith<$Res>  {
  factory $EspnStatusTypeCopyWith(EspnStatusType value, $Res Function(EspnStatusType) _then) = _$EspnStatusTypeCopyWithImpl;
@useResult
$Res call({
 String id, String? name, bool completed
});




}
/// @nodoc
class _$EspnStatusTypeCopyWithImpl<$Res>
    implements $EspnStatusTypeCopyWith<$Res> {
  _$EspnStatusTypeCopyWithImpl(this._self, this._then);

  final EspnStatusType _self;
  final $Res Function(EspnStatusType) _then;

/// Create a copy of EspnStatusType
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = freezed,Object? completed = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [EspnStatusType].
extension EspnStatusTypePatterns on EspnStatusType {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EspnStatusType value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EspnStatusType() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EspnStatusType value)  $default,){
final _that = this;
switch (_that) {
case _EspnStatusType():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EspnStatusType value)?  $default,){
final _that = this;
switch (_that) {
case _EspnStatusType() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? name,  bool completed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EspnStatusType() when $default != null:
return $default(_that.id,_that.name,_that.completed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? name,  bool completed)  $default,) {final _that = this;
switch (_that) {
case _EspnStatusType():
return $default(_that.id,_that.name,_that.completed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? name,  bool completed)?  $default,) {final _that = this;
switch (_that) {
case _EspnStatusType() when $default != null:
return $default(_that.id,_that.name,_that.completed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EspnStatusType implements EspnStatusType {
  const _EspnStatusType({required this.id, this.name, this.completed = false});
  factory _EspnStatusType.fromJson(Map<String, dynamic> json) => _$EspnStatusTypeFromJson(json);

@override final  String id;
@override final  String? name;
@override@JsonKey() final  bool completed;

/// Create a copy of EspnStatusType
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EspnStatusTypeCopyWith<_EspnStatusType> get copyWith => __$EspnStatusTypeCopyWithImpl<_EspnStatusType>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EspnStatusTypeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EspnStatusType&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.completed, completed) || other.completed == completed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,completed);

@override
String toString() {
  return 'EspnStatusType(id: $id, name: $name, completed: $completed)';
}


}

/// @nodoc
abstract mixin class _$EspnStatusTypeCopyWith<$Res> implements $EspnStatusTypeCopyWith<$Res> {
  factory _$EspnStatusTypeCopyWith(_EspnStatusType value, $Res Function(_EspnStatusType) _then) = __$EspnStatusTypeCopyWithImpl;
@override @useResult
$Res call({
 String id, String? name, bool completed
});




}
/// @nodoc
class __$EspnStatusTypeCopyWithImpl<$Res>
    implements _$EspnStatusTypeCopyWith<$Res> {
  __$EspnStatusTypeCopyWithImpl(this._self, this._then);

  final _EspnStatusType _self;
  final $Res Function(_EspnStatusType) _then;

/// Create a copy of EspnStatusType
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = freezed,Object? completed = null,}) {
  return _then(_EspnStatusType(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$EspnTeam {

 String get id; String? get name; String? get displayName; String? get shortDisplayName; String? get abbreviation; List<EspnLogo> get logos;
/// Create a copy of EspnTeam
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EspnTeamCopyWith<EspnTeam> get copyWith => _$EspnTeamCopyWithImpl<EspnTeam>(this as EspnTeam, _$identity);

  /// Serializes this EspnTeam to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EspnTeam&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.shortDisplayName, shortDisplayName) || other.shortDisplayName == shortDisplayName)&&(identical(other.abbreviation, abbreviation) || other.abbreviation == abbreviation)&&const DeepCollectionEquality().equals(other.logos, logos));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,displayName,shortDisplayName,abbreviation,const DeepCollectionEquality().hash(logos));

@override
String toString() {
  return 'EspnTeam(id: $id, name: $name, displayName: $displayName, shortDisplayName: $shortDisplayName, abbreviation: $abbreviation, logos: $logos)';
}


}

/// @nodoc
abstract mixin class $EspnTeamCopyWith<$Res>  {
  factory $EspnTeamCopyWith(EspnTeam value, $Res Function(EspnTeam) _then) = _$EspnTeamCopyWithImpl;
@useResult
$Res call({
 String id, String? name, String? displayName, String? shortDisplayName, String? abbreviation, List<EspnLogo> logos
});




}
/// @nodoc
class _$EspnTeamCopyWithImpl<$Res>
    implements $EspnTeamCopyWith<$Res> {
  _$EspnTeamCopyWithImpl(this._self, this._then);

  final EspnTeam _self;
  final $Res Function(EspnTeam) _then;

/// Create a copy of EspnTeam
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = freezed,Object? displayName = freezed,Object? shortDisplayName = freezed,Object? abbreviation = freezed,Object? logos = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,shortDisplayName: freezed == shortDisplayName ? _self.shortDisplayName : shortDisplayName // ignore: cast_nullable_to_non_nullable
as String?,abbreviation: freezed == abbreviation ? _self.abbreviation : abbreviation // ignore: cast_nullable_to_non_nullable
as String?,logos: null == logos ? _self.logos : logos // ignore: cast_nullable_to_non_nullable
as List<EspnLogo>,
  ));
}

}


/// Adds pattern-matching-related methods to [EspnTeam].
extension EspnTeamPatterns on EspnTeam {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EspnTeam value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EspnTeam() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EspnTeam value)  $default,){
final _that = this;
switch (_that) {
case _EspnTeam():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EspnTeam value)?  $default,){
final _that = this;
switch (_that) {
case _EspnTeam() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? name,  String? displayName,  String? shortDisplayName,  String? abbreviation,  List<EspnLogo> logos)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EspnTeam() when $default != null:
return $default(_that.id,_that.name,_that.displayName,_that.shortDisplayName,_that.abbreviation,_that.logos);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? name,  String? displayName,  String? shortDisplayName,  String? abbreviation,  List<EspnLogo> logos)  $default,) {final _that = this;
switch (_that) {
case _EspnTeam():
return $default(_that.id,_that.name,_that.displayName,_that.shortDisplayName,_that.abbreviation,_that.logos);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? name,  String? displayName,  String? shortDisplayName,  String? abbreviation,  List<EspnLogo> logos)?  $default,) {final _that = this;
switch (_that) {
case _EspnTeam() when $default != null:
return $default(_that.id,_that.name,_that.displayName,_that.shortDisplayName,_that.abbreviation,_that.logos);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EspnTeam implements EspnTeam {
  const _EspnTeam({required this.id, this.name, this.displayName, this.shortDisplayName, this.abbreviation, final  List<EspnLogo> logos = const []}): _logos = logos;
  factory _EspnTeam.fromJson(Map<String, dynamic> json) => _$EspnTeamFromJson(json);

@override final  String id;
@override final  String? name;
@override final  String? displayName;
@override final  String? shortDisplayName;
@override final  String? abbreviation;
 final  List<EspnLogo> _logos;
@override@JsonKey() List<EspnLogo> get logos {
  if (_logos is EqualUnmodifiableListView) return _logos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_logos);
}


/// Create a copy of EspnTeam
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EspnTeamCopyWith<_EspnTeam> get copyWith => __$EspnTeamCopyWithImpl<_EspnTeam>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EspnTeamToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EspnTeam&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.shortDisplayName, shortDisplayName) || other.shortDisplayName == shortDisplayName)&&(identical(other.abbreviation, abbreviation) || other.abbreviation == abbreviation)&&const DeepCollectionEquality().equals(other._logos, _logos));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,displayName,shortDisplayName,abbreviation,const DeepCollectionEquality().hash(_logos));

@override
String toString() {
  return 'EspnTeam(id: $id, name: $name, displayName: $displayName, shortDisplayName: $shortDisplayName, abbreviation: $abbreviation, logos: $logos)';
}


}

/// @nodoc
abstract mixin class _$EspnTeamCopyWith<$Res> implements $EspnTeamCopyWith<$Res> {
  factory _$EspnTeamCopyWith(_EspnTeam value, $Res Function(_EspnTeam) _then) = __$EspnTeamCopyWithImpl;
@override @useResult
$Res call({
 String id, String? name, String? displayName, String? shortDisplayName, String? abbreviation, List<EspnLogo> logos
});




}
/// @nodoc
class __$EspnTeamCopyWithImpl<$Res>
    implements _$EspnTeamCopyWith<$Res> {
  __$EspnTeamCopyWithImpl(this._self, this._then);

  final _EspnTeam _self;
  final $Res Function(_EspnTeam) _then;

/// Create a copy of EspnTeam
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = freezed,Object? displayName = freezed,Object? shortDisplayName = freezed,Object? abbreviation = freezed,Object? logos = null,}) {
  return _then(_EspnTeam(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,shortDisplayName: freezed == shortDisplayName ? _self.shortDisplayName : shortDisplayName // ignore: cast_nullable_to_non_nullable
as String?,abbreviation: freezed == abbreviation ? _self.abbreviation : abbreviation // ignore: cast_nullable_to_non_nullable
as String?,logos: null == logos ? _self._logos : logos // ignore: cast_nullable_to_non_nullable
as List<EspnLogo>,
  ));
}


}


/// @nodoc
mixin _$EspnLogo {

 String? get href; String? get alt; List<String> get rel;
/// Create a copy of EspnLogo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EspnLogoCopyWith<EspnLogo> get copyWith => _$EspnLogoCopyWithImpl<EspnLogo>(this as EspnLogo, _$identity);

  /// Serializes this EspnLogo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EspnLogo&&(identical(other.href, href) || other.href == href)&&(identical(other.alt, alt) || other.alt == alt)&&const DeepCollectionEquality().equals(other.rel, rel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,href,alt,const DeepCollectionEquality().hash(rel));

@override
String toString() {
  return 'EspnLogo(href: $href, alt: $alt, rel: $rel)';
}


}

/// @nodoc
abstract mixin class $EspnLogoCopyWith<$Res>  {
  factory $EspnLogoCopyWith(EspnLogo value, $Res Function(EspnLogo) _then) = _$EspnLogoCopyWithImpl;
@useResult
$Res call({
 String? href, String? alt, List<String> rel
});




}
/// @nodoc
class _$EspnLogoCopyWithImpl<$Res>
    implements $EspnLogoCopyWith<$Res> {
  _$EspnLogoCopyWithImpl(this._self, this._then);

  final EspnLogo _self;
  final $Res Function(EspnLogo) _then;

/// Create a copy of EspnLogo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? href = freezed,Object? alt = freezed,Object? rel = null,}) {
  return _then(_self.copyWith(
href: freezed == href ? _self.href : href // ignore: cast_nullable_to_non_nullable
as String?,alt: freezed == alt ? _self.alt : alt // ignore: cast_nullable_to_non_nullable
as String?,rel: null == rel ? _self.rel : rel // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [EspnLogo].
extension EspnLogoPatterns on EspnLogo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EspnLogo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EspnLogo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EspnLogo value)  $default,){
final _that = this;
switch (_that) {
case _EspnLogo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EspnLogo value)?  $default,){
final _that = this;
switch (_that) {
case _EspnLogo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? href,  String? alt,  List<String> rel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EspnLogo() when $default != null:
return $default(_that.href,_that.alt,_that.rel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? href,  String? alt,  List<String> rel)  $default,) {final _that = this;
switch (_that) {
case _EspnLogo():
return $default(_that.href,_that.alt,_that.rel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? href,  String? alt,  List<String> rel)?  $default,) {final _that = this;
switch (_that) {
case _EspnLogo() when $default != null:
return $default(_that.href,_that.alt,_that.rel);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EspnLogo implements EspnLogo {
  const _EspnLogo({this.href, this.alt, final  List<String> rel = const []}): _rel = rel;
  factory _EspnLogo.fromJson(Map<String, dynamic> json) => _$EspnLogoFromJson(json);

@override final  String? href;
@override final  String? alt;
 final  List<String> _rel;
@override@JsonKey() List<String> get rel {
  if (_rel is EqualUnmodifiableListView) return _rel;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rel);
}


/// Create a copy of EspnLogo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EspnLogoCopyWith<_EspnLogo> get copyWith => __$EspnLogoCopyWithImpl<_EspnLogo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EspnLogoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EspnLogo&&(identical(other.href, href) || other.href == href)&&(identical(other.alt, alt) || other.alt == alt)&&const DeepCollectionEquality().equals(other._rel, _rel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,href,alt,const DeepCollectionEquality().hash(_rel));

@override
String toString() {
  return 'EspnLogo(href: $href, alt: $alt, rel: $rel)';
}


}

/// @nodoc
abstract mixin class _$EspnLogoCopyWith<$Res> implements $EspnLogoCopyWith<$Res> {
  factory _$EspnLogoCopyWith(_EspnLogo value, $Res Function(_EspnLogo) _then) = __$EspnLogoCopyWithImpl;
@override @useResult
$Res call({
 String? href, String? alt, List<String> rel
});




}
/// @nodoc
class __$EspnLogoCopyWithImpl<$Res>
    implements _$EspnLogoCopyWith<$Res> {
  __$EspnLogoCopyWithImpl(this._self, this._then);

  final _EspnLogo _self;
  final $Res Function(_EspnLogo) _then;

/// Create a copy of EspnLogo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? href = freezed,Object? alt = freezed,Object? rel = null,}) {
  return _then(_EspnLogo(
href: freezed == href ? _self.href : href // ignore: cast_nullable_to_non_nullable
as String?,alt: freezed == alt ? _self.alt : alt // ignore: cast_nullable_to_non_nullable
as String?,rel: null == rel ? _self._rel : rel // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$EspnLeague {

 String get id; String? get name; String? get slug;
/// Create a copy of EspnLeague
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EspnLeagueCopyWith<EspnLeague> get copyWith => _$EspnLeagueCopyWithImpl<EspnLeague>(this as EspnLeague, _$identity);

  /// Serializes this EspnLeague to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EspnLeague&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug);

@override
String toString() {
  return 'EspnLeague(id: $id, name: $name, slug: $slug)';
}


}

/// @nodoc
abstract mixin class $EspnLeagueCopyWith<$Res>  {
  factory $EspnLeagueCopyWith(EspnLeague value, $Res Function(EspnLeague) _then) = _$EspnLeagueCopyWithImpl;
@useResult
$Res call({
 String id, String? name, String? slug
});




}
/// @nodoc
class _$EspnLeagueCopyWithImpl<$Res>
    implements $EspnLeagueCopyWith<$Res> {
  _$EspnLeagueCopyWithImpl(this._self, this._then);

  final EspnLeague _self;
  final $Res Function(EspnLeague) _then;

/// Create a copy of EspnLeague
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = freezed,Object? slug = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EspnLeague].
extension EspnLeaguePatterns on EspnLeague {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EspnLeague value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EspnLeague() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EspnLeague value)  $default,){
final _that = this;
switch (_that) {
case _EspnLeague():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EspnLeague value)?  $default,){
final _that = this;
switch (_that) {
case _EspnLeague() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? name,  String? slug)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EspnLeague() when $default != null:
return $default(_that.id,_that.name,_that.slug);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? name,  String? slug)  $default,) {final _that = this;
switch (_that) {
case _EspnLeague():
return $default(_that.id,_that.name,_that.slug);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? name,  String? slug)?  $default,) {final _that = this;
switch (_that) {
case _EspnLeague() when $default != null:
return $default(_that.id,_that.name,_that.slug);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EspnLeague implements EspnLeague {
  const _EspnLeague({required this.id, this.name, this.slug});
  factory _EspnLeague.fromJson(Map<String, dynamic> json) => _$EspnLeagueFromJson(json);

@override final  String id;
@override final  String? name;
@override final  String? slug;

/// Create a copy of EspnLeague
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EspnLeagueCopyWith<_EspnLeague> get copyWith => __$EspnLeagueCopyWithImpl<_EspnLeague>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EspnLeagueToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EspnLeague&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug);

@override
String toString() {
  return 'EspnLeague(id: $id, name: $name, slug: $slug)';
}


}

/// @nodoc
abstract mixin class _$EspnLeagueCopyWith<$Res> implements $EspnLeagueCopyWith<$Res> {
  factory _$EspnLeagueCopyWith(_EspnLeague value, $Res Function(_EspnLeague) _then) = __$EspnLeagueCopyWithImpl;
@override @useResult
$Res call({
 String id, String? name, String? slug
});




}
/// @nodoc
class __$EspnLeagueCopyWithImpl<$Res>
    implements _$EspnLeagueCopyWith<$Res> {
  __$EspnLeagueCopyWithImpl(this._self, this._then);

  final _EspnLeague _self;
  final $Res Function(_EspnLeague) _then;

/// Create a copy of EspnLeague
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = freezed,Object? slug = freezed,}) {
  return _then(_EspnLeague(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$EspnSport {

 String get id; String? get name; String? get slug;
/// Create a copy of EspnSport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EspnSportCopyWith<EspnSport> get copyWith => _$EspnSportCopyWithImpl<EspnSport>(this as EspnSport, _$identity);

  /// Serializes this EspnSport to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EspnSport&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug);

@override
String toString() {
  return 'EspnSport(id: $id, name: $name, slug: $slug)';
}


}

/// @nodoc
abstract mixin class $EspnSportCopyWith<$Res>  {
  factory $EspnSportCopyWith(EspnSport value, $Res Function(EspnSport) _then) = _$EspnSportCopyWithImpl;
@useResult
$Res call({
 String id, String? name, String? slug
});




}
/// @nodoc
class _$EspnSportCopyWithImpl<$Res>
    implements $EspnSportCopyWith<$Res> {
  _$EspnSportCopyWithImpl(this._self, this._then);

  final EspnSport _self;
  final $Res Function(EspnSport) _then;

/// Create a copy of EspnSport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = freezed,Object? slug = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EspnSport].
extension EspnSportPatterns on EspnSport {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EspnSport value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EspnSport() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EspnSport value)  $default,){
final _that = this;
switch (_that) {
case _EspnSport():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EspnSport value)?  $default,){
final _that = this;
switch (_that) {
case _EspnSport() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? name,  String? slug)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EspnSport() when $default != null:
return $default(_that.id,_that.name,_that.slug);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? name,  String? slug)  $default,) {final _that = this;
switch (_that) {
case _EspnSport():
return $default(_that.id,_that.name,_that.slug);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? name,  String? slug)?  $default,) {final _that = this;
switch (_that) {
case _EspnSport() when $default != null:
return $default(_that.id,_that.name,_that.slug);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EspnSport implements EspnSport {
  const _EspnSport({required this.id, this.name, this.slug});
  factory _EspnSport.fromJson(Map<String, dynamic> json) => _$EspnSportFromJson(json);

@override final  String id;
@override final  String? name;
@override final  String? slug;

/// Create a copy of EspnSport
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EspnSportCopyWith<_EspnSport> get copyWith => __$EspnSportCopyWithImpl<_EspnSport>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EspnSportToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EspnSport&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug);

@override
String toString() {
  return 'EspnSport(id: $id, name: $name, slug: $slug)';
}


}

/// @nodoc
abstract mixin class _$EspnSportCopyWith<$Res> implements $EspnSportCopyWith<$Res> {
  factory _$EspnSportCopyWith(_EspnSport value, $Res Function(_EspnSport) _then) = __$EspnSportCopyWithImpl;
@override @useResult
$Res call({
 String id, String? name, String? slug
});




}
/// @nodoc
class __$EspnSportCopyWithImpl<$Res>
    implements _$EspnSportCopyWith<$Res> {
  __$EspnSportCopyWithImpl(this._self, this._then);

  final _EspnSport _self;
  final $Res Function(_EspnSport) _then;

/// Create a copy of EspnSport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = freezed,Object? slug = freezed,}) {
  return _then(_EspnSport(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$EspnVenue {

 String get id; String? get fullName; String? get shortName; String? get address; String? get city; String? get state; String? get zipCode; String? get country;
/// Create a copy of EspnVenue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EspnVenueCopyWith<EspnVenue> get copyWith => _$EspnVenueCopyWithImpl<EspnVenue>(this as EspnVenue, _$identity);

  /// Serializes this EspnVenue to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EspnVenue&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.shortName, shortName) || other.shortName == shortName)&&(identical(other.address, address) || other.address == address)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.zipCode, zipCode) || other.zipCode == zipCode)&&(identical(other.country, country) || other.country == country));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,shortName,address,city,state,zipCode,country);

@override
String toString() {
  return 'EspnVenue(id: $id, fullName: $fullName, shortName: $shortName, address: $address, city: $city, state: $state, zipCode: $zipCode, country: $country)';
}


}

/// @nodoc
abstract mixin class $EspnVenueCopyWith<$Res>  {
  factory $EspnVenueCopyWith(EspnVenue value, $Res Function(EspnVenue) _then) = _$EspnVenueCopyWithImpl;
@useResult
$Res call({
 String id, String? fullName, String? shortName, String? address, String? city, String? state, String? zipCode, String? country
});




}
/// @nodoc
class _$EspnVenueCopyWithImpl<$Res>
    implements $EspnVenueCopyWith<$Res> {
  _$EspnVenueCopyWithImpl(this._self, this._then);

  final EspnVenue _self;
  final $Res Function(EspnVenue) _then;

/// Create a copy of EspnVenue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fullName = freezed,Object? shortName = freezed,Object? address = freezed,Object? city = freezed,Object? state = freezed,Object? zipCode = freezed,Object? country = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,shortName: freezed == shortName ? _self.shortName : shortName // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,zipCode: freezed == zipCode ? _self.zipCode : zipCode // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EspnVenue].
extension EspnVenuePatterns on EspnVenue {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EspnVenue value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EspnVenue() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EspnVenue value)  $default,){
final _that = this;
switch (_that) {
case _EspnVenue():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EspnVenue value)?  $default,){
final _that = this;
switch (_that) {
case _EspnVenue() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? fullName,  String? shortName,  String? address,  String? city,  String? state,  String? zipCode,  String? country)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EspnVenue() when $default != null:
return $default(_that.id,_that.fullName,_that.shortName,_that.address,_that.city,_that.state,_that.zipCode,_that.country);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? fullName,  String? shortName,  String? address,  String? city,  String? state,  String? zipCode,  String? country)  $default,) {final _that = this;
switch (_that) {
case _EspnVenue():
return $default(_that.id,_that.fullName,_that.shortName,_that.address,_that.city,_that.state,_that.zipCode,_that.country);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? fullName,  String? shortName,  String? address,  String? city,  String? state,  String? zipCode,  String? country)?  $default,) {final _that = this;
switch (_that) {
case _EspnVenue() when $default != null:
return $default(_that.id,_that.fullName,_that.shortName,_that.address,_that.city,_that.state,_that.zipCode,_that.country);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EspnVenue implements EspnVenue {
  const _EspnVenue({required this.id, this.fullName, this.shortName, this.address, this.city, this.state, this.zipCode, this.country});
  factory _EspnVenue.fromJson(Map<String, dynamic> json) => _$EspnVenueFromJson(json);

@override final  String id;
@override final  String? fullName;
@override final  String? shortName;
@override final  String? address;
@override final  String? city;
@override final  String? state;
@override final  String? zipCode;
@override final  String? country;

/// Create a copy of EspnVenue
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EspnVenueCopyWith<_EspnVenue> get copyWith => __$EspnVenueCopyWithImpl<_EspnVenue>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EspnVenueToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EspnVenue&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.shortName, shortName) || other.shortName == shortName)&&(identical(other.address, address) || other.address == address)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.zipCode, zipCode) || other.zipCode == zipCode)&&(identical(other.country, country) || other.country == country));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,shortName,address,city,state,zipCode,country);

@override
String toString() {
  return 'EspnVenue(id: $id, fullName: $fullName, shortName: $shortName, address: $address, city: $city, state: $state, zipCode: $zipCode, country: $country)';
}


}

/// @nodoc
abstract mixin class _$EspnVenueCopyWith<$Res> implements $EspnVenueCopyWith<$Res> {
  factory _$EspnVenueCopyWith(_EspnVenue value, $Res Function(_EspnVenue) _then) = __$EspnVenueCopyWithImpl;
@override @useResult
$Res call({
 String id, String? fullName, String? shortName, String? address, String? city, String? state, String? zipCode, String? country
});




}
/// @nodoc
class __$EspnVenueCopyWithImpl<$Res>
    implements _$EspnVenueCopyWith<$Res> {
  __$EspnVenueCopyWithImpl(this._self, this._then);

  final _EspnVenue _self;
  final $Res Function(_EspnVenue) _then;

/// Create a copy of EspnVenue
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fullName = freezed,Object? shortName = freezed,Object? address = freezed,Object? city = freezed,Object? state = freezed,Object? zipCode = freezed,Object? country = freezed,}) {
  return _then(_EspnVenue(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,shortName: freezed == shortName ? _self.shortName : shortName // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,zipCode: freezed == zipCode ? _self.zipCode : zipCode // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$EspnCompetitionType {

 String get id; String? get name; String? get abbreviation;
/// Create a copy of EspnCompetitionType
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EspnCompetitionTypeCopyWith<EspnCompetitionType> get copyWith => _$EspnCompetitionTypeCopyWithImpl<EspnCompetitionType>(this as EspnCompetitionType, _$identity);

  /// Serializes this EspnCompetitionType to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EspnCompetitionType&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.abbreviation, abbreviation) || other.abbreviation == abbreviation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,abbreviation);

@override
String toString() {
  return 'EspnCompetitionType(id: $id, name: $name, abbreviation: $abbreviation)';
}


}

/// @nodoc
abstract mixin class $EspnCompetitionTypeCopyWith<$Res>  {
  factory $EspnCompetitionTypeCopyWith(EspnCompetitionType value, $Res Function(EspnCompetitionType) _then) = _$EspnCompetitionTypeCopyWithImpl;
@useResult
$Res call({
 String id, String? name, String? abbreviation
});




}
/// @nodoc
class _$EspnCompetitionTypeCopyWithImpl<$Res>
    implements $EspnCompetitionTypeCopyWith<$Res> {
  _$EspnCompetitionTypeCopyWithImpl(this._self, this._then);

  final EspnCompetitionType _self;
  final $Res Function(EspnCompetitionType) _then;

/// Create a copy of EspnCompetitionType
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = freezed,Object? abbreviation = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,abbreviation: freezed == abbreviation ? _self.abbreviation : abbreviation // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EspnCompetitionType].
extension EspnCompetitionTypePatterns on EspnCompetitionType {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EspnCompetitionType value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EspnCompetitionType() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EspnCompetitionType value)  $default,){
final _that = this;
switch (_that) {
case _EspnCompetitionType():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EspnCompetitionType value)?  $default,){
final _that = this;
switch (_that) {
case _EspnCompetitionType() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? name,  String? abbreviation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EspnCompetitionType() when $default != null:
return $default(_that.id,_that.name,_that.abbreviation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? name,  String? abbreviation)  $default,) {final _that = this;
switch (_that) {
case _EspnCompetitionType():
return $default(_that.id,_that.name,_that.abbreviation);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? name,  String? abbreviation)?  $default,) {final _that = this;
switch (_that) {
case _EspnCompetitionType() when $default != null:
return $default(_that.id,_that.name,_that.abbreviation);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EspnCompetitionType implements EspnCompetitionType {
  const _EspnCompetitionType({required this.id, this.name, this.abbreviation});
  factory _EspnCompetitionType.fromJson(Map<String, dynamic> json) => _$EspnCompetitionTypeFromJson(json);

@override final  String id;
@override final  String? name;
@override final  String? abbreviation;

/// Create a copy of EspnCompetitionType
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EspnCompetitionTypeCopyWith<_EspnCompetitionType> get copyWith => __$EspnCompetitionTypeCopyWithImpl<_EspnCompetitionType>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EspnCompetitionTypeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EspnCompetitionType&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.abbreviation, abbreviation) || other.abbreviation == abbreviation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,abbreviation);

@override
String toString() {
  return 'EspnCompetitionType(id: $id, name: $name, abbreviation: $abbreviation)';
}


}

/// @nodoc
abstract mixin class _$EspnCompetitionTypeCopyWith<$Res> implements $EspnCompetitionTypeCopyWith<$Res> {
  factory _$EspnCompetitionTypeCopyWith(_EspnCompetitionType value, $Res Function(_EspnCompetitionType) _then) = __$EspnCompetitionTypeCopyWithImpl;
@override @useResult
$Res call({
 String id, String? name, String? abbreviation
});




}
/// @nodoc
class __$EspnCompetitionTypeCopyWithImpl<$Res>
    implements _$EspnCompetitionTypeCopyWith<$Res> {
  __$EspnCompetitionTypeCopyWithImpl(this._self, this._then);

  final _EspnCompetitionType _self;
  final $Res Function(_EspnCompetitionType) _then;

/// Create a copy of EspnCompetitionType
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = freezed,Object? abbreviation = freezed,}) {
  return _then(_EspnCompetitionType(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,abbreviation: freezed == abbreviation ? _self.abbreviation : abbreviation // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$EspnLink {

 String? get href; String? get rel; String? get text;
/// Create a copy of EspnLink
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EspnLinkCopyWith<EspnLink> get copyWith => _$EspnLinkCopyWithImpl<EspnLink>(this as EspnLink, _$identity);

  /// Serializes this EspnLink to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EspnLink&&(identical(other.href, href) || other.href == href)&&(identical(other.rel, rel) || other.rel == rel)&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,href,rel,text);

@override
String toString() {
  return 'EspnLink(href: $href, rel: $rel, text: $text)';
}


}

/// @nodoc
abstract mixin class $EspnLinkCopyWith<$Res>  {
  factory $EspnLinkCopyWith(EspnLink value, $Res Function(EspnLink) _then) = _$EspnLinkCopyWithImpl;
@useResult
$Res call({
 String? href, String? rel, String? text
});




}
/// @nodoc
class _$EspnLinkCopyWithImpl<$Res>
    implements $EspnLinkCopyWith<$Res> {
  _$EspnLinkCopyWithImpl(this._self, this._then);

  final EspnLink _self;
  final $Res Function(EspnLink) _then;

/// Create a copy of EspnLink
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? href = freezed,Object? rel = freezed,Object? text = freezed,}) {
  return _then(_self.copyWith(
href: freezed == href ? _self.href : href // ignore: cast_nullable_to_non_nullable
as String?,rel: freezed == rel ? _self.rel : rel // ignore: cast_nullable_to_non_nullable
as String?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EspnLink].
extension EspnLinkPatterns on EspnLink {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EspnLink value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EspnLink() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EspnLink value)  $default,){
final _that = this;
switch (_that) {
case _EspnLink():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EspnLink value)?  $default,){
final _that = this;
switch (_that) {
case _EspnLink() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? href,  String? rel,  String? text)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EspnLink() when $default != null:
return $default(_that.href,_that.rel,_that.text);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? href,  String? rel,  String? text)  $default,) {final _that = this;
switch (_that) {
case _EspnLink():
return $default(_that.href,_that.rel,_that.text);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? href,  String? rel,  String? text)?  $default,) {final _that = this;
switch (_that) {
case _EspnLink() when $default != null:
return $default(_that.href,_that.rel,_that.text);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EspnLink implements EspnLink {
  const _EspnLink({this.href, this.rel, this.text});
  factory _EspnLink.fromJson(Map<String, dynamic> json) => _$EspnLinkFromJson(json);

@override final  String? href;
@override final  String? rel;
@override final  String? text;

/// Create a copy of EspnLink
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EspnLinkCopyWith<_EspnLink> get copyWith => __$EspnLinkCopyWithImpl<_EspnLink>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EspnLinkToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EspnLink&&(identical(other.href, href) || other.href == href)&&(identical(other.rel, rel) || other.rel == rel)&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,href,rel,text);

@override
String toString() {
  return 'EspnLink(href: $href, rel: $rel, text: $text)';
}


}

/// @nodoc
abstract mixin class _$EspnLinkCopyWith<$Res> implements $EspnLinkCopyWith<$Res> {
  factory _$EspnLinkCopyWith(_EspnLink value, $Res Function(_EspnLink) _then) = __$EspnLinkCopyWithImpl;
@override @useResult
$Res call({
 String? href, String? rel, String? text
});




}
/// @nodoc
class __$EspnLinkCopyWithImpl<$Res>
    implements _$EspnLinkCopyWith<$Res> {
  __$EspnLinkCopyWithImpl(this._self, this._then);

  final _EspnLink _self;
  final $Res Function(_EspnLink) _then;

/// Create a copy of EspnLink
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? href = freezed,Object? rel = freezed,Object? text = freezed,}) {
  return _then(_EspnLink(
href: freezed == href ? _self.href : href // ignore: cast_nullable_to_non_nullable
as String?,rel: freezed == rel ? _self.rel : rel // ignore: cast_nullable_to_non_nullable
as String?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$EspnSummaryResponse {

 EspnArticle? get article; List<EspnCommentaryItem> get commentary;
/// Create a copy of EspnSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EspnSummaryResponseCopyWith<EspnSummaryResponse> get copyWith => _$EspnSummaryResponseCopyWithImpl<EspnSummaryResponse>(this as EspnSummaryResponse, _$identity);

  /// Serializes this EspnSummaryResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EspnSummaryResponse&&(identical(other.article, article) || other.article == article)&&const DeepCollectionEquality().equals(other.commentary, commentary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,article,const DeepCollectionEquality().hash(commentary));

@override
String toString() {
  return 'EspnSummaryResponse(article: $article, commentary: $commentary)';
}


}

/// @nodoc
abstract mixin class $EspnSummaryResponseCopyWith<$Res>  {
  factory $EspnSummaryResponseCopyWith(EspnSummaryResponse value, $Res Function(EspnSummaryResponse) _then) = _$EspnSummaryResponseCopyWithImpl;
@useResult
$Res call({
 EspnArticle? article, List<EspnCommentaryItem> commentary
});


$EspnArticleCopyWith<$Res>? get article;

}
/// @nodoc
class _$EspnSummaryResponseCopyWithImpl<$Res>
    implements $EspnSummaryResponseCopyWith<$Res> {
  _$EspnSummaryResponseCopyWithImpl(this._self, this._then);

  final EspnSummaryResponse _self;
  final $Res Function(EspnSummaryResponse) _then;

/// Create a copy of EspnSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? article = freezed,Object? commentary = null,}) {
  return _then(_self.copyWith(
article: freezed == article ? _self.article : article // ignore: cast_nullable_to_non_nullable
as EspnArticle?,commentary: null == commentary ? _self.commentary : commentary // ignore: cast_nullable_to_non_nullable
as List<EspnCommentaryItem>,
  ));
}
/// Create a copy of EspnSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EspnArticleCopyWith<$Res>? get article {
    if (_self.article == null) {
    return null;
  }

  return $EspnArticleCopyWith<$Res>(_self.article!, (value) {
    return _then(_self.copyWith(article: value));
  });
}
}


/// Adds pattern-matching-related methods to [EspnSummaryResponse].
extension EspnSummaryResponsePatterns on EspnSummaryResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EspnSummaryResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EspnSummaryResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EspnSummaryResponse value)  $default,){
final _that = this;
switch (_that) {
case _EspnSummaryResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EspnSummaryResponse value)?  $default,){
final _that = this;
switch (_that) {
case _EspnSummaryResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( EspnArticle? article,  List<EspnCommentaryItem> commentary)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EspnSummaryResponse() when $default != null:
return $default(_that.article,_that.commentary);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( EspnArticle? article,  List<EspnCommentaryItem> commentary)  $default,) {final _that = this;
switch (_that) {
case _EspnSummaryResponse():
return $default(_that.article,_that.commentary);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( EspnArticle? article,  List<EspnCommentaryItem> commentary)?  $default,) {final _that = this;
switch (_that) {
case _EspnSummaryResponse() when $default != null:
return $default(_that.article,_that.commentary);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EspnSummaryResponse implements EspnSummaryResponse {
  const _EspnSummaryResponse({this.article, final  List<EspnCommentaryItem> commentary = const []}): _commentary = commentary;
  factory _EspnSummaryResponse.fromJson(Map<String, dynamic> json) => _$EspnSummaryResponseFromJson(json);

@override final  EspnArticle? article;
 final  List<EspnCommentaryItem> _commentary;
@override@JsonKey() List<EspnCommentaryItem> get commentary {
  if (_commentary is EqualUnmodifiableListView) return _commentary;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_commentary);
}


/// Create a copy of EspnSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EspnSummaryResponseCopyWith<_EspnSummaryResponse> get copyWith => __$EspnSummaryResponseCopyWithImpl<_EspnSummaryResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EspnSummaryResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EspnSummaryResponse&&(identical(other.article, article) || other.article == article)&&const DeepCollectionEquality().equals(other._commentary, _commentary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,article,const DeepCollectionEquality().hash(_commentary));

@override
String toString() {
  return 'EspnSummaryResponse(article: $article, commentary: $commentary)';
}


}

/// @nodoc
abstract mixin class _$EspnSummaryResponseCopyWith<$Res> implements $EspnSummaryResponseCopyWith<$Res> {
  factory _$EspnSummaryResponseCopyWith(_EspnSummaryResponse value, $Res Function(_EspnSummaryResponse) _then) = __$EspnSummaryResponseCopyWithImpl;
@override @useResult
$Res call({
 EspnArticle? article, List<EspnCommentaryItem> commentary
});


@override $EspnArticleCopyWith<$Res>? get article;

}
/// @nodoc
class __$EspnSummaryResponseCopyWithImpl<$Res>
    implements _$EspnSummaryResponseCopyWith<$Res> {
  __$EspnSummaryResponseCopyWithImpl(this._self, this._then);

  final _EspnSummaryResponse _self;
  final $Res Function(_EspnSummaryResponse) _then;

/// Create a copy of EspnSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? article = freezed,Object? commentary = null,}) {
  return _then(_EspnSummaryResponse(
article: freezed == article ? _self.article : article // ignore: cast_nullable_to_non_nullable
as EspnArticle?,commentary: null == commentary ? _self._commentary : commentary // ignore: cast_nullable_to_non_nullable
as List<EspnCommentaryItem>,
  ));
}

/// Create a copy of EspnSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EspnArticleCopyWith<$Res>? get article {
    if (_self.article == null) {
    return null;
  }

  return $EspnArticleCopyWith<$Res>(_self.article!, (value) {
    return _then(_self.copyWith(article: value));
  });
}
}


/// @nodoc
mixin _$EspnArticle {

 List<EspnCommentaryItem> get commentary; List<EspnCommentaryItem> get items;
/// Create a copy of EspnArticle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EspnArticleCopyWith<EspnArticle> get copyWith => _$EspnArticleCopyWithImpl<EspnArticle>(this as EspnArticle, _$identity);

  /// Serializes this EspnArticle to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EspnArticle&&const DeepCollectionEquality().equals(other.commentary, commentary)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(commentary),const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'EspnArticle(commentary: $commentary, items: $items)';
}


}

/// @nodoc
abstract mixin class $EspnArticleCopyWith<$Res>  {
  factory $EspnArticleCopyWith(EspnArticle value, $Res Function(EspnArticle) _then) = _$EspnArticleCopyWithImpl;
@useResult
$Res call({
 List<EspnCommentaryItem> commentary, List<EspnCommentaryItem> items
});




}
/// @nodoc
class _$EspnArticleCopyWithImpl<$Res>
    implements $EspnArticleCopyWith<$Res> {
  _$EspnArticleCopyWithImpl(this._self, this._then);

  final EspnArticle _self;
  final $Res Function(EspnArticle) _then;

/// Create a copy of EspnArticle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? commentary = null,Object? items = null,}) {
  return _then(_self.copyWith(
commentary: null == commentary ? _self.commentary : commentary // ignore: cast_nullable_to_non_nullable
as List<EspnCommentaryItem>,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<EspnCommentaryItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [EspnArticle].
extension EspnArticlePatterns on EspnArticle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EspnArticle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EspnArticle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EspnArticle value)  $default,){
final _that = this;
switch (_that) {
case _EspnArticle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EspnArticle value)?  $default,){
final _that = this;
switch (_that) {
case _EspnArticle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<EspnCommentaryItem> commentary,  List<EspnCommentaryItem> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EspnArticle() when $default != null:
return $default(_that.commentary,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<EspnCommentaryItem> commentary,  List<EspnCommentaryItem> items)  $default,) {final _that = this;
switch (_that) {
case _EspnArticle():
return $default(_that.commentary,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<EspnCommentaryItem> commentary,  List<EspnCommentaryItem> items)?  $default,) {final _that = this;
switch (_that) {
case _EspnArticle() when $default != null:
return $default(_that.commentary,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EspnArticle implements EspnArticle {
  const _EspnArticle({final  List<EspnCommentaryItem> commentary = const [], final  List<EspnCommentaryItem> items = const []}): _commentary = commentary,_items = items;
  factory _EspnArticle.fromJson(Map<String, dynamic> json) => _$EspnArticleFromJson(json);

 final  List<EspnCommentaryItem> _commentary;
@override@JsonKey() List<EspnCommentaryItem> get commentary {
  if (_commentary is EqualUnmodifiableListView) return _commentary;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_commentary);
}

 final  List<EspnCommentaryItem> _items;
@override@JsonKey() List<EspnCommentaryItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of EspnArticle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EspnArticleCopyWith<_EspnArticle> get copyWith => __$EspnArticleCopyWithImpl<_EspnArticle>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EspnArticleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EspnArticle&&const DeepCollectionEquality().equals(other._commentary, _commentary)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_commentary),const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'EspnArticle(commentary: $commentary, items: $items)';
}


}

/// @nodoc
abstract mixin class _$EspnArticleCopyWith<$Res> implements $EspnArticleCopyWith<$Res> {
  factory _$EspnArticleCopyWith(_EspnArticle value, $Res Function(_EspnArticle) _then) = __$EspnArticleCopyWithImpl;
@override @useResult
$Res call({
 List<EspnCommentaryItem> commentary, List<EspnCommentaryItem> items
});




}
/// @nodoc
class __$EspnArticleCopyWithImpl<$Res>
    implements _$EspnArticleCopyWith<$Res> {
  __$EspnArticleCopyWithImpl(this._self, this._then);

  final _EspnArticle _self;
  final $Res Function(_EspnArticle) _then;

/// Create a copy of EspnArticle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? commentary = null,Object? items = null,}) {
  return _then(_EspnArticle(
commentary: null == commentary ? _self._commentary : commentary // ignore: cast_nullable_to_non_nullable
as List<EspnCommentaryItem>,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<EspnCommentaryItem>,
  ));
}


}


/// @nodoc
mixin _$EspnCommentaryItem {

 String? get id; String? get playId; int? get sequence; String? get text; String? get shortText; String? get headline; String? get description; int? get minute; EspnTime? get time; bool get scoringPlay; String? get scoreValue; String? get type; String? get typeText; String? get timestamp; String? get date; String? get created;
/// Create a copy of EspnCommentaryItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EspnCommentaryItemCopyWith<EspnCommentaryItem> get copyWith => _$EspnCommentaryItemCopyWithImpl<EspnCommentaryItem>(this as EspnCommentaryItem, _$identity);

  /// Serializes this EspnCommentaryItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EspnCommentaryItem&&(identical(other.id, id) || other.id == id)&&(identical(other.playId, playId) || other.playId == playId)&&(identical(other.sequence, sequence) || other.sequence == sequence)&&(identical(other.text, text) || other.text == text)&&(identical(other.shortText, shortText) || other.shortText == shortText)&&(identical(other.headline, headline) || other.headline == headline)&&(identical(other.description, description) || other.description == description)&&(identical(other.minute, minute) || other.minute == minute)&&(identical(other.time, time) || other.time == time)&&(identical(other.scoringPlay, scoringPlay) || other.scoringPlay == scoringPlay)&&(identical(other.scoreValue, scoreValue) || other.scoreValue == scoreValue)&&(identical(other.type, type) || other.type == type)&&(identical(other.typeText, typeText) || other.typeText == typeText)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.date, date) || other.date == date)&&(identical(other.created, created) || other.created == created));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,playId,sequence,text,shortText,headline,description,minute,time,scoringPlay,scoreValue,type,typeText,timestamp,date,created);

@override
String toString() {
  return 'EspnCommentaryItem(id: $id, playId: $playId, sequence: $sequence, text: $text, shortText: $shortText, headline: $headline, description: $description, minute: $minute, time: $time, scoringPlay: $scoringPlay, scoreValue: $scoreValue, type: $type, typeText: $typeText, timestamp: $timestamp, date: $date, created: $created)';
}


}

/// @nodoc
abstract mixin class $EspnCommentaryItemCopyWith<$Res>  {
  factory $EspnCommentaryItemCopyWith(EspnCommentaryItem value, $Res Function(EspnCommentaryItem) _then) = _$EspnCommentaryItemCopyWithImpl;
@useResult
$Res call({
 String? id, String? playId, int? sequence, String? text, String? shortText, String? headline, String? description, int? minute, EspnTime? time, bool scoringPlay, String? scoreValue, String? type, String? typeText, String? timestamp, String? date, String? created
});


$EspnTimeCopyWith<$Res>? get time;

}
/// @nodoc
class _$EspnCommentaryItemCopyWithImpl<$Res>
    implements $EspnCommentaryItemCopyWith<$Res> {
  _$EspnCommentaryItemCopyWithImpl(this._self, this._then);

  final EspnCommentaryItem _self;
  final $Res Function(EspnCommentaryItem) _then;

/// Create a copy of EspnCommentaryItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? playId = freezed,Object? sequence = freezed,Object? text = freezed,Object? shortText = freezed,Object? headline = freezed,Object? description = freezed,Object? minute = freezed,Object? time = freezed,Object? scoringPlay = null,Object? scoreValue = freezed,Object? type = freezed,Object? typeText = freezed,Object? timestamp = freezed,Object? date = freezed,Object? created = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,playId: freezed == playId ? _self.playId : playId // ignore: cast_nullable_to_non_nullable
as String?,sequence: freezed == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as int?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,shortText: freezed == shortText ? _self.shortText : shortText // ignore: cast_nullable_to_non_nullable
as String?,headline: freezed == headline ? _self.headline : headline // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,minute: freezed == minute ? _self.minute : minute // ignore: cast_nullable_to_non_nullable
as int?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as EspnTime?,scoringPlay: null == scoringPlay ? _self.scoringPlay : scoringPlay // ignore: cast_nullable_to_non_nullable
as bool,scoreValue: freezed == scoreValue ? _self.scoreValue : scoreValue // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,typeText: freezed == typeText ? _self.typeText : typeText // ignore: cast_nullable_to_non_nullable
as String?,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,created: freezed == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of EspnCommentaryItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EspnTimeCopyWith<$Res>? get time {
    if (_self.time == null) {
    return null;
  }

  return $EspnTimeCopyWith<$Res>(_self.time!, (value) {
    return _then(_self.copyWith(time: value));
  });
}
}


/// Adds pattern-matching-related methods to [EspnCommentaryItem].
extension EspnCommentaryItemPatterns on EspnCommentaryItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EspnCommentaryItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EspnCommentaryItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EspnCommentaryItem value)  $default,){
final _that = this;
switch (_that) {
case _EspnCommentaryItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EspnCommentaryItem value)?  $default,){
final _that = this;
switch (_that) {
case _EspnCommentaryItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? playId,  int? sequence,  String? text,  String? shortText,  String? headline,  String? description,  int? minute,  EspnTime? time,  bool scoringPlay,  String? scoreValue,  String? type,  String? typeText,  String? timestamp,  String? date,  String? created)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EspnCommentaryItem() when $default != null:
return $default(_that.id,_that.playId,_that.sequence,_that.text,_that.shortText,_that.headline,_that.description,_that.minute,_that.time,_that.scoringPlay,_that.scoreValue,_that.type,_that.typeText,_that.timestamp,_that.date,_that.created);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? playId,  int? sequence,  String? text,  String? shortText,  String? headline,  String? description,  int? minute,  EspnTime? time,  bool scoringPlay,  String? scoreValue,  String? type,  String? typeText,  String? timestamp,  String? date,  String? created)  $default,) {final _that = this;
switch (_that) {
case _EspnCommentaryItem():
return $default(_that.id,_that.playId,_that.sequence,_that.text,_that.shortText,_that.headline,_that.description,_that.minute,_that.time,_that.scoringPlay,_that.scoreValue,_that.type,_that.typeText,_that.timestamp,_that.date,_that.created);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? playId,  int? sequence,  String? text,  String? shortText,  String? headline,  String? description,  int? minute,  EspnTime? time,  bool scoringPlay,  String? scoreValue,  String? type,  String? typeText,  String? timestamp,  String? date,  String? created)?  $default,) {final _that = this;
switch (_that) {
case _EspnCommentaryItem() when $default != null:
return $default(_that.id,_that.playId,_that.sequence,_that.text,_that.shortText,_that.headline,_that.description,_that.minute,_that.time,_that.scoringPlay,_that.scoreValue,_that.type,_that.typeText,_that.timestamp,_that.date,_that.created);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EspnCommentaryItem implements EspnCommentaryItem {
  const _EspnCommentaryItem({this.id, this.playId, this.sequence, this.text, this.shortText, this.headline, this.description, this.minute, this.time, this.scoringPlay = false, this.scoreValue, this.type, this.typeText, this.timestamp, this.date, this.created});
  factory _EspnCommentaryItem.fromJson(Map<String, dynamic> json) => _$EspnCommentaryItemFromJson(json);

@override final  String? id;
@override final  String? playId;
@override final  int? sequence;
@override final  String? text;
@override final  String? shortText;
@override final  String? headline;
@override final  String? description;
@override final  int? minute;
@override final  EspnTime? time;
@override@JsonKey() final  bool scoringPlay;
@override final  String? scoreValue;
@override final  String? type;
@override final  String? typeText;
@override final  String? timestamp;
@override final  String? date;
@override final  String? created;

/// Create a copy of EspnCommentaryItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EspnCommentaryItemCopyWith<_EspnCommentaryItem> get copyWith => __$EspnCommentaryItemCopyWithImpl<_EspnCommentaryItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EspnCommentaryItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EspnCommentaryItem&&(identical(other.id, id) || other.id == id)&&(identical(other.playId, playId) || other.playId == playId)&&(identical(other.sequence, sequence) || other.sequence == sequence)&&(identical(other.text, text) || other.text == text)&&(identical(other.shortText, shortText) || other.shortText == shortText)&&(identical(other.headline, headline) || other.headline == headline)&&(identical(other.description, description) || other.description == description)&&(identical(other.minute, minute) || other.minute == minute)&&(identical(other.time, time) || other.time == time)&&(identical(other.scoringPlay, scoringPlay) || other.scoringPlay == scoringPlay)&&(identical(other.scoreValue, scoreValue) || other.scoreValue == scoreValue)&&(identical(other.type, type) || other.type == type)&&(identical(other.typeText, typeText) || other.typeText == typeText)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.date, date) || other.date == date)&&(identical(other.created, created) || other.created == created));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,playId,sequence,text,shortText,headline,description,minute,time,scoringPlay,scoreValue,type,typeText,timestamp,date,created);

@override
String toString() {
  return 'EspnCommentaryItem(id: $id, playId: $playId, sequence: $sequence, text: $text, shortText: $shortText, headline: $headline, description: $description, minute: $minute, time: $time, scoringPlay: $scoringPlay, scoreValue: $scoreValue, type: $type, typeText: $typeText, timestamp: $timestamp, date: $date, created: $created)';
}


}

/// @nodoc
abstract mixin class _$EspnCommentaryItemCopyWith<$Res> implements $EspnCommentaryItemCopyWith<$Res> {
  factory _$EspnCommentaryItemCopyWith(_EspnCommentaryItem value, $Res Function(_EspnCommentaryItem) _then) = __$EspnCommentaryItemCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? playId, int? sequence, String? text, String? shortText, String? headline, String? description, int? minute, EspnTime? time, bool scoringPlay, String? scoreValue, String? type, String? typeText, String? timestamp, String? date, String? created
});


@override $EspnTimeCopyWith<$Res>? get time;

}
/// @nodoc
class __$EspnCommentaryItemCopyWithImpl<$Res>
    implements _$EspnCommentaryItemCopyWith<$Res> {
  __$EspnCommentaryItemCopyWithImpl(this._self, this._then);

  final _EspnCommentaryItem _self;
  final $Res Function(_EspnCommentaryItem) _then;

/// Create a copy of EspnCommentaryItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? playId = freezed,Object? sequence = freezed,Object? text = freezed,Object? shortText = freezed,Object? headline = freezed,Object? description = freezed,Object? minute = freezed,Object? time = freezed,Object? scoringPlay = null,Object? scoreValue = freezed,Object? type = freezed,Object? typeText = freezed,Object? timestamp = freezed,Object? date = freezed,Object? created = freezed,}) {
  return _then(_EspnCommentaryItem(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,playId: freezed == playId ? _self.playId : playId // ignore: cast_nullable_to_non_nullable
as String?,sequence: freezed == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as int?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,shortText: freezed == shortText ? _self.shortText : shortText // ignore: cast_nullable_to_non_nullable
as String?,headline: freezed == headline ? _self.headline : headline // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,minute: freezed == minute ? _self.minute : minute // ignore: cast_nullable_to_non_nullable
as int?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as EspnTime?,scoringPlay: null == scoringPlay ? _self.scoringPlay : scoringPlay // ignore: cast_nullable_to_non_nullable
as bool,scoreValue: freezed == scoreValue ? _self.scoreValue : scoreValue // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,typeText: freezed == typeText ? _self.typeText : typeText // ignore: cast_nullable_to_non_nullable
as String?,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,created: freezed == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of EspnCommentaryItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EspnTimeCopyWith<$Res>? get time {
    if (_self.time == null) {
    return null;
  }

  return $EspnTimeCopyWith<$Res>(_self.time!, (value) {
    return _then(_self.copyWith(time: value));
  });
}
}


/// @nodoc
mixin _$EspnTime {

 String? get displayValue; String? get value; String? get clock; String? get date;
/// Create a copy of EspnTime
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EspnTimeCopyWith<EspnTime> get copyWith => _$EspnTimeCopyWithImpl<EspnTime>(this as EspnTime, _$identity);

  /// Serializes this EspnTime to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EspnTime&&(identical(other.displayValue, displayValue) || other.displayValue == displayValue)&&(identical(other.value, value) || other.value == value)&&(identical(other.clock, clock) || other.clock == clock)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,displayValue,value,clock,date);

@override
String toString() {
  return 'EspnTime(displayValue: $displayValue, value: $value, clock: $clock, date: $date)';
}


}

/// @nodoc
abstract mixin class $EspnTimeCopyWith<$Res>  {
  factory $EspnTimeCopyWith(EspnTime value, $Res Function(EspnTime) _then) = _$EspnTimeCopyWithImpl;
@useResult
$Res call({
 String? displayValue, String? value, String? clock, String? date
});




}
/// @nodoc
class _$EspnTimeCopyWithImpl<$Res>
    implements $EspnTimeCopyWith<$Res> {
  _$EspnTimeCopyWithImpl(this._self, this._then);

  final EspnTime _self;
  final $Res Function(EspnTime) _then;

/// Create a copy of EspnTime
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? displayValue = freezed,Object? value = freezed,Object? clock = freezed,Object? date = freezed,}) {
  return _then(_self.copyWith(
displayValue: freezed == displayValue ? _self.displayValue : displayValue // ignore: cast_nullable_to_non_nullable
as String?,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String?,clock: freezed == clock ? _self.clock : clock // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EspnTime].
extension EspnTimePatterns on EspnTime {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EspnTime value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EspnTime() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EspnTime value)  $default,){
final _that = this;
switch (_that) {
case _EspnTime():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EspnTime value)?  $default,){
final _that = this;
switch (_that) {
case _EspnTime() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? displayValue,  String? value,  String? clock,  String? date)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EspnTime() when $default != null:
return $default(_that.displayValue,_that.value,_that.clock,_that.date);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? displayValue,  String? value,  String? clock,  String? date)  $default,) {final _that = this;
switch (_that) {
case _EspnTime():
return $default(_that.displayValue,_that.value,_that.clock,_that.date);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? displayValue,  String? value,  String? clock,  String? date)?  $default,) {final _that = this;
switch (_that) {
case _EspnTime() when $default != null:
return $default(_that.displayValue,_that.value,_that.clock,_that.date);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EspnTime implements EspnTime {
  const _EspnTime({this.displayValue, this.value, this.clock, this.date});
  factory _EspnTime.fromJson(Map<String, dynamic> json) => _$EspnTimeFromJson(json);

@override final  String? displayValue;
@override final  String? value;
@override final  String? clock;
@override final  String? date;

/// Create a copy of EspnTime
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EspnTimeCopyWith<_EspnTime> get copyWith => __$EspnTimeCopyWithImpl<_EspnTime>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EspnTimeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EspnTime&&(identical(other.displayValue, displayValue) || other.displayValue == displayValue)&&(identical(other.value, value) || other.value == value)&&(identical(other.clock, clock) || other.clock == clock)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,displayValue,value,clock,date);

@override
String toString() {
  return 'EspnTime(displayValue: $displayValue, value: $value, clock: $clock, date: $date)';
}


}

/// @nodoc
abstract mixin class _$EspnTimeCopyWith<$Res> implements $EspnTimeCopyWith<$Res> {
  factory _$EspnTimeCopyWith(_EspnTime value, $Res Function(_EspnTime) _then) = __$EspnTimeCopyWithImpl;
@override @useResult
$Res call({
 String? displayValue, String? value, String? clock, String? date
});




}
/// @nodoc
class __$EspnTimeCopyWithImpl<$Res>
    implements _$EspnTimeCopyWith<$Res> {
  __$EspnTimeCopyWithImpl(this._self, this._then);

  final _EspnTime _self;
  final $Res Function(_EspnTime) _then;

/// Create a copy of EspnTime
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? displayValue = freezed,Object? value = freezed,Object? clock = freezed,Object? date = freezed,}) {
  return _then(_EspnTime(
displayValue: freezed == displayValue ? _self.displayValue : displayValue // ignore: cast_nullable_to_non_nullable
as String?,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String?,clock: freezed == clock ? _self.clock : clock // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
