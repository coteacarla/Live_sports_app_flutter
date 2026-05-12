import 'package:flutter/material.dart';

import '../view.dart';

/// Thin screen wrapper for navigation. Keeps `SportsView` colocated.
class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) => const SportsView();
}
