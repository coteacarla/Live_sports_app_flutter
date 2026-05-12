import 'package:flutter/material.dart';

import '../domain/entities/match.dart' as ent;
import '../view.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({required this.onOpenMatch, super.key});

  final ValueChanged<ent.Match> onOpenMatch;

  @override
  Widget build(BuildContext context) => ResultsView(onOpenMatch: onOpenMatch);
}
