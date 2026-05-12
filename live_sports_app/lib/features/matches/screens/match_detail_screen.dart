import 'package:flutter/material.dart';

import '../domain/entities/match.dart' as ent;
import '../view.dart';

class MatchDetailScreen extends StatelessWidget {
  const MatchDetailScreen({required this.matchId, this.match, super.key});

  final String matchId;
  final ent.Match? match;

  @override
  Widget build(BuildContext context) => MatchDetailView(matchId: matchId, initialMatch: match);
}
