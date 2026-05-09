// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'espn_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EspnScoreboardResponseImpl _$$EspnScoreboardResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$EspnScoreboardResponseImpl(
      events: (json['events'] as List<dynamic>?)
              ?.map((e) => EspnEvent.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$EspnScoreboardResponseImplToJson(
        _$EspnScoreboardResponseImpl instance) =>
    <String, dynamic>{
      'events': instance.events,
    };

_$EspnEventImpl _$$EspnEventImplFromJson(Map<String, dynamic> json) =>
    _$EspnEventImpl(
      id: json['id'] as String,
      date: json['date'] as String,
      name: json['name'] as String,
      status: EspnStatus.fromJson(json['status'] as Map<String, dynamic>),
      competitions: (json['competitions'] as List<dynamic>?)
              ?.map((e) => EspnCompetition.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      league: json['league'] == null
          ? null
          : EspnLeague.fromJson(json['league'] as Map<String, dynamic>),
      sport: json['sport'] == null
          ? null
          : EspnSport.fromJson(json['sport'] as Map<String, dynamic>),
      links: (json['links'] as List<dynamic>?)
              ?.map((e) => EspnLink.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$EspnEventImplToJson(_$EspnEventImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'name': instance.name,
      'status': instance.status,
      'competitions': instance.competitions,
      'league': instance.league,
      'sport': instance.sport,
      'links': instance.links,
    };

_$EspnCompetitionImpl _$$EspnCompetitionImplFromJson(
        Map<String, dynamic> json) =>
    _$EspnCompetitionImpl(
      id: json['id'] as String,
      competitors: (json['competitors'] as List<dynamic>?)
              ?.map((e) => EspnCompetitor.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      venue: json['venue'] == null
          ? null
          : EspnVenue.fromJson(json['venue'] as Map<String, dynamic>),
      type: json['type'] == null
          ? null
          : EspnCompetitionType.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$EspnCompetitionImplToJson(
        _$EspnCompetitionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'competitors': instance.competitors,
      'venue': instance.venue,
      'type': instance.type,
    };

_$EspnCompetitorImpl _$$EspnCompetitorImplFromJson(Map<String, dynamic> json) =>
    _$EspnCompetitorImpl(
      id: json['id'] as String,
      team: EspnTeam.fromJson(json['team'] as Map<String, dynamic>),
      homeAway: json['homeAway'] as String?,
      score: (json['score'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$EspnCompetitorImplToJson(
        _$EspnCompetitorImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'team': instance.team,
      'homeAway': instance.homeAway,
      'score': instance.score,
    };

_$EspnStatusImpl _$$EspnStatusImplFromJson(Map<String, dynamic> json) =>
    _$EspnStatusImpl(
      type: json['type'] == null
          ? null
          : EspnStatusType.fromJson(json['type'] as Map<String, dynamic>),
      displayClock: json['displayClock'] as String?,
      detail: json['detail'] as String?,
    );

Map<String, dynamic> _$$EspnStatusImplToJson(_$EspnStatusImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'displayClock': instance.displayClock,
      'detail': instance.detail,
    };

_$EspnStatusTypeImpl _$$EspnStatusTypeImplFromJson(Map<String, dynamic> json) =>
    _$EspnStatusTypeImpl(
      id: json['id'] as String,
      name: json['name'] as String?,
      completed: json['completed'] as bool? ?? false,
    );

Map<String, dynamic> _$$EspnStatusTypeImplToJson(
        _$EspnStatusTypeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'completed': instance.completed,
    };

_$EspnTeamImpl _$$EspnTeamImplFromJson(Map<String, dynamic> json) =>
    _$EspnTeamImpl(
      id: json['id'] as String,
      name: json['name'] as String?,
      displayName: json['displayName'] as String?,
      shortDisplayName: json['shortDisplayName'] as String?,
      abbreviation: json['abbreviation'] as String?,
      logos: (json['logos'] as List<dynamic>?)
              ?.map((e) => EspnLogo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$EspnTeamImplToJson(_$EspnTeamImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'displayName': instance.displayName,
      'shortDisplayName': instance.shortDisplayName,
      'abbreviation': instance.abbreviation,
      'logos': instance.logos,
    };

_$EspnLogoImpl _$$EspnLogoImplFromJson(Map<String, dynamic> json) =>
    _$EspnLogoImpl(
      href: json['href'] as String?,
      alt: json['alt'] as String?,
      rel: json['rel'] as String?,
    );

Map<String, dynamic> _$$EspnLogoImplToJson(_$EspnLogoImpl instance) =>
    <String, dynamic>{
      'href': instance.href,
      'alt': instance.alt,
      'rel': instance.rel,
    };

_$EspnLeagueImpl _$$EspnLeagueImplFromJson(Map<String, dynamic> json) =>
    _$EspnLeagueImpl(
      id: json['id'] as String,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
    );

Map<String, dynamic> _$$EspnLeagueImplToJson(_$EspnLeagueImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
    };

_$EspnSportImpl _$$EspnSportImplFromJson(Map<String, dynamic> json) =>
    _$EspnSportImpl(
      id: json['id'] as String,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
    );

Map<String, dynamic> _$$EspnSportImplToJson(_$EspnSportImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
    };

_$EspnVenueImpl _$$EspnVenueImplFromJson(Map<String, dynamic> json) =>
    _$EspnVenueImpl(
      id: json['id'] as String,
      fullName: json['fullName'] as String?,
      shortName: json['shortName'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      zipCode: json['zipCode'] as String?,
      country: json['country'] as String?,
    );

Map<String, dynamic> _$$EspnVenueImplToJson(_$EspnVenueImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'shortName': instance.shortName,
      'address': instance.address,
      'city': instance.city,
      'state': instance.state,
      'zipCode': instance.zipCode,
      'country': instance.country,
    };

_$EspnCompetitionTypeImpl _$$EspnCompetitionTypeImplFromJson(
        Map<String, dynamic> json) =>
    _$EspnCompetitionTypeImpl(
      id: json['id'] as String,
      name: json['name'] as String?,
      abbreviation: json['abbreviation'] as String?,
    );

Map<String, dynamic> _$$EspnCompetitionTypeImplToJson(
        _$EspnCompetitionTypeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'abbreviation': instance.abbreviation,
    };

_$EspnLinkImpl _$$EspnLinkImplFromJson(Map<String, dynamic> json) =>
    _$EspnLinkImpl(
      href: json['href'] as String?,
      rel: json['rel'] as String?,
      text: json['text'] as String?,
    );

Map<String, dynamic> _$$EspnLinkImplToJson(_$EspnLinkImpl instance) =>
    <String, dynamic>{
      'href': instance.href,
      'rel': instance.rel,
      'text': instance.text,
    };

_$EspnSummaryResponseImpl _$$EspnSummaryResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$EspnSummaryResponseImpl(
      article: json['article'] == null
          ? null
          : EspnArticle.fromJson(json['article'] as Map<String, dynamic>),
      commentary: (json['commentary'] as List<dynamic>?)
              ?.map(
                  (e) => EspnCommentaryItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$EspnSummaryResponseImplToJson(
        _$EspnSummaryResponseImpl instance) =>
    <String, dynamic>{
      'article': instance.article,
      'commentary': instance.commentary,
    };

_$EspnArticleImpl _$$EspnArticleImplFromJson(Map<String, dynamic> json) =>
    _$EspnArticleImpl(
      commentary: (json['commentary'] as List<dynamic>?)
              ?.map(
                  (e) => EspnCommentaryItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      items: (json['items'] as List<dynamic>?)
              ?.map(
                  (e) => EspnCommentaryItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$EspnArticleImplToJson(_$EspnArticleImpl instance) =>
    <String, dynamic>{
      'commentary': instance.commentary,
      'items': instance.items,
    };

_$EspnCommentaryItemImpl _$$EspnCommentaryItemImplFromJson(
        Map<String, dynamic> json) =>
    _$EspnCommentaryItemImpl(
      id: json['id'] as String?,
      playId: json['playId'] as String?,
      sequence: (json['sequence'] as num?)?.toInt(),
      text: json['text'] as String?,
      shortText: json['shortText'] as String?,
      headline: json['headline'] as String?,
      description: json['description'] as String?,
      minute: (json['minute'] as num?)?.toInt(),
      time: json['time'] == null
          ? null
          : EspnTime.fromJson(json['time'] as Map<String, dynamic>),
      scoringPlay: json['scoringPlay'] as bool? ?? false,
      scoreValue: json['scoreValue'] as String?,
      type: json['type'] as String?,
      typeText: json['typeText'] as String?,
      timestamp: json['timestamp'] as String?,
      date: json['date'] as String?,
      created: json['created'] as String?,
    );

Map<String, dynamic> _$$EspnCommentaryItemImplToJson(
        _$EspnCommentaryItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'playId': instance.playId,
      'sequence': instance.sequence,
      'text': instance.text,
      'shortText': instance.shortText,
      'headline': instance.headline,
      'description': instance.description,
      'minute': instance.minute,
      'time': instance.time,
      'scoringPlay': instance.scoringPlay,
      'scoreValue': instance.scoreValue,
      'type': instance.type,
      'typeText': instance.typeText,
      'timestamp': instance.timestamp,
      'date': instance.date,
      'created': instance.created,
    };

_$EspnTimeImpl _$$EspnTimeImplFromJson(Map<String, dynamic> json) =>
    _$EspnTimeImpl(
      displayValue: json['displayValue'] as String?,
      value: json['value'] as String?,
      clock: json['clock'] as String?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$$EspnTimeImplToJson(_$EspnTimeImpl instance) =>
    <String, dynamic>{
      'displayValue': instance.displayValue,
      'value': instance.value,
      'clock': instance.clock,
      'date': instance.date,
    };
