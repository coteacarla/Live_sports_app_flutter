class ApiConstants {
  const ApiConstants._();

  static const baseUrl = String.fromEnvironment(
    'SPORTS_API_BASE_URL',
    defaultValue: 'https://www.thesportsdb.com/api/v1/json/3', // '3' is a common public test key
  );

  static const requestTimeoutSeconds = 15;

  // ESPN public scoreboard feeds for live coverage (no API key required).
  static const espnLiveEndpointsBySport = <String, List<String>>{
    'football': [
      'https://site.api.espn.com/apis/site/v2/sports/soccer/eng.1/scoreboard',
      'https://site.api.espn.com/apis/site/v2/sports/soccer/esp.1/scoreboard',
      'https://site.api.espn.com/apis/site/v2/sports/soccer/ger.1/scoreboard',
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
    'volleyball': [
      'https://site.api.espn.com/apis/site/v2/sports/volleyball/womens-college-volleyball/scoreboard',
    ],
  };

  // TheSportsDB league IDs scoped per sport for schedule/results pull.
  static const featuredLeagueIdsBySport = <String, List<String>>{
    'football': [
      '4328', // EPL
      '4335', // La Liga
      '4331', // Bundesliga
      '4346', // American MLS
    ],
    'basketball': [
      '4387', // NBA
      '4389', // WNBA
      '4391', // NCAA Men's
      '4394', // EuroLeague
      '4401', // Spanish Liga ACB
    ],
    'tennis': [
      '4516', // ATP Tour
      '4517', // WTA Tour
      '4473', // French Open
      '4474', // US Open
      '4475', // Wimbledon
      '4476', // Australian Open
    ],
    'volleyball': [
      '4520', // FIVB Nations League (Men)
      '4521', // FIVB Nations League (Women)
      '4503', // Italian SuperLega
      '4505', // Polish PlusLiga
    ],
  };
}