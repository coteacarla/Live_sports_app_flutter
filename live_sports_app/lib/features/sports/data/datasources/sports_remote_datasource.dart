import 'package:dio/dio.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/dio_client.dart';
import '../../domain/entities/league.dart';
import '../../domain/entities/sport.dart';
import '../models/league_model.dart';
import '../models/sport_model.dart';

abstract class SportsRemoteDataSource {
  Future<List<SportModel>> getSports();
  Future<List<LeagueModel>> getLeaguesBySport(
    String sportId, {
    String? countryCode,
  });
  Future<LeagueModel> getLeagueById(String leagueId);
  Future<List<LeagueModel>> getFeaturedLeagues();
}

class SportsRemoteDataSourceImpl implements SportsRemoteDataSource {
  const SportsRemoteDataSourceImpl({required DioClient dioClient})
      : _dio = dioClient;

  final DioClient _dio;
  static const Set<String> _supportedSportIds = {
    'football',
    'basketball',
    'tennis',
    'hockey',
  };

  static const Map<String, String> _sportIdToName = {
    'soccer': 'Soccer',
    'football': 'Soccer',
    'basketball': 'Basketball',
    'tennis': 'Tennis',
    'hockey': 'Hockey',
    'baseball': 'Baseball',
    'american-football': 'American Football',
    'american football': 'American Football',
  };

  // Default current seasons for major leagues (in case API doesn't provide them)
  static const Map<String, String> _defaultCurrentSeasons = {
    // Football
    'Premier League': '2025-2026',
    'La Liga': '2025-2026',
    'Serie A': '2025-2026',
    'Bundesliga': '2025-2026',
    'Ligue 1': '2025-2026',
    'Championship': '2025-2026',
    'Scottish Premier League': '2025-2026',
    'Scottish Championship': '2025-2026',
    'Eredivisie': '2025-2026',
    'Primeira Liga': '2025-2026',
    'Super Lig': '2025-2026',
    'Serie A TIM': '2025-2026',
    'Liga Portugal Bwin': '2025-2026',
    'Süper Lig': '2025-2026',
    // Basketball
    'NBA': '2024-2025',
    'WNBA': '2025',
    "NCAA Men's Basketball": '2024-2025',
    "NCAA Women's Basketball": '2024-2025',
    // Tennis
    'ATP Tour': '2025',
    'WTA Tour': '2025',
    // Hockey
    'NHL': '2025-2026',
  };

  // Static league definitions guaranteed to appear for every sport,
  // regardless of what TheSportsDB returns (names may differ per region).
  static const Map<String, List<LeagueModel>> _staticLeaguesBySport = {
    'football': [
      LeagueModel(
        id: 's_epl', name: 'Premier League',
        sportType: SportType.football, type: LeagueType.domestic,
        country: 'England', currentSeason: '2025-2026',
      ),
      LeagueModel(
        id: 's_laliga', name: 'La Liga',
        sportType: SportType.football, type: LeagueType.domestic,
        country: 'Spain', currentSeason: '2025-2026',
      ),
      LeagueModel(
        id: 's_bundesliga', name: 'Bundesliga',
        sportType: SportType.football, type: LeagueType.domestic,
        country: 'Germany', currentSeason: '2025-2026',
      ),
      LeagueModel(
        id: 's_seriea', name: 'Serie A',
        sportType: SportType.football, type: LeagueType.domestic,
        country: 'Italy', currentSeason: '2025-2026',
      ),
      LeagueModel(
        id: 's_ligue1', name: 'Ligue 1',
        sportType: SportType.football, type: LeagueType.domestic,
        country: 'France', currentSeason: '2025-2026',
      ),
    ],
    'basketball': [
      LeagueModel(
        id: 's_nba', name: 'NBA',
        sportType: SportType.basketball, type: LeagueType.domestic,
        country: 'United States', currentSeason: '2024-2025',
      ),
      LeagueModel(
        id: 's_wnba', name: 'WNBA',
        sportType: SportType.basketball, type: LeagueType.domestic,
        country: 'United States', currentSeason: '2025',
      ),
      LeagueModel(
        id: 's_ncaa_mb', name: "NCAA Men's Basketball",
        sportType: SportType.basketball, type: LeagueType.domestic,
        country: 'United States', currentSeason: '2024-2025',
      ),
      LeagueModel(
        id: 's_ncaa_wb', name: "NCAA Women's Basketball",
        sportType: SportType.basketball, type: LeagueType.domestic,
        country: 'United States', currentSeason: '2024-2025',
      ),
    ],
    'tennis': [
      LeagueModel(
        id: 's_atp', name: 'ATP Tour',
        sportType: SportType.tennis, type: LeagueType.international,
        currentSeason: '2025',
      ),
      LeagueModel(
        id: 's_wta', name: 'WTA Tour',
        sportType: SportType.tennis, type: LeagueType.international,
        currentSeason: '2025',
      ),
    ],
    'hockey': [
      LeagueModel(
        id: 's_nhl', name: 'NHL',
        sportType: SportType.hockey, type: LeagueType.domestic,
        country: 'United States', currentSeason: '2025-2026',
      ),
    ],
  };

  @override
  Future<List<SportModel>> getSports() async {
    final fallback = <SportModel>[
      const SportModel(
        id: 'football',
        name: 'Soccer',
        slug: 'football',
        isPopular: true,
      ),
      const SportModel(
        id: 'basketball',
        name: 'Basketball',
        slug: 'basketball',
        isPopular: true,
      ),
      const SportModel(
        id: 'tennis',
        name: 'Tennis',
        slug: 'tennis',
        isPopular: true,
      ),
      const SportModel(
        id: 'hockey',
        name: 'Hockey',
        slug: 'hockey',
        isPopular: true,
      ),
    ];

    try {
      final response = await _dio.instance.get<Map<String, dynamic>>(
        '/all_sports.php',
      );
      final rawList = (response.data?['sports'] as List<dynamic>? ?? const []);
      final apiSports = rawList
          .whereType<Map<String, dynamic>>()
          .map(SportModel.fromJson)
          .where(
            (model) =>
                model.id.isNotEmpty &&
                model.name.isNotEmpty &&
                _supportedSportIds.contains(model.slug),
          )
          .toList(growable: false);

      final bySlug = <String, SportModel>{
        for (final sport in fallback) sport.slug: sport,
      };
      for (final sport in apiSports) {
        final slug = _canonicalSlug(sport.slug);
        bySlug[slug] = SportModel(
          id: sport.id,
          name: sport.name,
          slug: slug,
          iconUrl: sport.iconUrl,
          isPopular: sport.isPopular,
        );
      }

      return bySlug.values.toList(growable: false);
    } catch (_) {
      return fallback;
    }
  }

  @override
  Future<List<LeagueModel>> getLeaguesBySport(
    String sportId, {
    String? countryCode,
  }) async {
    final canonicalSportId = _canonicalSlug(sportId.toLowerCase());

    // All sports: always include static leagues as guaranteed chips, then
    // enrich with whatever the API returns (deduplicated by name).
    final staticLeagues =
        _staticLeaguesBySport[canonicalSportId] ?? const <LeagueModel>[];
    List<LeagueModel> apiLeagues = const [];
    try {
      apiLeagues = canonicalSportId == 'football'
          ? await _getFootballLeaguesFastPath(canonicalSportId)
          : await _getLeaguesBySportSearch(canonicalSportId);
    } catch (_) {}

    final merged = _mergeWithStatic(
      staticLeagues: staticLeagues,
      apiLeagues: apiLeagues,
    );
    return _applyCountryFilter(merged, countryCode: countryCode);
  }

  List<LeagueModel> _mergeWithStatic({
    required List<LeagueModel> staticLeagues,
    required List<LeagueModel> apiLeagues,
  }) {
    final staticNames = staticLeagues.map((l) => l.name).toSet();
    final extras = apiLeagues
        .where((l) => !staticNames.contains(l.name))
        .toList(growable: false);
    return [...staticLeagues, ...extras];
  }

  Future<List<LeagueModel>> _getFootballLeaguesFastPath(String sportId) async {
    try {
      final allLeaguesResponse = await _dio.instance.get<Map<String, dynamic>>(
        '/all_leagues.php',
      );

      final allLeaguesRaw =
          (allLeaguesResponse.data?['leagues'] as List<dynamic>? ?? const [])
              .whereType<Map<String, dynamic>>()
              .map(LeagueModel.fromJson)
              .where((league) => league.sportType == SportType.football)
              .toList(growable: false);

      if (allLeaguesRaw.isNotEmpty) {
        return _applyDefaultSeasons(allLeaguesRaw);
      }
    } catch (_) {
      // Fall back to sport search endpoint below.
    }

    return _getLeaguesBySportSearch(sportId);
  }

  Future<List<LeagueModel>> _getLeaguesBySportSearch(String sportId) async {
    final sportName = await _resolveSportName(sportId);
    final response = await _dio.instance.get<Map<String, dynamic>>(
      '/search_all_leagues.php',
      queryParameters: {'s': sportName},
    );

    final leaguesRaw = (response.data?['countries'] as List<dynamic>?) ??
        (response.data?['countrys'] as List<dynamic>?) ??
        const <dynamic>[];

    final leagues = leaguesRaw
        .whereType<Map<String, dynamic>>()
        .map(
          (raw) => LeagueModel.fromJson(
            raw,
            sportType: SportType.fromApiValue(sportId),
          ),
        )
        .toList(growable: false);

    return _applyDefaultSeasons(leagues);
  }

  List<LeagueModel> _applyCountryFilter(
    List<LeagueModel> leagues, {
    String? countryCode,
  }) {
    return leagues.where((league) {
      if (countryCode == null || countryCode.isEmpty) return true;
      return (league.country ?? '').toUpperCase() == countryCode.toUpperCase();
    }).toList(growable: false);
  }

  @override
  Future<LeagueModel> getLeagueById(String leagueId) async {
    final response = await _dio.instance.get<Map<String, dynamic>>(
      '/lookupleague.php',
      queryParameters: {'id': leagueId},
    );

    final leagues =
        (response.data?['leagues'] as List<dynamic>? ?? const <dynamic>[])
            .whereType<Map<String, dynamic>>()
            .toList(growable: false);
    if (leagues.isEmpty) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        message: 'League not found',
      );
    }

    final raw = leagues.first;
    var league = LeagueModel.fromJson(raw);
    // Apply default season if not provided by API
    if (league.currentSeason == null || league.currentSeason!.isEmpty) {
      final defaultSeason = _defaultCurrentSeasons[league.name];
      if (defaultSeason != null) {
        league = league.copyWith(currentSeason: defaultSeason) as LeagueModel;
      }
    }
    return league;
  }

  @override
  Future<List<LeagueModel>> getFeaturedLeagues() async {
    final allIds = ApiConstants.featuredLeagueIdsBySport.values
        .expand((ids) => ids)
        .toSet()
        .toList(growable: false);
    final leagues = await Future.wait(allIds.map(getLeagueById));
    return _applyDefaultSeasons(leagues);
  }

  Future<String> _resolveSportName(String sportId) async {
    final mapped = _sportIdToName[sportId.toLowerCase()];
    if (mapped != null) return mapped;

    final sports = await getSports();
    final found = sports.firstWhere(
      (sport) => sport.id == sportId || sport.slug == sportId,
      orElse: () => const SportModel(id: '', name: 'Soccer', slug: 'soccer'),
    );
    return found.name;
  }

  static String _canonicalSlug(String slug) {
    if (slug == 'soccer') return 'football';
    return slug;
  }

  /// Applies default current season values to leagues that don't have them.
  List<LeagueModel> _applyDefaultSeasons(List<LeagueModel> leagues) {
    return leagues.map((league) {
      if (league.currentSeason == null || league.currentSeason!.isEmpty) {
        final defaultSeason = _defaultCurrentSeasons[league.name];
        if (defaultSeason != null) {
          return league.copyWith(currentSeason: defaultSeason) as LeagueModel;
        }
      }
      return league;
    }).toList(growable: false);
  }
}
