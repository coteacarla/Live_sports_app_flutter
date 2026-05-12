class ApiConstants {
  const ApiConstants._();

  static const baseUrl = String.fromEnvironment(
    'SPORTS_API_BASE_URL',
    defaultValue: 'https://www.thesportsdb.com/api/v1/json/3',
  );

  static const requestTimeoutSeconds = 15;

  // ESPN public scoreboard feeds.
  // Note: FIVB volleyball endpoints (fivb-volleyball-womens/mens) return HTTP 400 and are excluded.
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
    'volleyball': [
      'https://site.api.espn.com/apis/site/v2/sports/volleyball/womens-college-volleyball/scoreboard',
      'https://site.api.espn.com/apis/site/v2/sports/volleyball/mens-college-volleyball/scoreboard',
    ],
    'hockey': [
      'https://site.api.espn.com/apis/site/v2/sports/hockey/nhl/scoreboard',
      'https://site.api.espn.com/apis/site/v2/sports/hockey/mens-college-hockey/scoreboard',
      'https://site.api.espn.com/apis/site/v2/sports/hockey/womens-college-hockey/scoreboard',
    ],
  };

  // Maps every display league name to its ESPN endpoint slug.
  // Used by LeagueFilterBar to build the exact URL when a chip is tapped.
  static const leagueNameToEspnEndpointSlug = <String, String>{
    // ── Football / Soccer ──────────────────────────────────────────────────
    'Premier League':            'soccer/eng.1',
    'La Liga':                   'soccer/esp.1',
    'Bundesliga':                'soccer/ger.1',
    'Serie A':                   'soccer/ita.1',
    'Serie A TIM':               'soccer/ita.1',
    'Ligue 1':                   'soccer/fra.1',
    'Championship':              'soccer/eng.2',
    'Scottish Premier League':   'soccer/sco.1',
    'Scottish Championship':     'soccer/sco.2',
    'Eredivisie':                'soccer/ned.1',
    'Primeira Liga':             'soccer/por.1',
    'Liga Portugal Bwin':        'soccer/por.1',
    'Super Lig':                 'soccer/tur.1',
    'Süper Lig':                 'soccer/tur.1',

    // ── Basketball ─────────────────────────────────────────────────────────
    'NBA':                        'basketball/nba',
    'WNBA':                       'basketball/wnba',
    'NCAA Men\'s Basketball':     'basketball/mens-college-basketball',
    'NCAA Women\'s Basketball':   'basketball/womens-college-basketball',

    // ── Volleyball ─────────────────────────────────────────────────────────
    'NCAA Women\'s Volleyball':   'volleyball/womens-college-volleyball',
    'NCAA Men\'s Volleyball':     'volleyball/mens-college-volleyball',

    // ── Hockey ─────────────────────────────────────────────────────────────
    'NHL':                          'hockey/nhl',
    'NCAA Men\'s Hockey':           'hockey/mens-college-hockey',
    'NCAA Women\'s Hockey':         'hockey/womens-college-hockey',
  };
}
