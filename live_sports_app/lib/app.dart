import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'features/matches/domain/entities/match.dart' as ent;
import 'features/matches/screens/live_matches_screen.dart';
import 'features/matches/screens/match_detail_screen.dart';
import 'features/matches/screens/results_screen.dart';
import 'features/sports/screens/sports_screen.dart';

class LiveSportsApp extends StatelessWidget {
	const LiveSportsApp({super.key});

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Live Sports Tracker',
			debugShowCheckedModeBanner: false,
			theme: ThemeData(
				colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF005F73)),
				useMaterial3: true,
			),
			home: const _RootShell(),
		);
	}
}

class _RootShell extends ConsumerStatefulWidget {
	const _RootShell();

	@override
	ConsumerState<_RootShell> createState() => _RootShellState();
}

class _RootShellState extends ConsumerState<_RootShell> {
	int _index = 0;

	void _openMatch(ent.Match match) {
		Navigator.of(context).push(
			MaterialPageRoute<void>(
				builder: (_) => MatchDetailScreen(matchId: match.id, match: match),
			),
		);
	}

	List<Widget> get _tabs => <Widget>[
		const SportsScreen(),
		LiveMatchesScreen(onOpenMatch: _openMatch),
		ResultsScreen(onOpenMatch: _openMatch),
	];

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: IndexedStack(index: _index, children: _tabs),
			bottomNavigationBar: NavigationBar(
				selectedIndex: _index,
				onDestinationSelected: (value) => setState(() => _index = value),
				destinations: const [
					NavigationDestination(icon: Icon(Icons.sports_soccer), label: 'Sports'),
					NavigationDestination(icon: Icon(Icons.live_tv), label: 'Live'),
					NavigationDestination(icon: Icon(Icons.timeline), label: 'Results'),
				],
			),
		);
	}
}
