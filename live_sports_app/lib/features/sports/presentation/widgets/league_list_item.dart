import 'package:flutter/material.dart';

import '../../domain/entities/league.dart';

class LeagueListItem extends StatelessWidget {
	const LeagueListItem({required this.league, super.key});

	final League league;

	@override
	Widget build(BuildContext context) {
		return ListTile(
			dense: true,
			contentPadding: const EdgeInsets.symmetric(horizontal: 4),
			leading: CircleAvatar(
				backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
				child: const Icon(Icons.emoji_events_outlined),
			),
			title: Text(league.name),
			subtitle: Text(
				league.country == null ? 'International' : '${league.country} - ${league.type.name}',
			),
			trailing: const Icon(Icons.chevron_right),
		);
	}
}
