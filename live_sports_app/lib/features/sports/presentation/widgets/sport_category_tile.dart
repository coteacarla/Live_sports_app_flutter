import 'package:flutter/material.dart';

import '../../domain/entities/sport.dart';

class SportCategoryTile extends StatelessWidget {
	const SportCategoryTile({
		required this.sport,
		required this.isSelected,
		required this.onTap,
		super.key,
	});

	final Sport sport;
	final bool isSelected;
	final VoidCallback onTap;

	@override
	Widget build(BuildContext context) {
		final scheme = Theme.of(context).colorScheme;
		return InkWell(
			onTap: onTap,
			borderRadius: BorderRadius.circular(14),
			child: Ink(
				width: 140,
				padding: const EdgeInsets.all(12),
				decoration: BoxDecoration(
					color: isSelected ? scheme.primaryContainer : scheme.surfaceContainer,
					borderRadius: BorderRadius.circular(14),
					border: Border.all(
						color: isSelected ? scheme.primary : scheme.outlineVariant,
					),
				),
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: [
						Icon(
							Icons.sports,
							color: isSelected ? scheme.primary : scheme.onSurfaceVariant,
						),
						const SizedBox(height: 8),
						Text(
							sport.name,
							maxLines: 1,
							overflow: TextOverflow.ellipsis,
							style: Theme.of(context).textTheme.titleMedium,
						),
					],
				),
			),
		);
	}
}
