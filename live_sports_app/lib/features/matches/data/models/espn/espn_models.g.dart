// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'espn_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EspnScoreboardResponse _$EspnScoreboardResponseFromJson(
  Map<String, dynamic> json,
) {
  // Collect raw event maps from all possible ESPN response shapes:
  //   1. Standard:          { "events": [...] }
  //   2. Tennis / golf:     { "sports": [{ "leagues": [{ "events": [...] }] }] }
  //   3. Top-level leagues: { "leagues": [{ "events": [...] }] }
  final rawEvents = <dynamic>[];

  // Capture root-level league for enriching synthetic match events (tennis/golf).
  Map<String, dynamic>? rootLeague;

  if (json['events'] is List) {
    rawEvents.addAll(json['events'] as List);
  }

  void collectFromLeagueList(List<dynamic> leagues) {
    for (final league in leagues) {
      if (league is! Map) continue;
      rootLeague ??= league.cast<String, dynamic>();
      final events = league['events'];
      if (events is List) rawEvents.addAll(events);
    }
  }

  if (json['sports'] is List) {
    for (final sport in json['sports'] as List) {
      if (sport is! Map) continue;
      final leagues = sport['leagues'];
      if (leagues is List) collectFromLeagueList(leagues);
    }
  }

  if (json['leagues'] is List) {
    collectFromLeagueList(json['leagues'] as List);
    if (rootLeague == null) {
      for (final l in json['leagues'] as List) {
        if (l is Map) { rootLeague = l.cast<String, dynamic>(); break; }
      }
    }
  }

  // Expand tournament events that use groupings (tennis, golf) into individual
  // match events. Such events have no direct competitions array.
  final expanded = <dynamic>[];
  for (final rawEvent in rawEvents) {
    if (rawEvent is! Map) { expanded.add(rawEvent); continue; }
    final groupings = rawEvent['groupings'];
    if (groupings is! List || groupings.isEmpty) {
      expanded.add(rawEvent);
      continue;
    }
    for (final grouping in groupings) {
      if (grouping is! Map) continue;
      final comps = grouping['competitions'];
      if (comps is! List) continue;
      for (final comp in comps) {
        if (comp is! Map) continue;
        expanded.add(_buildGroupingMatchEvent(
          rawEvent.cast<String, dynamic>(),
          comp.cast<String, dynamic>(),
          rootLeague: rootLeague,
        ));
      }
    }
  }

  return _EspnScoreboardResponse(
    events: expanded.expand((e) {
      try {
        return [EspnEvent.fromJson(e as Map<String, dynamic>)];
      } catch (_) {
        return const <EspnEvent>[];
      }
    }).toList(),
  );
}

/// Builds a synthetic EspnEvent-shaped map for a single competition
/// extracted from a tournament event's groupings (tennis, golf, etc.).
Map<String, dynamic> _buildGroupingMatchEvent(
  Map<String, dynamic> rawTournament,
  Map<String, dynamic> comp, {
  Map<String, dynamic>? rootLeague,
}) {
  final competitors = comp['competitors'];
  String name = '';
  if (competitors is List && competitors.length >= 2) {
    final c0 = competitors[0] is Map ? competitors[0] as Map : null;
    final c1 = competitors[1] is Map ? competitors[1] as Map : null;
    final n0 = _groupingCompetitorName(c0);
    final n1 = _groupingCompetitorName(c1);
    if (n0.isNotEmpty && n1.isNotEmpty) name = '$n0 vs. $n1';
  }

  // Enrich each competitor with a synthetic integer score (sets won) so the
  // existing score parser can display a meaningful value.
  List<dynamic> enrichedCompetitors = const [];
  if (competitors is List) {
    enrichedCompetitors = competitors.map((c) {
      if (c is! Map) return c;
      final setsWon = _groupingSetsWon(c['linescores']);
      return <String, dynamic>{
        ...c.cast<String, dynamic>(),
        if (setsWon != null) 'score': setsWon,
      };
    }).toList(growable: false);
  }

  return <String, dynamic>{
    'id': (comp['id'] ?? rawTournament['id'] ?? '').toString(),
    'date': (comp['date'] ?? comp['startDate'] ?? rawTournament['date'] ?? '').toString(),
    'name': name.isEmpty ? (rawTournament['name'] ?? '') : name,
    'status': comp['status'],
    'competitions': <dynamic>[
      <String, dynamic>{
        ...comp,
        'competitors': enrichedCompetitors,
      }
    ],
    if (rootLeague != null) 'league': rootLeague,
    'links': rawTournament['links'] ?? const <dynamic>[],
  };
}

/// Extracts a display name for a competition-level competitor.
/// Handles the individual-sport pattern where names are under [competitor.athlete].
String _groupingCompetitorName(Map? c) {
  if (c == null) return '';
  final athlete = c['athlete'];
  if (athlete is Map) {
    for (final key in const ['displayName', 'fullName', 'shortName']) {
      final v = athlete[key];
      if (v is String && v.isNotEmpty) return v;
    }
  }
  for (final key in const ['displayName', 'fullName', 'name']) {
    final v = c[key];
    if (v is String && v.isNotEmpty) return v;
  }
  return '';
}

/// Returns the number of completed sets won by this competitor,
/// derived from [linescores] entries where winner == true.
int? _groupingSetsWon(dynamic linescores) {
  if (linescores is! List || linescores.isEmpty) return null;
  return linescores.whereType<Map>().where((ls) => ls['winner'] == true).length;
}

Map<String, dynamic> _$EspnScoreboardResponseToJson(
  _EspnScoreboardResponse instance,
) => <String, dynamic>{'events': instance.events};

_EspnEvent _$EspnEventFromJson(Map<String, dynamic> json) => _EspnEvent(
  id: (json['id'] ?? '').toString(),
  date: (json['date'] ?? '').toString(),
  name: (json['name'] ?? '').toString(),
  status: json['status'] is Map
      ? EspnStatus.fromJson((json['status'] as Map).cast<String, dynamic>())
      : const EspnStatus(),
  competitions:
      (json['competitions'] is List
              ? json['competitions'] as List<dynamic>
              : const <dynamic>[])
          .expand((e) {
            try {
              return [EspnCompetition.fromJson(e as Map<String, dynamic>)];
            } catch (_) {
              return const <EspnCompetition>[];
            }
          })
          .toList(),
  league: json['league'] is Map
      ? EspnLeague.fromJson((json['league'] as Map).cast<String, dynamic>())
      : null,
  sport: json['sport'] is Map
      ? EspnSport.fromJson((json['sport'] as Map).cast<String, dynamic>())
      : null,
  links:
      (json['links'] is List
              ? json['links'] as List<dynamic>
              : const <dynamic>[])
          .expand((e) {
            try {
              return [EspnLink.fromJson(e as Map<String, dynamic>)];
            } catch (_) {
              return const <EspnLink>[];
            }
          })
          .toList(),
);

Map<String, dynamic> _$EspnEventToJson(_EspnEvent instance) =>
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

_EspnCompetition _$EspnCompetitionFromJson(Map<String, dynamic> json) =>
    _EspnCompetition(
      id: (json['id'] ?? '').toString(),
      competitors:
          (json['competitors'] is List
                  ? json['competitors'] as List<dynamic>
                  : const <dynamic>[])
              .expand((e) {
                try {
                  return [EspnCompetitor.fromJson(e as Map<String, dynamic>)];
                } catch (_) {
                  return const <EspnCompetitor>[];
                }
              })
              .toList(),
      venue: json['venue'] is Map
          ? EspnVenue.fromJson((json['venue'] as Map).cast<String, dynamic>())
          : null,
      type: json['type'] is Map
          ? EspnCompetitionType.fromJson(
              (json['type'] as Map).cast<String, dynamic>())
          : null,
    );

Map<String, dynamic> _$EspnCompetitionToJson(_EspnCompetition instance) =>
    <String, dynamic>{
      'id': instance.id,
      'competitors': instance.competitors,
      'venue': instance.venue,
      'type': instance.type,
    };

_EspnCompetitor _$EspnCompetitorFromJson(Map<String, dynamic> json) {
  // Build team data by merging from lowest to highest priority:
  //   1. Competitor's own flat fields  (tennis / golf flat structure)
  //   2. athlete / athletes nested obj (individual sport nested structure)
  //   3. team nested obj               (team sport structure)
  final teamData = <String, dynamic>{};

  // 1. Seed with competitor-level display fields (flat individual-sport shape).
  for (final key in const [
    'displayName', 'fullName', 'name', 'nickname',
    'firstName', 'lastName', 'shortDisplayName', 'shortName',
    'abbreviation', 'logos',
  ]) {
    if (json[key] != null) teamData[key] = json[key];
  }

  // 2. Merge athlete / athletes (overrides flat fields where non-null).
  Map<String, dynamic>? athlete;
  if (json['athlete'] is Map) {
    athlete = (json['athlete'] as Map).cast<String, dynamic>();
  } else if (json['athletes'] is List) {
    final list = json['athletes'] as List;
    if (list.isNotEmpty && list.first is Map) {
      athlete = (list.first as Map).cast<String, dynamic>();
    }
  }
  if (athlete != null) {
    athlete.forEach((k, v) { if (v != null) teamData[k] = v; });
  }

  // 3. Team fields take highest priority (team sports).
  if (json['team'] is Map) {
    (json['team'] as Map).cast<String, dynamic>().forEach((k, v) {
      if (v != null) teamData[k] = v;
    });
  }

  teamData['id'] ??= (json['id'] ?? '').toString();

  return _EspnCompetitor(
    id: (json['id'] ?? '').toString(),
    team: EspnTeam.fromJson(teamData),
    homeAway: json['homeAway']?.toString(),
    score: json['score'] is num
        ? (json['score'] as num).toInt()
        : int.tryParse((json['score'] ?? '').toString()),
  );
}

Map<String, dynamic> _$EspnCompetitorToJson(_EspnCompetitor instance) =>
    <String, dynamic>{
      'id': instance.id,
      'team': instance.team,
      'homeAway': instance.homeAway,
      'score': instance.score,
    };

_EspnStatus _$EspnStatusFromJson(Map<String, dynamic> json) => _EspnStatus(
  type: json['type'] is Map
      ? EspnStatusType.fromJson((json['type'] as Map).cast<String, dynamic>())
      : null,
  displayClock: json['displayClock']?.toString(),
  detail: json['detail']?.toString(),
);

Map<String, dynamic> _$EspnStatusToJson(_EspnStatus instance) =>
    <String, dynamic>{
      'type': instance.type,
      'displayClock': instance.displayClock,
      'detail': instance.detail,
    };

_EspnStatusType _$EspnStatusTypeFromJson(Map<String, dynamic> json) =>
    _EspnStatusType(
      id: (json['id'] ?? '').toString(),
      name: json['name']?.toString(),
      completed: json['completed'] == true,
    );

Map<String, dynamic> _$EspnStatusTypeToJson(_EspnStatusType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'completed': instance.completed,
    };

_EspnTeam _$EspnTeamFromJson(Map<String, dynamic> json) {
  // Build displayName from multiple possible ESPN/athlete field names.
  String? displayName;
  for (final key in const ['displayName', 'fullName']) {
    if (json[key] != null) { displayName = json[key].toString(); break; }
  }
  if (displayName == null) {
    final first = json['firstName']?.toString();
    final last = json['lastName']?.toString();
    if (first != null || last != null) {
      displayName = '${first ?? ''} ${last ?? ''}'.trim();
      if (displayName.isEmpty) displayName = null;
    }
  }

  return _EspnTeam(
  id: (json['id'] ?? '').toString(),
  name: (json['name'] ?? json['nickname'])?.toString(),
  displayName: displayName,
  shortDisplayName:
      (json['shortDisplayName'] ?? json['shortName'])?.toString(),
  abbreviation: json['abbreviation']?.toString(),
  logos:
      (json['logos'] as List<dynamic>?)
          ?.expand((e) {
            try {
              return [EspnLogo.fromJson(e as Map<String, dynamic>)];
            } catch (_) {
              return const <EspnLogo>[];
            }
          })
          .toList() ??
      const [],
  );
}

Map<String, dynamic> _$EspnTeamToJson(_EspnTeam instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'displayName': instance.displayName,
  'shortDisplayName': instance.shortDisplayName,
  'abbreviation': instance.abbreviation,
  'logos': instance.logos,
};

_EspnLogo _$EspnLogoFromJson(Map<String, dynamic> json) => _EspnLogo(
  href: json['href'] as String?,
  alt: json['alt'] as String?,
  rel:
      (json['rel'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$EspnLogoToJson(_EspnLogo instance) => <String, dynamic>{
  'href': instance.href,
  'alt': instance.alt,
  'rel': instance.rel,
};

_EspnLeague _$EspnLeagueFromJson(Map<String, dynamic> json) => _EspnLeague(
  id: (json['id'] ?? '').toString(),
  name: json['name']?.toString(),
  slug: json['slug']?.toString(),
);

Map<String, dynamic> _$EspnLeagueToJson(_EspnLeague instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
    };

_EspnSport _$EspnSportFromJson(Map<String, dynamic> json) => _EspnSport(
  id: (json['id'] ?? '').toString(),
  name: json['name']?.toString(),
  slug: json['slug']?.toString(),
);

Map<String, dynamic> _$EspnSportToJson(_EspnSport instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
    };

_EspnVenue _$EspnVenueFromJson(Map<String, dynamic> json) => _EspnVenue(
  id: (json['id'] ?? '').toString(),
  fullName: json['fullName']?.toString(),
  shortName: json['shortName']?.toString(),
  address: json['address']?.toString(),
  city: json['city']?.toString(),
  state: json['state']?.toString(),
  zipCode: json['zipCode']?.toString(),
  country: json['country']?.toString(),
);

Map<String, dynamic> _$EspnVenueToJson(_EspnVenue instance) =>
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

_EspnCompetitionType _$EspnCompetitionTypeFromJson(Map<String, dynamic> json) =>
    _EspnCompetitionType(
      id: (json['id'] ?? '').toString(),
      name: json['name']?.toString(),
      abbreviation: json['abbreviation']?.toString(),
    );

Map<String, dynamic> _$EspnCompetitionTypeToJson(
  _EspnCompetitionType instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'abbreviation': instance.abbreviation,
};

_EspnLink _$EspnLinkFromJson(Map<String, dynamic> json) => _EspnLink(
  href: json['href'] as String?,
  rel: json['rel'] is String ? json['rel'] as String : null,
  text: json['text'] as String?,
);

Map<String, dynamic> _$EspnLinkToJson(_EspnLink instance) => <String, dynamic>{
  'href': instance.href,
  'rel': instance.rel,
  'text': instance.text,
};

_EspnSummaryResponse _$EspnSummaryResponseFromJson(Map<String, dynamic> json) =>
    _EspnSummaryResponse(
      article: json['article'] is Map
          ? EspnArticle.fromJson((json['article'] as Map).cast<String, dynamic>())
          : null,
      commentary:
          (json['commentary'] as List<dynamic>?)
              ?.expand((e) {
                try {
                  return [EspnCommentaryItem.fromJson(e as Map<String, dynamic>)];
                } catch (_) {
                  return const <EspnCommentaryItem>[];
                }
              })
              .toList() ??
          const [],
    );

Map<String, dynamic> _$EspnSummaryResponseToJson(
  _EspnSummaryResponse instance,
) => <String, dynamic>{
  'article': instance.article,
  'commentary': instance.commentary,
};

_EspnArticle _$EspnArticleFromJson(Map<String, dynamic> json) => _EspnArticle(
  commentary:
      (json['commentary'] as List<dynamic>?)
          ?.expand((e) {
            try {
              return [EspnCommentaryItem.fromJson(e as Map<String, dynamic>)];
            } catch (_) {
              return const <EspnCommentaryItem>[];
            }
          })
          .toList() ??
      const [],
  items:
      (json['items'] as List<dynamic>?)
          ?.expand((e) {
            try {
              return [EspnCommentaryItem.fromJson(e as Map<String, dynamic>)];
            } catch (_) {
              return const <EspnCommentaryItem>[];
            }
          })
          .toList() ??
      const [],
);

Map<String, dynamic> _$EspnArticleToJson(_EspnArticle instance) =>
    <String, dynamic>{
      'commentary': instance.commentary,
      'items': instance.items,
    };

_EspnCommentaryItem _$EspnCommentaryItemFromJson(Map<String, dynamic> json) =>
    _EspnCommentaryItem(
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

Map<String, dynamic> _$EspnCommentaryItemToJson(_EspnCommentaryItem instance) =>
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

_EspnTime _$EspnTimeFromJson(Map<String, dynamic> json) => _EspnTime(
  displayValue: json['displayValue'] as String?,
  value: json['value'] as String?,
  clock: json['clock'] as String?,
  date: json['date'] as String?,
);

Map<String, dynamic> _$EspnTimeToJson(_EspnTime instance) => <String, dynamic>{
  'displayValue': instance.displayValue,
  'value': instance.value,
  'clock': instance.clock,
  'date': instance.date,
};
