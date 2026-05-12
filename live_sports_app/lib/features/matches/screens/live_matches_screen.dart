import 'package:flutter/material.dart';

import '../domain/entities/match.dart' as ent;
import '../view.dart';

class LiveMatchesScreen extends StatelessWidget {
  const LiveMatchesScreen({required this.onOpenMatch, super.key});

  final ValueChanged<ent.Match> onOpenMatch;

  @override
  Widget build(BuildContext context) => LiveMatchesView(onOpenMatch: onOpenMatch);
}
