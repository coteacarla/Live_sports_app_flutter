import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/match.dart';
import '../../../sports/domain/entities/sport.dart';
import 'team_model.dart';

part 'match_model.freezed.dart';

@freezed
abstract class MatchModel with _$MatchModel {
  const MatchModel._();

  const factory MatchModel({
    required String id,
    required String leagueId,
    required SportType sportType,
    required TeamModel homeTeam,
    required TeamModel awayTeam,
    required DateTime scheduledAt,
    required MatchStatus status,
    String? homeScore,
    String? awayScore,
    int? elapsed,
    String? venue,
    String? round,
  }) = _MatchModel;

  factory MatchModel.fromJson(Map<String, dynamic> json) {
    // ESPN shape has competitions/homeAway/status.type.name
    if (json.containsKey('competitions')) {
      return _fromEspnJson(json);
    }

    return MatchModel(
      id: (json['id'] ?? '').toString(),
      leagueId: (json['leagueId'] ?? '').toString(),
      sportType: SportType.fromApiValue((json['sportId'] ?? json['sportType'] ?? 'football').toString()),
      homeTeam: _teamFromStandardJson(
        (json['homeTeam'] as Map?)?.cast<String, dynamic>(),
        fallbackId: 'home',
      ),
      awayTeam: _teamFromStandardJson(
        (json['awayTeam'] as Map?)?.cast<String, dynamic>(),
        fallbackId: 'away',
      ),
      scheduledAt: DateTime.tryParse((json['scheduledAt'] ?? '').toString())?.toUtc() ?? DateTime.now().toUtc(),
      status: _statusFromRaw(json['status']),
      homeScore: json['homeScore']?.toString(),
      awayScore: json['awayScore']?.toString(),
      elapsed: _safeInt(json['elapsed']),
      venue: json['venue']?.toString(),
      round: json['round']?.toString(),
    );
  }

  String get sportId => sportType.apiValue;

  Match toDomain() {
    final safeHome = homeTeam.copyWith(logoUrl: homeTeam.logoUrl ?? '');
    final safeAway = awayTeam.copyWith(logoUrl: awayTeam.logoUrl ?? '');

    return Match(
      id: id,
      leagueId: leagueId,
      sportType: sportType,
      homeTeam: safeHome.toDomain(),
      awayTeam: safeAway.toDomain(),
      scheduledAt: scheduledAt,
      status: status,
      homeScore: _scoreToInt(homeScore),
      awayScore: _scoreToInt(awayScore),
      elapsed: elapsed,
      venue: venue,
      round: round,
    );
  }

  static MatchModel _fromEspnJson(Map<String, dynamic> json) {
    final competitions = (json['competitions'] as List?) ?? const [];
    final competition = competitions.isNotEmpty
        ? (competitions.first as Map?)?.cast<String, dynamic>()
        : null;
    final competitors = (competition?['competitors'] as List?) ?? const [];
    final competitorMaps = competitors
        .whereType<Map>()
        .map((e) => e.cast<String, dynamic>())
        .toList(growable: false);

    Map<String, dynamic>? home;
    Map<String, dynamic>? away;
    try {
      home = competitorMaps.firstWhere(
        (c) => (c['homeAway'] ?? '').toString().toLowerCase() == 'home',
      );
    } catch (_) {
      home = competitorMaps.isNotEmpty ? competitorMaps.first : null;
    }
    try {
      away = competitorMaps.firstWhere(
        (c) => (c['homeAway'] ?? '').toString().toLowerCase() == 'away',
      );
    } catch (_) {
      away = competitorMaps.length > 1 ? competitorMaps[1] : null;
    }

    final sportSlug =
        ((json['sport'] as Map?)?['slug'] ?? '').toString().toLowerCase();
    final sportId = sportSlug == 'soccer' ? 'football' : sportSlug;

    final league = (json['league'] as Map?)?.cast<String, dynamic>();
    final statusName = (((json['status'] as Map?)?['type'] as Map?)?['name'] ??
            '')
        .toString();

    return MatchModel(
      id: 'espn_${(json['id'] ?? '').toString()}',
      leagueId: (league?['name'] ?? league?['slug'] ?? league?['id'] ?? '')
          .toString(),
      sportType: SportType.fromApiValue(
        sportId.isEmpty ? 'football' : sportId,
      ),
      homeTeam: _teamFromEspnCompetitor(home, fallbackId: 'home'),
      awayTeam: _teamFromEspnCompetitor(away, fallbackId: 'away'),
      scheduledAt: DateTime.tryParse((json['date'] ?? '').toString())
              ?.toUtc() ??
          DateTime.now().toUtc(),
      status: _statusFromRaw(statusName),
      homeScore: home?['score']?.toString(),
      awayScore: away?['score']?.toString(),
      elapsed: _safeInt((json['status'] as Map?)?['displayClock']),
      venue: ((competition?['venue'] as Map?)?['fullName'])?.toString(),
      round: ((competition?['type'] as Map?)?['abbreviation'])?.toString(),
    );
  }

  static TeamModel _teamFromEspnCompetitor(
    Map<String, dynamic>? competitor, {
    required String fallbackId,
  }) {
    final team = (competitor?['team'] as Map?)?.cast<String, dynamic>();
    final logos = (team?['logos'] as List?) ?? const [];
    final logo = logos.isNotEmpty
        ? ((logos.first as Map?)?['href'])?.toString()
        : null;

    return TeamModel(
      id: (team?['id'] ?? competitor?['id'] ?? fallbackId).toString(),
      name: (team?['displayName'] ?? team?['name'] ?? 'Unknown').toString(),
      shortName: (team?['shortDisplayName'] ?? team?['abbreviation'])
          ?.toString(),
      logoUrl: logo ?? '',
    );
  }

  static TeamModel _teamFromStandardJson(
    Map<String, dynamic>? json, {
    required String fallbackId,
  }) {
    if (json == null) {
      return TeamModel(id: fallbackId, name: 'Unknown', logoUrl: '');
    }

    return TeamModel(
      id: (json['id'] ?? fallbackId).toString(),
      name: (json['name'] ?? 'Unknown').toString(),
      shortName: json['shortName']?.toString(),
      logoUrl: (json['logoUrl'] ?? '').toString(),
      countryCode: json['countryCode']?.toString(),
      leagueId: json['leagueId']?.toString(),
    );
  }

  static MatchStatus _statusFromRaw(Object? raw) {
    if (raw is MatchStatus) return raw;

    if (raw is Map) {
      final nested = ((raw['type'] as Map?)?['name'] ?? raw['name'] ?? '')
          .toString();
      return _statusFromName(nested);
    }

    return _statusFromName((raw ?? '').toString());
  }

  static MatchStatus _statusFromName(String name) {
    final value = name.toLowerCase();
    if (value.contains('in_progress') || value == 'live') {
      return MatchStatus.live;
    }
    if (value.contains('final') || value.contains('full') || value == 'finished') {
      return MatchStatus.finished;
    }
    if (value.contains('pre') || value.contains('scheduled')) {
      return MatchStatus.scheduled;
    }
    if (value.contains('postponed')) return MatchStatus.postponed;
    if (value.contains('cancel')) return MatchStatus.cancelled;
    if (value.contains('pause') || value.contains('halftime')) {
      return MatchStatus.paused;
    }
    return MatchStatus.unknown;
  }

  static int? _safeInt(Object? value) => int.tryParse((value ?? '').toString());

  static int? _scoreToInt(Object? value) {
    // Parse scores from their string representation to avoid type mismatch.
    final asString = (value ?? '').toString();
    return int.tryParse(asString);
  }
}
