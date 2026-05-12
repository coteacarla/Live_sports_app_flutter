class ApiConstants {
  const ApiConstants._();

  static const baseUrl = String.fromEnvironment(
    'SPORTS_API_BASE_URL',
    defaultValue: 'https://www.thesportsdb.com/api/v1/json/3',
  );

  static const requestTimeoutSeconds = 15;

  // ESPN public scoreboard feeds — top 4 (or more) live endpoints per sport.
  static const espnLiveEndpointsBySport = <String, List<String>>{
    'football': [
      'https://site.api.espn.com/apis/site/v2/sports/soccer/eng.1/scoreboard',
      'https://site.api.espn.com/apis/site/v2/sports/soccer/esp.1/scoreboard',
      'https://site.api.espn.com/apis/site/v2/sports/soccer/ger.1/scoreboard',
      'https://site.api.espn.com/apis/site/v2/sports/soccer/ita.1/scoreboard',
      'https://site.api.espn.com/apis/site/v2/sports/soccer/fra.1/scoreboard',
    ],
    'basketball': [
      'https://site.api.espn.com/apis/site/v2/sports/basketball/nba/scoreboard',
      'https://site.api.espn.com/apis/site/v2/sports/basketball/wnba/scoreboard',
      'https://site.api.espn.com/apis/site/v2/sports/basketball/mens-college-basketball/scoreboard',
      'https://site.api.espn.com/apis/site/v2/sports/basketball/womens-college-basketball/scoreboard',
    ],
    'tennis': [
      'https://site.api.espn.com/apis/site/v2/sports/tennis/atp/scoreboard',
      'https://site.api.espn.com/apis/site/v2/sports/tennis/wta/scoreboard',
    ],
    'hockey': [
      'https://site.api.espn.com/apis/site/v2/sports/hockey/nhl/scoreboard',
    ],
  };

  // Maps every display league name to its ESPN endpoint slug.
  // Used by LeagueFilterBar to build the exact URL when a chip is tapped.
  static const leagueNameToEspnEndpointSlug = <String, String>{
    // ── Football / Soccer ──────────────────────────────────────────────────
    'Premier League':       'soccer/eng.1',
    'La Liga':              'soccer/esp.1',
    'Bundesliga':           'soccer/ger.1',
    'Serie A':              'soccer/ita.1',
    'Serie A TIM':          'soccer/ita.1',
    'Ligue 1':              'soccer/fra.1',
    'Championship':         'soccer/eng.2',
    'Scottish Premier League': 'soccer/sco.1',
    'Scottish Championship':   'soccer/sco.2',
    'Eredivisie':           'soccer/ned.1',
    'Primeira Liga':        'soccer/por.1',
    'Liga Portugal Bwin':   'soccer/por.1',
    'Super Lig':            'soccer/tur.1',
    'Süper Lig':            'soccer/tur.1',

    // ── Basketball ─────────────────────────────────────────────────────────
    'NBA':                        'basketball/nba',
    'WNBA':                       'basketball/wnba',
    'NCAA Men\'s Basketball':     'basketball/mens-college-basketball',
    'NCAA Women\'s Basketball':   'basketball/womens-college-basketball',

    // ── Tennis ─────────────────────────────────────────────────────────────
    'ATP Tour':  'tennis/atp',
    'WTA Tour':  'tennis/wta',

    // ── Hockey ────────────────────────────────────────────────────────────
    'NHL':                         'hockey/nhl',
  };

  // TheSportsDB league IDs used for schedule/results fallback.
  static const featuredLeagueIdsBySport = <String, List<String>>{
    'football': [
      '4328', // EPL
      '4335', // La Liga
      '4331', // Bundesliga
      '4346', // MLS
    ],
    'basketball': [
      '4387', // NBA
      '4389', // WNBA
      '4391', // NCAA Men's
      '4394', // EuroLeague
    ],
    'tennis': [
      '4516', // ATP Tour
      '4517', // WTA Tour
    ],
    'hockey': [
    ],
  };
}
