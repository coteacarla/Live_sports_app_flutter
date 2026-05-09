// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'espn_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EspnScoreboardResponse _$EspnScoreboardResponseFromJson(
    Map<String, dynamic> json) {
  return _EspnScoreboardResponse.fromJson(json);
}

/// @nodoc
mixin _$EspnScoreboardResponse {
  List<EspnEvent> get events => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EspnScoreboardResponseCopyWith<EspnScoreboardResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EspnScoreboardResponseCopyWith<$Res> {
  factory $EspnScoreboardResponseCopyWith(EspnScoreboardResponse value,
          $Res Function(EspnScoreboardResponse) then) =
      _$EspnScoreboardResponseCopyWithImpl<$Res, EspnScoreboardResponse>;
  @useResult
  $Res call({List<EspnEvent> events});
}

/// @nodoc
class _$EspnScoreboardResponseCopyWithImpl<$Res,
        $Val extends EspnScoreboardResponse>
    implements $EspnScoreboardResponseCopyWith<$Res> {
  _$EspnScoreboardResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? events = null,
  }) {
    return _then(_value.copyWith(
      events: null == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<EspnEvent>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EspnScoreboardResponseImplCopyWith<$Res>
    implements $EspnScoreboardResponseCopyWith<$Res> {
  factory _$$EspnScoreboardResponseImplCopyWith(
          _$EspnScoreboardResponseImpl value,
          $Res Function(_$EspnScoreboardResponseImpl) then) =
      __$$EspnScoreboardResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<EspnEvent> events});
}

/// @nodoc
class __$$EspnScoreboardResponseImplCopyWithImpl<$Res>
    extends _$EspnScoreboardResponseCopyWithImpl<$Res,
        _$EspnScoreboardResponseImpl>
    implements _$$EspnScoreboardResponseImplCopyWith<$Res> {
  __$$EspnScoreboardResponseImplCopyWithImpl(
      _$EspnScoreboardResponseImpl _value,
      $Res Function(_$EspnScoreboardResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? events = null,
  }) {
    return _then(_$EspnScoreboardResponseImpl(
      events: null == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<EspnEvent>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EspnScoreboardResponseImpl implements _EspnScoreboardResponse {
  const _$EspnScoreboardResponseImpl({final List<EspnEvent> events = const []})
      : _events = events;

  factory _$EspnScoreboardResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$EspnScoreboardResponseImplFromJson(json);

  final List<EspnEvent> _events;
  @override
  @JsonKey()
  List<EspnEvent> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  @override
  String toString() {
    return 'EspnScoreboardResponse(events: $events)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EspnScoreboardResponseImpl &&
            const DeepCollectionEquality().equals(other._events, _events));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_events));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EspnScoreboardResponseImplCopyWith<_$EspnScoreboardResponseImpl>
      get copyWith => __$$EspnScoreboardResponseImplCopyWithImpl<
          _$EspnScoreboardResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EspnScoreboardResponseImplToJson(
      this,
    );
  }
}

abstract class _EspnScoreboardResponse implements EspnScoreboardResponse {
  const factory _EspnScoreboardResponse({final List<EspnEvent> events}) =
      _$EspnScoreboardResponseImpl;

  factory _EspnScoreboardResponse.fromJson(Map<String, dynamic> json) =
      _$EspnScoreboardResponseImpl.fromJson;

  @override
  List<EspnEvent> get events;
  @override
  @JsonKey(ignore: true)
  _$$EspnScoreboardResponseImplCopyWith<_$EspnScoreboardResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

EspnEvent _$EspnEventFromJson(Map<String, dynamic> json) {
  return _EspnEvent.fromJson(json);
}

/// @nodoc
mixin _$EspnEvent {
  String get id => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  EspnStatus get status => throw _privateConstructorUsedError;
  List<EspnCompetition> get competitions => throw _privateConstructorUsedError;
  EspnLeague? get league => throw _privateConstructorUsedError;
  EspnSport? get sport => throw _privateConstructorUsedError;
  List<EspnLink> get links => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EspnEventCopyWith<EspnEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EspnEventCopyWith<$Res> {
  factory $EspnEventCopyWith(EspnEvent value, $Res Function(EspnEvent) then) =
      _$EspnEventCopyWithImpl<$Res, EspnEvent>;
  @useResult
  $Res call(
      {String id,
      String date,
      String name,
      EspnStatus status,
      List<EspnCompetition> competitions,
      EspnLeague? league,
      EspnSport? sport,
      List<EspnLink> links});

  $EspnStatusCopyWith<$Res> get status;
  $EspnLeagueCopyWith<$Res>? get league;
  $EspnSportCopyWith<$Res>? get sport;
}

/// @nodoc
class _$EspnEventCopyWithImpl<$Res, $Val extends EspnEvent>
    implements $EspnEventCopyWith<$Res> {
  _$EspnEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? name = null,
    Object? status = null,
    Object? competitions = null,
    Object? league = freezed,
    Object? sport = freezed,
    Object? links = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EspnStatus,
      competitions: null == competitions
          ? _value.competitions
          : competitions // ignore: cast_nullable_to_non_nullable
              as List<EspnCompetition>,
      league: freezed == league
          ? _value.league
          : league // ignore: cast_nullable_to_non_nullable
              as EspnLeague?,
      sport: freezed == sport
          ? _value.sport
          : sport // ignore: cast_nullable_to_non_nullable
              as EspnSport?,
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as List<EspnLink>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EspnStatusCopyWith<$Res> get status {
    return $EspnStatusCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $EspnLeagueCopyWith<$Res>? get league {
    if (_value.league == null) {
      return null;
    }

    return $EspnLeagueCopyWith<$Res>(_value.league!, (value) {
      return _then(_value.copyWith(league: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $EspnSportCopyWith<$Res>? get sport {
    if (_value.sport == null) {
      return null;
    }

    return $EspnSportCopyWith<$Res>(_value.sport!, (value) {
      return _then(_value.copyWith(sport: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EspnEventImplCopyWith<$Res>
    implements $EspnEventCopyWith<$Res> {
  factory _$$EspnEventImplCopyWith(
          _$EspnEventImpl value, $Res Function(_$EspnEventImpl) then) =
      __$$EspnEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String date,
      String name,
      EspnStatus status,
      List<EspnCompetition> competitions,
      EspnLeague? league,
      EspnSport? sport,
      List<EspnLink> links});

  @override
  $EspnStatusCopyWith<$Res> get status;
  @override
  $EspnLeagueCopyWith<$Res>? get league;
  @override
  $EspnSportCopyWith<$Res>? get sport;
}

/// @nodoc
class __$$EspnEventImplCopyWithImpl<$Res>
    extends _$EspnEventCopyWithImpl<$Res, _$EspnEventImpl>
    implements _$$EspnEventImplCopyWith<$Res> {
  __$$EspnEventImplCopyWithImpl(
      _$EspnEventImpl _value, $Res Function(_$EspnEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? name = null,
    Object? status = null,
    Object? competitions = null,
    Object? league = freezed,
    Object? sport = freezed,
    Object? links = null,
  }) {
    return _then(_$EspnEventImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EspnStatus,
      competitions: null == competitions
          ? _value._competitions
          : competitions // ignore: cast_nullable_to_non_nullable
              as List<EspnCompetition>,
      league: freezed == league
          ? _value.league
          : league // ignore: cast_nullable_to_non_nullable
              as EspnLeague?,
      sport: freezed == sport
          ? _value.sport
          : sport // ignore: cast_nullable_to_non_nullable
              as EspnSport?,
      links: null == links
          ? _value._links
          : links // ignore: cast_nullable_to_non_nullable
              as List<EspnLink>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EspnEventImpl implements _EspnEvent {
  const _$EspnEventImpl(
      {required this.id,
      required this.date,
      required this.name,
      required this.status,
      final List<EspnCompetition> competitions = const [],
      this.league,
      this.sport,
      final List<EspnLink> links = const []})
      : _competitions = competitions,
        _links = links;

  factory _$EspnEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$EspnEventImplFromJson(json);

  @override
  final String id;
  @override
  final String date;
  @override
  final String name;
  @override
  final EspnStatus status;
  final List<EspnCompetition> _competitions;
  @override
  @JsonKey()
  List<EspnCompetition> get competitions {
    if (_competitions is EqualUnmodifiableListView) return _competitions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_competitions);
  }

  @override
  final EspnLeague? league;
  @override
  final EspnSport? sport;
  final List<EspnLink> _links;
  @override
  @JsonKey()
  List<EspnLink> get links {
    if (_links is EqualUnmodifiableListView) return _links;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_links);
  }

  @override
  String toString() {
    return 'EspnEvent(id: $id, date: $date, name: $name, status: $status, competitions: $competitions, league: $league, sport: $sport, links: $links)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EspnEventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._competitions, _competitions) &&
            (identical(other.league, league) || other.league == league) &&
            (identical(other.sport, sport) || other.sport == sport) &&
            const DeepCollectionEquality().equals(other._links, _links));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      date,
      name,
      status,
      const DeepCollectionEquality().hash(_competitions),
      league,
      sport,
      const DeepCollectionEquality().hash(_links));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EspnEventImplCopyWith<_$EspnEventImpl> get copyWith =>
      __$$EspnEventImplCopyWithImpl<_$EspnEventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EspnEventImplToJson(
      this,
    );
  }
}

abstract class _EspnEvent implements EspnEvent {
  const factory _EspnEvent(
      {required final String id,
      required final String date,
      required final String name,
      required final EspnStatus status,
      final List<EspnCompetition> competitions,
      final EspnLeague? league,
      final EspnSport? sport,
      final List<EspnLink> links}) = _$EspnEventImpl;

  factory _EspnEvent.fromJson(Map<String, dynamic> json) =
      _$EspnEventImpl.fromJson;

  @override
  String get id;
  @override
  String get date;
  @override
  String get name;
  @override
  EspnStatus get status;
  @override
  List<EspnCompetition> get competitions;
  @override
  EspnLeague? get league;
  @override
  EspnSport? get sport;
  @override
  List<EspnLink> get links;
  @override
  @JsonKey(ignore: true)
  _$$EspnEventImplCopyWith<_$EspnEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EspnCompetition _$EspnCompetitionFromJson(Map<String, dynamic> json) {
  return _EspnCompetition.fromJson(json);
}

/// @nodoc
mixin _$EspnCompetition {
  String get id => throw _privateConstructorUsedError;
  List<EspnCompetitor> get competitors => throw _privateConstructorUsedError;
  EspnVenue? get venue => throw _privateConstructorUsedError;
  EspnCompetitionType? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EspnCompetitionCopyWith<EspnCompetition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EspnCompetitionCopyWith<$Res> {
  factory $EspnCompetitionCopyWith(
          EspnCompetition value, $Res Function(EspnCompetition) then) =
      _$EspnCompetitionCopyWithImpl<$Res, EspnCompetition>;
  @useResult
  $Res call(
      {String id,
      List<EspnCompetitor> competitors,
      EspnVenue? venue,
      EspnCompetitionType? type});

  $EspnVenueCopyWith<$Res>? get venue;
  $EspnCompetitionTypeCopyWith<$Res>? get type;
}

/// @nodoc
class _$EspnCompetitionCopyWithImpl<$Res, $Val extends EspnCompetition>
    implements $EspnCompetitionCopyWith<$Res> {
  _$EspnCompetitionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? competitors = null,
    Object? venue = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      competitors: null == competitors
          ? _value.competitors
          : competitors // ignore: cast_nullable_to_non_nullable
              as List<EspnCompetitor>,
      venue: freezed == venue
          ? _value.venue
          : venue // ignore: cast_nullable_to_non_nullable
              as EspnVenue?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EspnCompetitionType?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EspnVenueCopyWith<$Res>? get venue {
    if (_value.venue == null) {
      return null;
    }

    return $EspnVenueCopyWith<$Res>(_value.venue!, (value) {
      return _then(_value.copyWith(venue: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $EspnCompetitionTypeCopyWith<$Res>? get type {
    if (_value.type == null) {
      return null;
    }

    return $EspnCompetitionTypeCopyWith<$Res>(_value.type!, (value) {
      return _then(_value.copyWith(type: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EspnCompetitionImplCopyWith<$Res>
    implements $EspnCompetitionCopyWith<$Res> {
  factory _$$EspnCompetitionImplCopyWith(_$EspnCompetitionImpl value,
          $Res Function(_$EspnCompetitionImpl) then) =
      __$$EspnCompetitionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      List<EspnCompetitor> competitors,
      EspnVenue? venue,
      EspnCompetitionType? type});

  @override
  $EspnVenueCopyWith<$Res>? get venue;
  @override
  $EspnCompetitionTypeCopyWith<$Res>? get type;
}

/// @nodoc
class __$$EspnCompetitionImplCopyWithImpl<$Res>
    extends _$EspnCompetitionCopyWithImpl<$Res, _$EspnCompetitionImpl>
    implements _$$EspnCompetitionImplCopyWith<$Res> {
  __$$EspnCompetitionImplCopyWithImpl(
      _$EspnCompetitionImpl _value, $Res Function(_$EspnCompetitionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? competitors = null,
    Object? venue = freezed,
    Object? type = freezed,
  }) {
    return _then(_$EspnCompetitionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      competitors: null == competitors
          ? _value._competitors
          : competitors // ignore: cast_nullable_to_non_nullable
              as List<EspnCompetitor>,
      venue: freezed == venue
          ? _value.venue
          : venue // ignore: cast_nullable_to_non_nullable
              as EspnVenue?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EspnCompetitionType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EspnCompetitionImpl implements _EspnCompetition {
  const _$EspnCompetitionImpl(
      {required this.id,
      final List<EspnCompetitor> competitors = const [],
      this.venue,
      this.type})
      : _competitors = competitors;

  factory _$EspnCompetitionImpl.fromJson(Map<String, dynamic> json) =>
      _$$EspnCompetitionImplFromJson(json);

  @override
  final String id;
  final List<EspnCompetitor> _competitors;
  @override
  @JsonKey()
  List<EspnCompetitor> get competitors {
    if (_competitors is EqualUnmodifiableListView) return _competitors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_competitors);
  }

  @override
  final EspnVenue? venue;
  @override
  final EspnCompetitionType? type;

  @override
  String toString() {
    return 'EspnCompetition(id: $id, competitors: $competitors, venue: $venue, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EspnCompetitionImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._competitors, _competitors) &&
            (identical(other.venue, venue) || other.venue == venue) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id,
      const DeepCollectionEquality().hash(_competitors), venue, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EspnCompetitionImplCopyWith<_$EspnCompetitionImpl> get copyWith =>
      __$$EspnCompetitionImplCopyWithImpl<_$EspnCompetitionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EspnCompetitionImplToJson(
      this,
    );
  }
}

abstract class _EspnCompetition implements EspnCompetition {
  const factory _EspnCompetition(
      {required final String id,
      final List<EspnCompetitor> competitors,
      final EspnVenue? venue,
      final EspnCompetitionType? type}) = _$EspnCompetitionImpl;

  factory _EspnCompetition.fromJson(Map<String, dynamic> json) =
      _$EspnCompetitionImpl.fromJson;

  @override
  String get id;
  @override
  List<EspnCompetitor> get competitors;
  @override
  EspnVenue? get venue;
  @override
  EspnCompetitionType? get type;
  @override
  @JsonKey(ignore: true)
  _$$EspnCompetitionImplCopyWith<_$EspnCompetitionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EspnCompetitor _$EspnCompetitorFromJson(Map<String, dynamic> json) {
  return _EspnCompetitor.fromJson(json);
}

/// @nodoc
mixin _$EspnCompetitor {
  String get id => throw _privateConstructorUsedError;
  EspnTeam get team => throw _privateConstructorUsedError;
  String? get homeAway => throw _privateConstructorUsedError;
  int? get score => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EspnCompetitorCopyWith<EspnCompetitor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EspnCompetitorCopyWith<$Res> {
  factory $EspnCompetitorCopyWith(
          EspnCompetitor value, $Res Function(EspnCompetitor) then) =
      _$EspnCompetitorCopyWithImpl<$Res, EspnCompetitor>;
  @useResult
  $Res call({String id, EspnTeam team, String? homeAway, int? score});

  $EspnTeamCopyWith<$Res> get team;
}

/// @nodoc
class _$EspnCompetitorCopyWithImpl<$Res, $Val extends EspnCompetitor>
    implements $EspnCompetitorCopyWith<$Res> {
  _$EspnCompetitorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? team = null,
    Object? homeAway = freezed,
    Object? score = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      team: null == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as EspnTeam,
      homeAway: freezed == homeAway
          ? _value.homeAway
          : homeAway // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EspnTeamCopyWith<$Res> get team {
    return $EspnTeamCopyWith<$Res>(_value.team, (value) {
      return _then(_value.copyWith(team: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EspnCompetitorImplCopyWith<$Res>
    implements $EspnCompetitorCopyWith<$Res> {
  factory _$$EspnCompetitorImplCopyWith(_$EspnCompetitorImpl value,
          $Res Function(_$EspnCompetitorImpl) then) =
      __$$EspnCompetitorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, EspnTeam team, String? homeAway, int? score});

  @override
  $EspnTeamCopyWith<$Res> get team;
}

/// @nodoc
class __$$EspnCompetitorImplCopyWithImpl<$Res>
    extends _$EspnCompetitorCopyWithImpl<$Res, _$EspnCompetitorImpl>
    implements _$$EspnCompetitorImplCopyWith<$Res> {
  __$$EspnCompetitorImplCopyWithImpl(
      _$EspnCompetitorImpl _value, $Res Function(_$EspnCompetitorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? team = null,
    Object? homeAway = freezed,
    Object? score = freezed,
  }) {
    return _then(_$EspnCompetitorImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      team: null == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as EspnTeam,
      homeAway: freezed == homeAway
          ? _value.homeAway
          : homeAway // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EspnCompetitorImpl implements _EspnCompetitor {
  const _$EspnCompetitorImpl(
      {required this.id, required this.team, this.homeAway, this.score});

  factory _$EspnCompetitorImpl.fromJson(Map<String, dynamic> json) =>
      _$$EspnCompetitorImplFromJson(json);

  @override
  final String id;
  @override
  final EspnTeam team;
  @override
  final String? homeAway;
  @override
  final int? score;

  @override
  String toString() {
    return 'EspnCompetitor(id: $id, team: $team, homeAway: $homeAway, score: $score)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EspnCompetitorImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.team, team) || other.team == team) &&
            (identical(other.homeAway, homeAway) ||
                other.homeAway == homeAway) &&
            (identical(other.score, score) || other.score == score));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, team, homeAway, score);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EspnCompetitorImplCopyWith<_$EspnCompetitorImpl> get copyWith =>
      __$$EspnCompetitorImplCopyWithImpl<_$EspnCompetitorImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EspnCompetitorImplToJson(
      this,
    );
  }
}

abstract class _EspnCompetitor implements EspnCompetitor {
  const factory _EspnCompetitor(
      {required final String id,
      required final EspnTeam team,
      final String? homeAway,
      final int? score}) = _$EspnCompetitorImpl;

  factory _EspnCompetitor.fromJson(Map<String, dynamic> json) =
      _$EspnCompetitorImpl.fromJson;

  @override
  String get id;
  @override
  EspnTeam get team;
  @override
  String? get homeAway;
  @override
  int? get score;
  @override
  @JsonKey(ignore: true)
  _$$EspnCompetitorImplCopyWith<_$EspnCompetitorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EspnStatus _$EspnStatusFromJson(Map<String, dynamic> json) {
  return _EspnStatus.fromJson(json);
}

/// @nodoc
mixin _$EspnStatus {
  EspnStatusType? get type => throw _privateConstructorUsedError;
  String? get displayClock => throw _privateConstructorUsedError;
  String? get detail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EspnStatusCopyWith<EspnStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EspnStatusCopyWith<$Res> {
  factory $EspnStatusCopyWith(
          EspnStatus value, $Res Function(EspnStatus) then) =
      _$EspnStatusCopyWithImpl<$Res, EspnStatus>;
  @useResult
  $Res call({EspnStatusType? type, String? displayClock, String? detail});

  $EspnStatusTypeCopyWith<$Res>? get type;
}

/// @nodoc
class _$EspnStatusCopyWithImpl<$Res, $Val extends EspnStatus>
    implements $EspnStatusCopyWith<$Res> {
  _$EspnStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? displayClock = freezed,
    Object? detail = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EspnStatusType?,
      displayClock: freezed == displayClock
          ? _value.displayClock
          : displayClock // ignore: cast_nullable_to_non_nullable
              as String?,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EspnStatusTypeCopyWith<$Res>? get type {
    if (_value.type == null) {
      return null;
    }

    return $EspnStatusTypeCopyWith<$Res>(_value.type!, (value) {
      return _then(_value.copyWith(type: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EspnStatusImplCopyWith<$Res>
    implements $EspnStatusCopyWith<$Res> {
  factory _$$EspnStatusImplCopyWith(
          _$EspnStatusImpl value, $Res Function(_$EspnStatusImpl) then) =
      __$$EspnStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({EspnStatusType? type, String? displayClock, String? detail});

  @override
  $EspnStatusTypeCopyWith<$Res>? get type;
}

/// @nodoc
class __$$EspnStatusImplCopyWithImpl<$Res>
    extends _$EspnStatusCopyWithImpl<$Res, _$EspnStatusImpl>
    implements _$$EspnStatusImplCopyWith<$Res> {
  __$$EspnStatusImplCopyWithImpl(
      _$EspnStatusImpl _value, $Res Function(_$EspnStatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? displayClock = freezed,
    Object? detail = freezed,
  }) {
    return _then(_$EspnStatusImpl(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EspnStatusType?,
      displayClock: freezed == displayClock
          ? _value.displayClock
          : displayClock // ignore: cast_nullable_to_non_nullable
              as String?,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EspnStatusImpl implements _EspnStatus {
  const _$EspnStatusImpl({this.type, this.displayClock, this.detail});

  factory _$EspnStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$EspnStatusImplFromJson(json);

  @override
  final EspnStatusType? type;
  @override
  final String? displayClock;
  @override
  final String? detail;

  @override
  String toString() {
    return 'EspnStatus(type: $type, displayClock: $displayClock, detail: $detail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EspnStatusImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.displayClock, displayClock) ||
                other.displayClock == displayClock) &&
            (identical(other.detail, detail) || other.detail == detail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, displayClock, detail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EspnStatusImplCopyWith<_$EspnStatusImpl> get copyWith =>
      __$$EspnStatusImplCopyWithImpl<_$EspnStatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EspnStatusImplToJson(
      this,
    );
  }
}

abstract class _EspnStatus implements EspnStatus {
  const factory _EspnStatus(
      {final EspnStatusType? type,
      final String? displayClock,
      final String? detail}) = _$EspnStatusImpl;

  factory _EspnStatus.fromJson(Map<String, dynamic> json) =
      _$EspnStatusImpl.fromJson;

  @override
  EspnStatusType? get type;
  @override
  String? get displayClock;
  @override
  String? get detail;
  @override
  @JsonKey(ignore: true)
  _$$EspnStatusImplCopyWith<_$EspnStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EspnStatusType _$EspnStatusTypeFromJson(Map<String, dynamic> json) {
  return _EspnStatusType.fromJson(json);
}

/// @nodoc
mixin _$EspnStatusType {
  String get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  bool get completed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EspnStatusTypeCopyWith<EspnStatusType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EspnStatusTypeCopyWith<$Res> {
  factory $EspnStatusTypeCopyWith(
          EspnStatusType value, $Res Function(EspnStatusType) then) =
      _$EspnStatusTypeCopyWithImpl<$Res, EspnStatusType>;
  @useResult
  $Res call({String id, String? name, bool completed});
}

/// @nodoc
class _$EspnStatusTypeCopyWithImpl<$Res, $Val extends EspnStatusType>
    implements $EspnStatusTypeCopyWith<$Res> {
  _$EspnStatusTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? completed = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EspnStatusTypeImplCopyWith<$Res>
    implements $EspnStatusTypeCopyWith<$Res> {
  factory _$$EspnStatusTypeImplCopyWith(_$EspnStatusTypeImpl value,
          $Res Function(_$EspnStatusTypeImpl) then) =
      __$$EspnStatusTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String? name, bool completed});
}

/// @nodoc
class __$$EspnStatusTypeImplCopyWithImpl<$Res>
    extends _$EspnStatusTypeCopyWithImpl<$Res, _$EspnStatusTypeImpl>
    implements _$$EspnStatusTypeImplCopyWith<$Res> {
  __$$EspnStatusTypeImplCopyWithImpl(
      _$EspnStatusTypeImpl _value, $Res Function(_$EspnStatusTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? completed = null,
  }) {
    return _then(_$EspnStatusTypeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EspnStatusTypeImpl implements _EspnStatusType {
  const _$EspnStatusTypeImpl(
      {required this.id, this.name, this.completed = false});

  factory _$EspnStatusTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$EspnStatusTypeImplFromJson(json);

  @override
  final String id;
  @override
  final String? name;
  @override
  @JsonKey()
  final bool completed;

  @override
  String toString() {
    return 'EspnStatusType(id: $id, name: $name, completed: $completed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EspnStatusTypeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.completed, completed) ||
                other.completed == completed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, completed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EspnStatusTypeImplCopyWith<_$EspnStatusTypeImpl> get copyWith =>
      __$$EspnStatusTypeImplCopyWithImpl<_$EspnStatusTypeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EspnStatusTypeImplToJson(
      this,
    );
  }
}

abstract class _EspnStatusType implements EspnStatusType {
  const factory _EspnStatusType(
      {required final String id,
      final String? name,
      final bool completed}) = _$EspnStatusTypeImpl;

  factory _EspnStatusType.fromJson(Map<String, dynamic> json) =
      _$EspnStatusTypeImpl.fromJson;

  @override
  String get id;
  @override
  String? get name;
  @override
  bool get completed;
  @override
  @JsonKey(ignore: true)
  _$$EspnStatusTypeImplCopyWith<_$EspnStatusTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EspnTeam _$EspnTeamFromJson(Map<String, dynamic> json) {
  return _EspnTeam.fromJson(json);
}

/// @nodoc
mixin _$EspnTeam {
  String get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  String? get shortDisplayName => throw _privateConstructorUsedError;
  String? get abbreviation => throw _privateConstructorUsedError;
  List<EspnLogo> get logos => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EspnTeamCopyWith<EspnTeam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EspnTeamCopyWith<$Res> {
  factory $EspnTeamCopyWith(EspnTeam value, $Res Function(EspnTeam) then) =
      _$EspnTeamCopyWithImpl<$Res, EspnTeam>;
  @useResult
  $Res call(
      {String id,
      String? name,
      String? displayName,
      String? shortDisplayName,
      String? abbreviation,
      List<EspnLogo> logos});
}

/// @nodoc
class _$EspnTeamCopyWithImpl<$Res, $Val extends EspnTeam>
    implements $EspnTeamCopyWith<$Res> {
  _$EspnTeamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? displayName = freezed,
    Object? shortDisplayName = freezed,
    Object? abbreviation = freezed,
    Object? logos = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      shortDisplayName: freezed == shortDisplayName
          ? _value.shortDisplayName
          : shortDisplayName // ignore: cast_nullable_to_non_nullable
              as String?,
      abbreviation: freezed == abbreviation
          ? _value.abbreviation
          : abbreviation // ignore: cast_nullable_to_non_nullable
              as String?,
      logos: null == logos
          ? _value.logos
          : logos // ignore: cast_nullable_to_non_nullable
              as List<EspnLogo>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EspnTeamImplCopyWith<$Res>
    implements $EspnTeamCopyWith<$Res> {
  factory _$$EspnTeamImplCopyWith(
          _$EspnTeamImpl value, $Res Function(_$EspnTeamImpl) then) =
      __$$EspnTeamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? name,
      String? displayName,
      String? shortDisplayName,
      String? abbreviation,
      List<EspnLogo> logos});
}

/// @nodoc
class __$$EspnTeamImplCopyWithImpl<$Res>
    extends _$EspnTeamCopyWithImpl<$Res, _$EspnTeamImpl>
    implements _$$EspnTeamImplCopyWith<$Res> {
  __$$EspnTeamImplCopyWithImpl(
      _$EspnTeamImpl _value, $Res Function(_$EspnTeamImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? displayName = freezed,
    Object? shortDisplayName = freezed,
    Object? abbreviation = freezed,
    Object? logos = null,
  }) {
    return _then(_$EspnTeamImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      shortDisplayName: freezed == shortDisplayName
          ? _value.shortDisplayName
          : shortDisplayName // ignore: cast_nullable_to_non_nullable
              as String?,
      abbreviation: freezed == abbreviation
          ? _value.abbreviation
          : abbreviation // ignore: cast_nullable_to_non_nullable
              as String?,
      logos: null == logos
          ? _value._logos
          : logos // ignore: cast_nullable_to_non_nullable
              as List<EspnLogo>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EspnTeamImpl implements _EspnTeam {
  const _$EspnTeamImpl(
      {required this.id,
      this.name,
      this.displayName,
      this.shortDisplayName,
      this.abbreviation,
      final List<EspnLogo> logos = const []})
      : _logos = logos;

  factory _$EspnTeamImpl.fromJson(Map<String, dynamic> json) =>
      _$$EspnTeamImplFromJson(json);

  @override
  final String id;
  @override
  final String? name;
  @override
  final String? displayName;
  @override
  final String? shortDisplayName;
  @override
  final String? abbreviation;
  final List<EspnLogo> _logos;
  @override
  @JsonKey()
  List<EspnLogo> get logos {
    if (_logos is EqualUnmodifiableListView) return _logos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_logos);
  }

  @override
  String toString() {
    return 'EspnTeam(id: $id, name: $name, displayName: $displayName, shortDisplayName: $shortDisplayName, abbreviation: $abbreviation, logos: $logos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EspnTeamImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.shortDisplayName, shortDisplayName) ||
                other.shortDisplayName == shortDisplayName) &&
            (identical(other.abbreviation, abbreviation) ||
                other.abbreviation == abbreviation) &&
            const DeepCollectionEquality().equals(other._logos, _logos));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      displayName,
      shortDisplayName,
      abbreviation,
      const DeepCollectionEquality().hash(_logos));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EspnTeamImplCopyWith<_$EspnTeamImpl> get copyWith =>
      __$$EspnTeamImplCopyWithImpl<_$EspnTeamImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EspnTeamImplToJson(
      this,
    );
  }
}

abstract class _EspnTeam implements EspnTeam {
  const factory _EspnTeam(
      {required final String id,
      final String? name,
      final String? displayName,
      final String? shortDisplayName,
      final String? abbreviation,
      final List<EspnLogo> logos}) = _$EspnTeamImpl;

  factory _EspnTeam.fromJson(Map<String, dynamic> json) =
      _$EspnTeamImpl.fromJson;

  @override
  String get id;
  @override
  String? get name;
  @override
  String? get displayName;
  @override
  String? get shortDisplayName;
  @override
  String? get abbreviation;
  @override
  List<EspnLogo> get logos;
  @override
  @JsonKey(ignore: true)
  _$$EspnTeamImplCopyWith<_$EspnTeamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EspnLogo _$EspnLogoFromJson(Map<String, dynamic> json) {
  return _EspnLogo.fromJson(json);
}

/// @nodoc
mixin _$EspnLogo {
  String? get href => throw _privateConstructorUsedError;
  String? get alt => throw _privateConstructorUsedError;
  String? get rel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EspnLogoCopyWith<EspnLogo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EspnLogoCopyWith<$Res> {
  factory $EspnLogoCopyWith(EspnLogo value, $Res Function(EspnLogo) then) =
      _$EspnLogoCopyWithImpl<$Res, EspnLogo>;
  @useResult
  $Res call({String? href, String? alt, String? rel});
}

/// @nodoc
class _$EspnLogoCopyWithImpl<$Res, $Val extends EspnLogo>
    implements $EspnLogoCopyWith<$Res> {
  _$EspnLogoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? href = freezed,
    Object? alt = freezed,
    Object? rel = freezed,
  }) {
    return _then(_value.copyWith(
      href: freezed == href
          ? _value.href
          : href // ignore: cast_nullable_to_non_nullable
              as String?,
      alt: freezed == alt
          ? _value.alt
          : alt // ignore: cast_nullable_to_non_nullable
              as String?,
      rel: freezed == rel
          ? _value.rel
          : rel // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EspnLogoImplCopyWith<$Res>
    implements $EspnLogoCopyWith<$Res> {
  factory _$$EspnLogoImplCopyWith(
          _$EspnLogoImpl value, $Res Function(_$EspnLogoImpl) then) =
      __$$EspnLogoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? href, String? alt, String? rel});
}

/// @nodoc
class __$$EspnLogoImplCopyWithImpl<$Res>
    extends _$EspnLogoCopyWithImpl<$Res, _$EspnLogoImpl>
    implements _$$EspnLogoImplCopyWith<$Res> {
  __$$EspnLogoImplCopyWithImpl(
      _$EspnLogoImpl _value, $Res Function(_$EspnLogoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? href = freezed,
    Object? alt = freezed,
    Object? rel = freezed,
  }) {
    return _then(_$EspnLogoImpl(
      href: freezed == href
          ? _value.href
          : href // ignore: cast_nullable_to_non_nullable
              as String?,
      alt: freezed == alt
          ? _value.alt
          : alt // ignore: cast_nullable_to_non_nullable
              as String?,
      rel: freezed == rel
          ? _value.rel
          : rel // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EspnLogoImpl implements _EspnLogo {
  const _$EspnLogoImpl({this.href, this.alt, this.rel});

  factory _$EspnLogoImpl.fromJson(Map<String, dynamic> json) =>
      _$$EspnLogoImplFromJson(json);

  @override
  final String? href;
  @override
  final String? alt;
  @override
  final String? rel;

  @override
  String toString() {
    return 'EspnLogo(href: $href, alt: $alt, rel: $rel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EspnLogoImpl &&
            (identical(other.href, href) || other.href == href) &&
            (identical(other.alt, alt) || other.alt == alt) &&
            (identical(other.rel, rel) || other.rel == rel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, href, alt, rel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EspnLogoImplCopyWith<_$EspnLogoImpl> get copyWith =>
      __$$EspnLogoImplCopyWithImpl<_$EspnLogoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EspnLogoImplToJson(
      this,
    );
  }
}

abstract class _EspnLogo implements EspnLogo {
  const factory _EspnLogo(
      {final String? href,
      final String? alt,
      final String? rel}) = _$EspnLogoImpl;

  factory _EspnLogo.fromJson(Map<String, dynamic> json) =
      _$EspnLogoImpl.fromJson;

  @override
  String? get href;
  @override
  String? get alt;
  @override
  String? get rel;
  @override
  @JsonKey(ignore: true)
  _$$EspnLogoImplCopyWith<_$EspnLogoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EspnLeague _$EspnLeagueFromJson(Map<String, dynamic> json) {
  return _EspnLeague.fromJson(json);
}

/// @nodoc
mixin _$EspnLeague {
  String get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get slug => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EspnLeagueCopyWith<EspnLeague> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EspnLeagueCopyWith<$Res> {
  factory $EspnLeagueCopyWith(
          EspnLeague value, $Res Function(EspnLeague) then) =
      _$EspnLeagueCopyWithImpl<$Res, EspnLeague>;
  @useResult
  $Res call({String id, String? name, String? slug});
}

/// @nodoc
class _$EspnLeagueCopyWithImpl<$Res, $Val extends EspnLeague>
    implements $EspnLeagueCopyWith<$Res> {
  _$EspnLeagueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? slug = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EspnLeagueImplCopyWith<$Res>
    implements $EspnLeagueCopyWith<$Res> {
  factory _$$EspnLeagueImplCopyWith(
          _$EspnLeagueImpl value, $Res Function(_$EspnLeagueImpl) then) =
      __$$EspnLeagueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String? name, String? slug});
}

/// @nodoc
class __$$EspnLeagueImplCopyWithImpl<$Res>
    extends _$EspnLeagueCopyWithImpl<$Res, _$EspnLeagueImpl>
    implements _$$EspnLeagueImplCopyWith<$Res> {
  __$$EspnLeagueImplCopyWithImpl(
      _$EspnLeagueImpl _value, $Res Function(_$EspnLeagueImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? slug = freezed,
  }) {
    return _then(_$EspnLeagueImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EspnLeagueImpl implements _EspnLeague {
  const _$EspnLeagueImpl({required this.id, this.name, this.slug});

  factory _$EspnLeagueImpl.fromJson(Map<String, dynamic> json) =>
      _$$EspnLeagueImplFromJson(json);

  @override
  final String id;
  @override
  final String? name;
  @override
  final String? slug;

  @override
  String toString() {
    return 'EspnLeague(id: $id, name: $name, slug: $slug)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EspnLeagueImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, slug);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EspnLeagueImplCopyWith<_$EspnLeagueImpl> get copyWith =>
      __$$EspnLeagueImplCopyWithImpl<_$EspnLeagueImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EspnLeagueImplToJson(
      this,
    );
  }
}

abstract class _EspnLeague implements EspnLeague {
  const factory _EspnLeague(
      {required final String id,
      final String? name,
      final String? slug}) = _$EspnLeagueImpl;

  factory _EspnLeague.fromJson(Map<String, dynamic> json) =
      _$EspnLeagueImpl.fromJson;

  @override
  String get id;
  @override
  String? get name;
  @override
  String? get slug;
  @override
  @JsonKey(ignore: true)
  _$$EspnLeagueImplCopyWith<_$EspnLeagueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EspnSport _$EspnSportFromJson(Map<String, dynamic> json) {
  return _EspnSport.fromJson(json);
}

/// @nodoc
mixin _$EspnSport {
  String get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get slug => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EspnSportCopyWith<EspnSport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EspnSportCopyWith<$Res> {
  factory $EspnSportCopyWith(EspnSport value, $Res Function(EspnSport) then) =
      _$EspnSportCopyWithImpl<$Res, EspnSport>;
  @useResult
  $Res call({String id, String? name, String? slug});
}

/// @nodoc
class _$EspnSportCopyWithImpl<$Res, $Val extends EspnSport>
    implements $EspnSportCopyWith<$Res> {
  _$EspnSportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? slug = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EspnSportImplCopyWith<$Res>
    implements $EspnSportCopyWith<$Res> {
  factory _$$EspnSportImplCopyWith(
          _$EspnSportImpl value, $Res Function(_$EspnSportImpl) then) =
      __$$EspnSportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String? name, String? slug});
}

/// @nodoc
class __$$EspnSportImplCopyWithImpl<$Res>
    extends _$EspnSportCopyWithImpl<$Res, _$EspnSportImpl>
    implements _$$EspnSportImplCopyWith<$Res> {
  __$$EspnSportImplCopyWithImpl(
      _$EspnSportImpl _value, $Res Function(_$EspnSportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? slug = freezed,
  }) {
    return _then(_$EspnSportImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EspnSportImpl implements _EspnSport {
  const _$EspnSportImpl({required this.id, this.name, this.slug});

  factory _$EspnSportImpl.fromJson(Map<String, dynamic> json) =>
      _$$EspnSportImplFromJson(json);

  @override
  final String id;
  @override
  final String? name;
  @override
  final String? slug;

  @override
  String toString() {
    return 'EspnSport(id: $id, name: $name, slug: $slug)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EspnSportImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, slug);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EspnSportImplCopyWith<_$EspnSportImpl> get copyWith =>
      __$$EspnSportImplCopyWithImpl<_$EspnSportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EspnSportImplToJson(
      this,
    );
  }
}

abstract class _EspnSport implements EspnSport {
  const factory _EspnSport(
      {required final String id,
      final String? name,
      final String? slug}) = _$EspnSportImpl;

  factory _EspnSport.fromJson(Map<String, dynamic> json) =
      _$EspnSportImpl.fromJson;

  @override
  String get id;
  @override
  String? get name;
  @override
  String? get slug;
  @override
  @JsonKey(ignore: true)
  _$$EspnSportImplCopyWith<_$EspnSportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EspnVenue _$EspnVenueFromJson(Map<String, dynamic> json) {
  return _EspnVenue.fromJson(json);
}

/// @nodoc
mixin _$EspnVenue {
  String get id => throw _privateConstructorUsedError;
  String? get fullName => throw _privateConstructorUsedError;
  String? get shortName => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  String? get zipCode => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EspnVenueCopyWith<EspnVenue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EspnVenueCopyWith<$Res> {
  factory $EspnVenueCopyWith(EspnVenue value, $Res Function(EspnVenue) then) =
      _$EspnVenueCopyWithImpl<$Res, EspnVenue>;
  @useResult
  $Res call(
      {String id,
      String? fullName,
      String? shortName,
      String? address,
      String? city,
      String? state,
      String? zipCode,
      String? country});
}

/// @nodoc
class _$EspnVenueCopyWithImpl<$Res, $Val extends EspnVenue>
    implements $EspnVenueCopyWith<$Res> {
  _$EspnVenueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = freezed,
    Object? shortName = freezed,
    Object? address = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? zipCode = freezed,
    Object? country = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      shortName: freezed == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      zipCode: freezed == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EspnVenueImplCopyWith<$Res>
    implements $EspnVenueCopyWith<$Res> {
  factory _$$EspnVenueImplCopyWith(
          _$EspnVenueImpl value, $Res Function(_$EspnVenueImpl) then) =
      __$$EspnVenueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? fullName,
      String? shortName,
      String? address,
      String? city,
      String? state,
      String? zipCode,
      String? country});
}

/// @nodoc
class __$$EspnVenueImplCopyWithImpl<$Res>
    extends _$EspnVenueCopyWithImpl<$Res, _$EspnVenueImpl>
    implements _$$EspnVenueImplCopyWith<$Res> {
  __$$EspnVenueImplCopyWithImpl(
      _$EspnVenueImpl _value, $Res Function(_$EspnVenueImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = freezed,
    Object? shortName = freezed,
    Object? address = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? zipCode = freezed,
    Object? country = freezed,
  }) {
    return _then(_$EspnVenueImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      shortName: freezed == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      zipCode: freezed == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EspnVenueImpl implements _EspnVenue {
  const _$EspnVenueImpl(
      {required this.id,
      this.fullName,
      this.shortName,
      this.address,
      this.city,
      this.state,
      this.zipCode,
      this.country});

  factory _$EspnVenueImpl.fromJson(Map<String, dynamic> json) =>
      _$$EspnVenueImplFromJson(json);

  @override
  final String id;
  @override
  final String? fullName;
  @override
  final String? shortName;
  @override
  final String? address;
  @override
  final String? city;
  @override
  final String? state;
  @override
  final String? zipCode;
  @override
  final String? country;

  @override
  String toString() {
    return 'EspnVenue(id: $id, fullName: $fullName, shortName: $shortName, address: $address, city: $city, state: $state, zipCode: $zipCode, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EspnVenueImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.shortName, shortName) ||
                other.shortName == shortName) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.zipCode, zipCode) || other.zipCode == zipCode) &&
            (identical(other.country, country) || other.country == country));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, fullName, shortName, address,
      city, state, zipCode, country);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EspnVenueImplCopyWith<_$EspnVenueImpl> get copyWith =>
      __$$EspnVenueImplCopyWithImpl<_$EspnVenueImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EspnVenueImplToJson(
      this,
    );
  }
}

abstract class _EspnVenue implements EspnVenue {
  const factory _EspnVenue(
      {required final String id,
      final String? fullName,
      final String? shortName,
      final String? address,
      final String? city,
      final String? state,
      final String? zipCode,
      final String? country}) = _$EspnVenueImpl;

  factory _EspnVenue.fromJson(Map<String, dynamic> json) =
      _$EspnVenueImpl.fromJson;

  @override
  String get id;
  @override
  String? get fullName;
  @override
  String? get shortName;
  @override
  String? get address;
  @override
  String? get city;
  @override
  String? get state;
  @override
  String? get zipCode;
  @override
  String? get country;
  @override
  @JsonKey(ignore: true)
  _$$EspnVenueImplCopyWith<_$EspnVenueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EspnCompetitionType _$EspnCompetitionTypeFromJson(Map<String, dynamic> json) {
  return _EspnCompetitionType.fromJson(json);
}

/// @nodoc
mixin _$EspnCompetitionType {
  String get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get abbreviation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EspnCompetitionTypeCopyWith<EspnCompetitionType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EspnCompetitionTypeCopyWith<$Res> {
  factory $EspnCompetitionTypeCopyWith(
          EspnCompetitionType value, $Res Function(EspnCompetitionType) then) =
      _$EspnCompetitionTypeCopyWithImpl<$Res, EspnCompetitionType>;
  @useResult
  $Res call({String id, String? name, String? abbreviation});
}

/// @nodoc
class _$EspnCompetitionTypeCopyWithImpl<$Res, $Val extends EspnCompetitionType>
    implements $EspnCompetitionTypeCopyWith<$Res> {
  _$EspnCompetitionTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? abbreviation = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      abbreviation: freezed == abbreviation
          ? _value.abbreviation
          : abbreviation // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EspnCompetitionTypeImplCopyWith<$Res>
    implements $EspnCompetitionTypeCopyWith<$Res> {
  factory _$$EspnCompetitionTypeImplCopyWith(_$EspnCompetitionTypeImpl value,
          $Res Function(_$EspnCompetitionTypeImpl) then) =
      __$$EspnCompetitionTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String? name, String? abbreviation});
}

/// @nodoc
class __$$EspnCompetitionTypeImplCopyWithImpl<$Res>
    extends _$EspnCompetitionTypeCopyWithImpl<$Res, _$EspnCompetitionTypeImpl>
    implements _$$EspnCompetitionTypeImplCopyWith<$Res> {
  __$$EspnCompetitionTypeImplCopyWithImpl(_$EspnCompetitionTypeImpl _value,
      $Res Function(_$EspnCompetitionTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? abbreviation = freezed,
  }) {
    return _then(_$EspnCompetitionTypeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      abbreviation: freezed == abbreviation
          ? _value.abbreviation
          : abbreviation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EspnCompetitionTypeImpl implements _EspnCompetitionType {
  const _$EspnCompetitionTypeImpl(
      {required this.id, this.name, this.abbreviation});

  factory _$EspnCompetitionTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$EspnCompetitionTypeImplFromJson(json);

  @override
  final String id;
  @override
  final String? name;
  @override
  final String? abbreviation;

  @override
  String toString() {
    return 'EspnCompetitionType(id: $id, name: $name, abbreviation: $abbreviation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EspnCompetitionTypeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.abbreviation, abbreviation) ||
                other.abbreviation == abbreviation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, abbreviation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EspnCompetitionTypeImplCopyWith<_$EspnCompetitionTypeImpl> get copyWith =>
      __$$EspnCompetitionTypeImplCopyWithImpl<_$EspnCompetitionTypeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EspnCompetitionTypeImplToJson(
      this,
    );
  }
}

abstract class _EspnCompetitionType implements EspnCompetitionType {
  const factory _EspnCompetitionType(
      {required final String id,
      final String? name,
      final String? abbreviation}) = _$EspnCompetitionTypeImpl;

  factory _EspnCompetitionType.fromJson(Map<String, dynamic> json) =
      _$EspnCompetitionTypeImpl.fromJson;

  @override
  String get id;
  @override
  String? get name;
  @override
  String? get abbreviation;
  @override
  @JsonKey(ignore: true)
  _$$EspnCompetitionTypeImplCopyWith<_$EspnCompetitionTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EspnLink _$EspnLinkFromJson(Map<String, dynamic> json) {
  return _EspnLink.fromJson(json);
}

/// @nodoc
mixin _$EspnLink {
  String? get href => throw _privateConstructorUsedError;
  String? get rel => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EspnLinkCopyWith<EspnLink> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EspnLinkCopyWith<$Res> {
  factory $EspnLinkCopyWith(EspnLink value, $Res Function(EspnLink) then) =
      _$EspnLinkCopyWithImpl<$Res, EspnLink>;
  @useResult
  $Res call({String? href, String? rel, String? text});
}

/// @nodoc
class _$EspnLinkCopyWithImpl<$Res, $Val extends EspnLink>
    implements $EspnLinkCopyWith<$Res> {
  _$EspnLinkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? href = freezed,
    Object? rel = freezed,
    Object? text = freezed,
  }) {
    return _then(_value.copyWith(
      href: freezed == href
          ? _value.href
          : href // ignore: cast_nullable_to_non_nullable
              as String?,
      rel: freezed == rel
          ? _value.rel
          : rel // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EspnLinkImplCopyWith<$Res>
    implements $EspnLinkCopyWith<$Res> {
  factory _$$EspnLinkImplCopyWith(
          _$EspnLinkImpl value, $Res Function(_$EspnLinkImpl) then) =
      __$$EspnLinkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? href, String? rel, String? text});
}

/// @nodoc
class __$$EspnLinkImplCopyWithImpl<$Res>
    extends _$EspnLinkCopyWithImpl<$Res, _$EspnLinkImpl>
    implements _$$EspnLinkImplCopyWith<$Res> {
  __$$EspnLinkImplCopyWithImpl(
      _$EspnLinkImpl _value, $Res Function(_$EspnLinkImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? href = freezed,
    Object? rel = freezed,
    Object? text = freezed,
  }) {
    return _then(_$EspnLinkImpl(
      href: freezed == href
          ? _value.href
          : href // ignore: cast_nullable_to_non_nullable
              as String?,
      rel: freezed == rel
          ? _value.rel
          : rel // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EspnLinkImpl implements _EspnLink {
  const _$EspnLinkImpl({this.href, this.rel, this.text});

  factory _$EspnLinkImpl.fromJson(Map<String, dynamic> json) =>
      _$$EspnLinkImplFromJson(json);

  @override
  final String? href;
  @override
  final String? rel;
  @override
  final String? text;

  @override
  String toString() {
    return 'EspnLink(href: $href, rel: $rel, text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EspnLinkImpl &&
            (identical(other.href, href) || other.href == href) &&
            (identical(other.rel, rel) || other.rel == rel) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, href, rel, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EspnLinkImplCopyWith<_$EspnLinkImpl> get copyWith =>
      __$$EspnLinkImplCopyWithImpl<_$EspnLinkImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EspnLinkImplToJson(
      this,
    );
  }
}

abstract class _EspnLink implements EspnLink {
  const factory _EspnLink(
      {final String? href,
      final String? rel,
      final String? text}) = _$EspnLinkImpl;

  factory _EspnLink.fromJson(Map<String, dynamic> json) =
      _$EspnLinkImpl.fromJson;

  @override
  String? get href;
  @override
  String? get rel;
  @override
  String? get text;
  @override
  @JsonKey(ignore: true)
  _$$EspnLinkImplCopyWith<_$EspnLinkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EspnSummaryResponse _$EspnSummaryResponseFromJson(Map<String, dynamic> json) {
  return _EspnSummaryResponse.fromJson(json);
}

/// @nodoc
mixin _$EspnSummaryResponse {
  EspnArticle? get article => throw _privateConstructorUsedError;
  List<EspnCommentaryItem> get commentary => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EspnSummaryResponseCopyWith<EspnSummaryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EspnSummaryResponseCopyWith<$Res> {
  factory $EspnSummaryResponseCopyWith(
          EspnSummaryResponse value, $Res Function(EspnSummaryResponse) then) =
      _$EspnSummaryResponseCopyWithImpl<$Res, EspnSummaryResponse>;
  @useResult
  $Res call({EspnArticle? article, List<EspnCommentaryItem> commentary});

  $EspnArticleCopyWith<$Res>? get article;
}

/// @nodoc
class _$EspnSummaryResponseCopyWithImpl<$Res, $Val extends EspnSummaryResponse>
    implements $EspnSummaryResponseCopyWith<$Res> {
  _$EspnSummaryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? article = freezed,
    Object? commentary = null,
  }) {
    return _then(_value.copyWith(
      article: freezed == article
          ? _value.article
          : article // ignore: cast_nullable_to_non_nullable
              as EspnArticle?,
      commentary: null == commentary
          ? _value.commentary
          : commentary // ignore: cast_nullable_to_non_nullable
              as List<EspnCommentaryItem>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EspnArticleCopyWith<$Res>? get article {
    if (_value.article == null) {
      return null;
    }

    return $EspnArticleCopyWith<$Res>(_value.article!, (value) {
      return _then(_value.copyWith(article: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EspnSummaryResponseImplCopyWith<$Res>
    implements $EspnSummaryResponseCopyWith<$Res> {
  factory _$$EspnSummaryResponseImplCopyWith(_$EspnSummaryResponseImpl value,
          $Res Function(_$EspnSummaryResponseImpl) then) =
      __$$EspnSummaryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({EspnArticle? article, List<EspnCommentaryItem> commentary});

  @override
  $EspnArticleCopyWith<$Res>? get article;
}

/// @nodoc
class __$$EspnSummaryResponseImplCopyWithImpl<$Res>
    extends _$EspnSummaryResponseCopyWithImpl<$Res, _$EspnSummaryResponseImpl>
    implements _$$EspnSummaryResponseImplCopyWith<$Res> {
  __$$EspnSummaryResponseImplCopyWithImpl(_$EspnSummaryResponseImpl _value,
      $Res Function(_$EspnSummaryResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? article = freezed,
    Object? commentary = null,
  }) {
    return _then(_$EspnSummaryResponseImpl(
      article: freezed == article
          ? _value.article
          : article // ignore: cast_nullable_to_non_nullable
              as EspnArticle?,
      commentary: null == commentary
          ? _value._commentary
          : commentary // ignore: cast_nullable_to_non_nullable
              as List<EspnCommentaryItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EspnSummaryResponseImpl implements _EspnSummaryResponse {
  const _$EspnSummaryResponseImpl(
      {this.article, final List<EspnCommentaryItem> commentary = const []})
      : _commentary = commentary;

  factory _$EspnSummaryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$EspnSummaryResponseImplFromJson(json);

  @override
  final EspnArticle? article;
  final List<EspnCommentaryItem> _commentary;
  @override
  @JsonKey()
  List<EspnCommentaryItem> get commentary {
    if (_commentary is EqualUnmodifiableListView) return _commentary;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_commentary);
  }

  @override
  String toString() {
    return 'EspnSummaryResponse(article: $article, commentary: $commentary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EspnSummaryResponseImpl &&
            (identical(other.article, article) || other.article == article) &&
            const DeepCollectionEquality()
                .equals(other._commentary, _commentary));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, article, const DeepCollectionEquality().hash(_commentary));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EspnSummaryResponseImplCopyWith<_$EspnSummaryResponseImpl> get copyWith =>
      __$$EspnSummaryResponseImplCopyWithImpl<_$EspnSummaryResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EspnSummaryResponseImplToJson(
      this,
    );
  }
}

abstract class _EspnSummaryResponse implements EspnSummaryResponse {
  const factory _EspnSummaryResponse(
      {final EspnArticle? article,
      final List<EspnCommentaryItem> commentary}) = _$EspnSummaryResponseImpl;

  factory _EspnSummaryResponse.fromJson(Map<String, dynamic> json) =
      _$EspnSummaryResponseImpl.fromJson;

  @override
  EspnArticle? get article;
  @override
  List<EspnCommentaryItem> get commentary;
  @override
  @JsonKey(ignore: true)
  _$$EspnSummaryResponseImplCopyWith<_$EspnSummaryResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EspnArticle _$EspnArticleFromJson(Map<String, dynamic> json) {
  return _EspnArticle.fromJson(json);
}

/// @nodoc
mixin _$EspnArticle {
  List<EspnCommentaryItem> get commentary => throw _privateConstructorUsedError;
  List<EspnCommentaryItem> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EspnArticleCopyWith<EspnArticle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EspnArticleCopyWith<$Res> {
  factory $EspnArticleCopyWith(
          EspnArticle value, $Res Function(EspnArticle) then) =
      _$EspnArticleCopyWithImpl<$Res, EspnArticle>;
  @useResult
  $Res call(
      {List<EspnCommentaryItem> commentary, List<EspnCommentaryItem> items});
}

/// @nodoc
class _$EspnArticleCopyWithImpl<$Res, $Val extends EspnArticle>
    implements $EspnArticleCopyWith<$Res> {
  _$EspnArticleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commentary = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      commentary: null == commentary
          ? _value.commentary
          : commentary // ignore: cast_nullable_to_non_nullable
              as List<EspnCommentaryItem>,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<EspnCommentaryItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EspnArticleImplCopyWith<$Res>
    implements $EspnArticleCopyWith<$Res> {
  factory _$$EspnArticleImplCopyWith(
          _$EspnArticleImpl value, $Res Function(_$EspnArticleImpl) then) =
      __$$EspnArticleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<EspnCommentaryItem> commentary, List<EspnCommentaryItem> items});
}

/// @nodoc
class __$$EspnArticleImplCopyWithImpl<$Res>
    extends _$EspnArticleCopyWithImpl<$Res, _$EspnArticleImpl>
    implements _$$EspnArticleImplCopyWith<$Res> {
  __$$EspnArticleImplCopyWithImpl(
      _$EspnArticleImpl _value, $Res Function(_$EspnArticleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commentary = null,
    Object? items = null,
  }) {
    return _then(_$EspnArticleImpl(
      commentary: null == commentary
          ? _value._commentary
          : commentary // ignore: cast_nullable_to_non_nullable
              as List<EspnCommentaryItem>,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<EspnCommentaryItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EspnArticleImpl implements _EspnArticle {
  const _$EspnArticleImpl(
      {final List<EspnCommentaryItem> commentary = const [],
      final List<EspnCommentaryItem> items = const []})
      : _commentary = commentary,
        _items = items;

  factory _$EspnArticleImpl.fromJson(Map<String, dynamic> json) =>
      _$$EspnArticleImplFromJson(json);

  final List<EspnCommentaryItem> _commentary;
  @override
  @JsonKey()
  List<EspnCommentaryItem> get commentary {
    if (_commentary is EqualUnmodifiableListView) return _commentary;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_commentary);
  }

  final List<EspnCommentaryItem> _items;
  @override
  @JsonKey()
  List<EspnCommentaryItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'EspnArticle(commentary: $commentary, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EspnArticleImpl &&
            const DeepCollectionEquality()
                .equals(other._commentary, _commentary) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_commentary),
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EspnArticleImplCopyWith<_$EspnArticleImpl> get copyWith =>
      __$$EspnArticleImplCopyWithImpl<_$EspnArticleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EspnArticleImplToJson(
      this,
    );
  }
}

abstract class _EspnArticle implements EspnArticle {
  const factory _EspnArticle(
      {final List<EspnCommentaryItem> commentary,
      final List<EspnCommentaryItem> items}) = _$EspnArticleImpl;

  factory _EspnArticle.fromJson(Map<String, dynamic> json) =
      _$EspnArticleImpl.fromJson;

  @override
  List<EspnCommentaryItem> get commentary;
  @override
  List<EspnCommentaryItem> get items;
  @override
  @JsonKey(ignore: true)
  _$$EspnArticleImplCopyWith<_$EspnArticleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EspnCommentaryItem _$EspnCommentaryItemFromJson(Map<String, dynamic> json) {
  return _EspnCommentaryItem.fromJson(json);
}

/// @nodoc
mixin _$EspnCommentaryItem {
  String? get id => throw _privateConstructorUsedError;
  String? get playId => throw _privateConstructorUsedError;
  int? get sequence => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  String? get shortText => throw _privateConstructorUsedError;
  String? get headline => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int? get minute => throw _privateConstructorUsedError;
  EspnTime? get time => throw _privateConstructorUsedError;
  bool get scoringPlay => throw _privateConstructorUsedError;
  String? get scoreValue => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get typeText => throw _privateConstructorUsedError;
  String? get timestamp => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  String? get created => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EspnCommentaryItemCopyWith<EspnCommentaryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EspnCommentaryItemCopyWith<$Res> {
  factory $EspnCommentaryItemCopyWith(
          EspnCommentaryItem value, $Res Function(EspnCommentaryItem) then) =
      _$EspnCommentaryItemCopyWithImpl<$Res, EspnCommentaryItem>;
  @useResult
  $Res call(
      {String? id,
      String? playId,
      int? sequence,
      String? text,
      String? shortText,
      String? headline,
      String? description,
      int? minute,
      EspnTime? time,
      bool scoringPlay,
      String? scoreValue,
      String? type,
      String? typeText,
      String? timestamp,
      String? date,
      String? created});

  $EspnTimeCopyWith<$Res>? get time;
}

/// @nodoc
class _$EspnCommentaryItemCopyWithImpl<$Res, $Val extends EspnCommentaryItem>
    implements $EspnCommentaryItemCopyWith<$Res> {
  _$EspnCommentaryItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? playId = freezed,
    Object? sequence = freezed,
    Object? text = freezed,
    Object? shortText = freezed,
    Object? headline = freezed,
    Object? description = freezed,
    Object? minute = freezed,
    Object? time = freezed,
    Object? scoringPlay = null,
    Object? scoreValue = freezed,
    Object? type = freezed,
    Object? typeText = freezed,
    Object? timestamp = freezed,
    Object? date = freezed,
    Object? created = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      playId: freezed == playId
          ? _value.playId
          : playId // ignore: cast_nullable_to_non_nullable
              as String?,
      sequence: freezed == sequence
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      shortText: freezed == shortText
          ? _value.shortText
          : shortText // ignore: cast_nullable_to_non_nullable
              as String?,
      headline: freezed == headline
          ? _value.headline
          : headline // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      minute: freezed == minute
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as EspnTime?,
      scoringPlay: null == scoringPlay
          ? _value.scoringPlay
          : scoringPlay // ignore: cast_nullable_to_non_nullable
              as bool,
      scoreValue: freezed == scoreValue
          ? _value.scoreValue
          : scoreValue // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      typeText: freezed == typeText
          ? _value.typeText
          : typeText // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EspnTimeCopyWith<$Res>? get time {
    if (_value.time == null) {
      return null;
    }

    return $EspnTimeCopyWith<$Res>(_value.time!, (value) {
      return _then(_value.copyWith(time: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EspnCommentaryItemImplCopyWith<$Res>
    implements $EspnCommentaryItemCopyWith<$Res> {
  factory _$$EspnCommentaryItemImplCopyWith(_$EspnCommentaryItemImpl value,
          $Res Function(_$EspnCommentaryItemImpl) then) =
      __$$EspnCommentaryItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? playId,
      int? sequence,
      String? text,
      String? shortText,
      String? headline,
      String? description,
      int? minute,
      EspnTime? time,
      bool scoringPlay,
      String? scoreValue,
      String? type,
      String? typeText,
      String? timestamp,
      String? date,
      String? created});

  @override
  $EspnTimeCopyWith<$Res>? get time;
}

/// @nodoc
class __$$EspnCommentaryItemImplCopyWithImpl<$Res>
    extends _$EspnCommentaryItemCopyWithImpl<$Res, _$EspnCommentaryItemImpl>
    implements _$$EspnCommentaryItemImplCopyWith<$Res> {
  __$$EspnCommentaryItemImplCopyWithImpl(_$EspnCommentaryItemImpl _value,
      $Res Function(_$EspnCommentaryItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? playId = freezed,
    Object? sequence = freezed,
    Object? text = freezed,
    Object? shortText = freezed,
    Object? headline = freezed,
    Object? description = freezed,
    Object? minute = freezed,
    Object? time = freezed,
    Object? scoringPlay = null,
    Object? scoreValue = freezed,
    Object? type = freezed,
    Object? typeText = freezed,
    Object? timestamp = freezed,
    Object? date = freezed,
    Object? created = freezed,
  }) {
    return _then(_$EspnCommentaryItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      playId: freezed == playId
          ? _value.playId
          : playId // ignore: cast_nullable_to_non_nullable
              as String?,
      sequence: freezed == sequence
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      shortText: freezed == shortText
          ? _value.shortText
          : shortText // ignore: cast_nullable_to_non_nullable
              as String?,
      headline: freezed == headline
          ? _value.headline
          : headline // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      minute: freezed == minute
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as EspnTime?,
      scoringPlay: null == scoringPlay
          ? _value.scoringPlay
          : scoringPlay // ignore: cast_nullable_to_non_nullable
              as bool,
      scoreValue: freezed == scoreValue
          ? _value.scoreValue
          : scoreValue // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      typeText: freezed == typeText
          ? _value.typeText
          : typeText // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EspnCommentaryItemImpl implements _EspnCommentaryItem {
  const _$EspnCommentaryItemImpl(
      {this.id,
      this.playId,
      this.sequence,
      this.text,
      this.shortText,
      this.headline,
      this.description,
      this.minute,
      this.time,
      this.scoringPlay = false,
      this.scoreValue,
      this.type,
      this.typeText,
      this.timestamp,
      this.date,
      this.created});

  factory _$EspnCommentaryItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$EspnCommentaryItemImplFromJson(json);

  @override
  final String? id;
  @override
  final String? playId;
  @override
  final int? sequence;
  @override
  final String? text;
  @override
  final String? shortText;
  @override
  final String? headline;
  @override
  final String? description;
  @override
  final int? minute;
  @override
  final EspnTime? time;
  @override
  @JsonKey()
  final bool scoringPlay;
  @override
  final String? scoreValue;
  @override
  final String? type;
  @override
  final String? typeText;
  @override
  final String? timestamp;
  @override
  final String? date;
  @override
  final String? created;

  @override
  String toString() {
    return 'EspnCommentaryItem(id: $id, playId: $playId, sequence: $sequence, text: $text, shortText: $shortText, headline: $headline, description: $description, minute: $minute, time: $time, scoringPlay: $scoringPlay, scoreValue: $scoreValue, type: $type, typeText: $typeText, timestamp: $timestamp, date: $date, created: $created)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EspnCommentaryItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.playId, playId) || other.playId == playId) &&
            (identical(other.sequence, sequence) ||
                other.sequence == sequence) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.shortText, shortText) ||
                other.shortText == shortText) &&
            (identical(other.headline, headline) ||
                other.headline == headline) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.minute, minute) || other.minute == minute) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.scoringPlay, scoringPlay) ||
                other.scoringPlay == scoringPlay) &&
            (identical(other.scoreValue, scoreValue) ||
                other.scoreValue == scoreValue) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.typeText, typeText) ||
                other.typeText == typeText) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.created, created) || other.created == created));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      playId,
      sequence,
      text,
      shortText,
      headline,
      description,
      minute,
      time,
      scoringPlay,
      scoreValue,
      type,
      typeText,
      timestamp,
      date,
      created);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EspnCommentaryItemImplCopyWith<_$EspnCommentaryItemImpl> get copyWith =>
      __$$EspnCommentaryItemImplCopyWithImpl<_$EspnCommentaryItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EspnCommentaryItemImplToJson(
      this,
    );
  }
}

abstract class _EspnCommentaryItem implements EspnCommentaryItem {
  const factory _EspnCommentaryItem(
      {final String? id,
      final String? playId,
      final int? sequence,
      final String? text,
      final String? shortText,
      final String? headline,
      final String? description,
      final int? minute,
      final EspnTime? time,
      final bool scoringPlay,
      final String? scoreValue,
      final String? type,
      final String? typeText,
      final String? timestamp,
      final String? date,
      final String? created}) = _$EspnCommentaryItemImpl;

  factory _EspnCommentaryItem.fromJson(Map<String, dynamic> json) =
      _$EspnCommentaryItemImpl.fromJson;

  @override
  String? get id;
  @override
  String? get playId;
  @override
  int? get sequence;
  @override
  String? get text;
  @override
  String? get shortText;
  @override
  String? get headline;
  @override
  String? get description;
  @override
  int? get minute;
  @override
  EspnTime? get time;
  @override
  bool get scoringPlay;
  @override
  String? get scoreValue;
  @override
  String? get type;
  @override
  String? get typeText;
  @override
  String? get timestamp;
  @override
  String? get date;
  @override
  String? get created;
  @override
  @JsonKey(ignore: true)
  _$$EspnCommentaryItemImplCopyWith<_$EspnCommentaryItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EspnTime _$EspnTimeFromJson(Map<String, dynamic> json) {
  return _EspnTime.fromJson(json);
}

/// @nodoc
mixin _$EspnTime {
  String? get displayValue => throw _privateConstructorUsedError;
  String? get value => throw _privateConstructorUsedError;
  String? get clock => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EspnTimeCopyWith<EspnTime> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EspnTimeCopyWith<$Res> {
  factory $EspnTimeCopyWith(EspnTime value, $Res Function(EspnTime) then) =
      _$EspnTimeCopyWithImpl<$Res, EspnTime>;
  @useResult
  $Res call({String? displayValue, String? value, String? clock, String? date});
}

/// @nodoc
class _$EspnTimeCopyWithImpl<$Res, $Val extends EspnTime>
    implements $EspnTimeCopyWith<$Res> {
  _$EspnTimeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayValue = freezed,
    Object? value = freezed,
    Object? clock = freezed,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      displayValue: freezed == displayValue
          ? _value.displayValue
          : displayValue // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      clock: freezed == clock
          ? _value.clock
          : clock // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EspnTimeImplCopyWith<$Res>
    implements $EspnTimeCopyWith<$Res> {
  factory _$$EspnTimeImplCopyWith(
          _$EspnTimeImpl value, $Res Function(_$EspnTimeImpl) then) =
      __$$EspnTimeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? displayValue, String? value, String? clock, String? date});
}

/// @nodoc
class __$$EspnTimeImplCopyWithImpl<$Res>
    extends _$EspnTimeCopyWithImpl<$Res, _$EspnTimeImpl>
    implements _$$EspnTimeImplCopyWith<$Res> {
  __$$EspnTimeImplCopyWithImpl(
      _$EspnTimeImpl _value, $Res Function(_$EspnTimeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayValue = freezed,
    Object? value = freezed,
    Object? clock = freezed,
    Object? date = freezed,
  }) {
    return _then(_$EspnTimeImpl(
      displayValue: freezed == displayValue
          ? _value.displayValue
          : displayValue // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      clock: freezed == clock
          ? _value.clock
          : clock // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EspnTimeImpl implements _EspnTime {
  const _$EspnTimeImpl({this.displayValue, this.value, this.clock, this.date});

  factory _$EspnTimeImpl.fromJson(Map<String, dynamic> json) =>
      _$$EspnTimeImplFromJson(json);

  @override
  final String? displayValue;
  @override
  final String? value;
  @override
  final String? clock;
  @override
  final String? date;

  @override
  String toString() {
    return 'EspnTime(displayValue: $displayValue, value: $value, clock: $clock, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EspnTimeImpl &&
            (identical(other.displayValue, displayValue) ||
                other.displayValue == displayValue) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.clock, clock) || other.clock == clock) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, displayValue, value, clock, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EspnTimeImplCopyWith<_$EspnTimeImpl> get copyWith =>
      __$$EspnTimeImplCopyWithImpl<_$EspnTimeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EspnTimeImplToJson(
      this,
    );
  }
}

abstract class _EspnTime implements EspnTime {
  const factory _EspnTime(
      {final String? displayValue,
      final String? value,
      final String? clock,
      final String? date}) = _$EspnTimeImpl;

  factory _EspnTime.fromJson(Map<String, dynamic> json) =
      _$EspnTimeImpl.fromJson;

  @override
  String? get displayValue;
  @override
  String? get value;
  @override
  String? get clock;
  @override
  String? get date;
  @override
  @JsonKey(ignore: true)
  _$$EspnTimeImplCopyWith<_$EspnTimeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
