import 'package:freezed_annotation/freezed_annotation.dart';

part 'espn_models.freezed.dart';
part 'espn_models.g.dart';

@freezed
abstract class EspnScoreboardResponse with _$EspnScoreboardResponse {
  const factory EspnScoreboardResponse({
    @Default([]) List<EspnEvent> events,
  }) = _EspnScoreboardResponse;

  factory EspnScoreboardResponse.fromJson(Map<String, dynamic> json) =>
      _$EspnScoreboardResponseFromJson(json);
}

@freezed
abstract class EspnEvent with _$EspnEvent {
  const factory EspnEvent({
    required String id,
    required String date,
    required String name,
    required EspnStatus status,
    @Default([]) List<EspnCompetition> competitions,
    EspnLeague? league,
    EspnSport? sport,
    @Default([]) List<EspnLink> links,
  }) = _EspnEvent;

  factory EspnEvent.fromJson(Map<String, dynamic> json) =>
      _$EspnEventFromJson(json);
}

@freezed
abstract class EspnCompetition with _$EspnCompetition {
  const factory EspnCompetition({
    required String id,
    @Default([]) List<EspnCompetitor> competitors,
    EspnVenue? venue,
    EspnCompetitionType? type,
  }) = _EspnCompetition;

  factory EspnCompetition.fromJson(Map<String, dynamic> json) =>
      _$EspnCompetitionFromJson(json);
}

@freezed
abstract class EspnCompetitor with _$EspnCompetitor {
  const factory EspnCompetitor({
    required String id,
    required EspnTeam team,
    String? homeAway,
    int? score,
  }) = _EspnCompetitor;

  factory EspnCompetitor.fromJson(Map<String, dynamic> json) =>
      _$EspnCompetitorFromJson(json);
}

@freezed
abstract class EspnStatus with _$EspnStatus {
  const factory EspnStatus({
    EspnStatusType? type,
    String? displayClock,
    String? detail,
  }) = _EspnStatus;

  factory EspnStatus.fromJson(Map<String, dynamic> json) =>
      _$EspnStatusFromJson(json);
}

@freezed
abstract class EspnStatusType with _$EspnStatusType {
  const factory EspnStatusType({
    required String id,
    String? name,
    @Default(false) bool completed,
  }) = _EspnStatusType;

  factory EspnStatusType.fromJson(Map<String, dynamic> json) =>
      _$EspnStatusTypeFromJson(json);
}

@freezed
abstract class EspnTeam with _$EspnTeam {
  const factory EspnTeam({
    required String id,
    String? name,
    String? displayName,
    String? shortDisplayName,
    String? abbreviation,
    @Default([]) List<EspnLogo> logos,
  }) = _EspnTeam;

  factory EspnTeam.fromJson(Map<String, dynamic> json) =>
      _$EspnTeamFromJson(json);
}

@freezed
abstract class EspnLogo with _$EspnLogo {
  const factory EspnLogo({
    String? href,
    String? alt,
    @Default([]) List<String> rel,
  }) = _EspnLogo;

  factory EspnLogo.fromJson(Map<String, dynamic> json) =>
      _$EspnLogoFromJson(json);
}

@freezed
abstract class EspnLeague with _$EspnLeague {
  const factory EspnLeague({
    required String id,
    String? name,
    String? slug,
  }) = _EspnLeague;

  factory EspnLeague.fromJson(Map<String, dynamic> json) =>
      _$EspnLeagueFromJson(json);
}

@freezed
abstract class EspnSport with _$EspnSport {
  const factory EspnSport({
    required String id,
    String? name,
    String? slug,
  }) = _EspnSport;

  factory EspnSport.fromJson(Map<String, dynamic> json) =>
      _$EspnSportFromJson(json);
}

@freezed
abstract class EspnVenue with _$EspnVenue {
  const factory EspnVenue({
    required String id,
    String? fullName,
    String? shortName,
    String? address,
    String? city,
    String? state,
    String? zipCode,
    String? country,
  }) = _EspnVenue;

  factory EspnVenue.fromJson(Map<String, dynamic> json) =>
      _$EspnVenueFromJson(json);
}

@freezed
abstract class EspnCompetitionType with _$EspnCompetitionType {
  const factory EspnCompetitionType({
    required String id,
    String? name,
    String? abbreviation,
  }) = _EspnCompetitionType;

  factory EspnCompetitionType.fromJson(Map<String, dynamic> json) =>
      _$EspnCompetitionTypeFromJson(json);
}

@freezed
abstract class EspnLink with _$EspnLink {
  const factory EspnLink({
    String? href,
    String? rel,
    String? text,
  }) = _EspnLink;

  factory EspnLink.fromJson(Map<String, dynamic> json) =>
      _$EspnLinkFromJson(json);
}

@freezed
abstract class EspnSummaryResponse with _$EspnSummaryResponse {
  const factory EspnSummaryResponse({
    EspnArticle? article,
    @Default([]) List<EspnCommentaryItem> commentary,
  }) = _EspnSummaryResponse;

  factory EspnSummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$EspnSummaryResponseFromJson(json);
}

@freezed
abstract class EspnArticle with _$EspnArticle {
  const factory EspnArticle({
    @Default([]) List<EspnCommentaryItem> commentary,
    @Default([]) List<EspnCommentaryItem> items,
  }) = _EspnArticle;

  factory EspnArticle.fromJson(Map<String, dynamic> json) =>
      _$EspnArticleFromJson(json);
}

@freezed
abstract class EspnCommentaryItem with _$EspnCommentaryItem {
  const factory EspnCommentaryItem({
    String? id,
    String? playId,
    int? sequence,
    String? text,
    String? shortText,
    String? headline,
    String? description,
    int? minute,
    EspnTime? time,
    @Default(false) bool scoringPlay,
    String? scoreValue,
    String? type,
    String? typeText,
    String? timestamp,
    String? date,
    String? created,
  }) = _EspnCommentaryItem;

  factory EspnCommentaryItem.fromJson(Map<String, dynamic> json) =>
      _$EspnCommentaryItemFromJson(json);
}

@freezed
abstract class EspnTime with _$EspnTime {
  const factory EspnTime({
    String? displayValue,
    String? value,
    String? clock,
    String? date,
  }) = _EspnTime;

  factory EspnTime.fromJson(Map<String, dynamic> json) =>
      _$EspnTimeFromJson(json);
}
