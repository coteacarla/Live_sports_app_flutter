import 'package:dio/dio.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/dio_client.dart';
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
    'volleyball',
  };

  static const Map<String, String> _sportIdToName = {
    'soccer': 'Soccer',
    'football': 'Soccer',
    'basketball': 'Basketball',
    'tennis': 'Tennis',
    'volleyball': 'Volleyball',
    'baseball': 'Baseball',
    'american-football': 'American Football',
    'american football': 'American Football',
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
        id: 'volleyball',
        name: 'Volleyball',
        slug: 'volleyball',
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

    final leagues = canonicalSportId == 'football'
        ? await _getFootballLeaguesFastPath(canonicalSportId)
        : await _getLeaguesBySportSearch(canonicalSportId);
    if (leagues.isNotEmpty) {
      return _applyCountryFilter(leagues, countryCode: countryCode);
    }

    final fallbackLeagues = await _getFeaturedLeaguesForSport(canonicalSportId);
    return _applyCountryFilter(fallbackLeagues, countryCode: countryCode);
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
        return allLeaguesRaw;
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

    return leaguesRaw
        .whereType<Map<String, dynamic>>()
        .map(
          (raw) => LeagueModel.fromJson(
            raw,
            sportType: SportType.fromApiValue(sportId),
          ),
        )
        .toList(growable: false);
  }

  Future<List<LeagueModel>> _getFeaturedLeaguesForSport(String sportId) async {
    final ids =
        ApiConstants.featuredLeagueIdsBySport[sportId] ?? const <String>[];
    if (ids.isEmpty) return const <LeagueModel>[];

    final leagues = await Future.wait(
      ids.map(getLeagueById),
    );
    return leagues.whereType<LeagueModel>().toList(growable: false);
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
    return LeagueModel.fromJson(raw);
  }

  @override
  Future<List<LeagueModel>> getFeaturedLeagues() async {
    final allIds = ApiConstants.featuredLeagueIdsBySport.values
        .expand((ids) => ids)
        .toSet()
        .toList(growable: false);
    final leagues = await Future.wait(allIds.map(getLeagueById));
    return leagues;
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

}
