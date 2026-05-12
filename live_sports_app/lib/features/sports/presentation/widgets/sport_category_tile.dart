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
		final mq = MediaQuery.of(context);
		final tileWidth = (mq.size.width * 0.34).clamp(120.0, 160.0);
		final tilePadding = (mq.size.width * 0.03).clamp(10.0, 16.0);
		final iconGap = (mq.size.height * 0.01).clamp(6.0, 12.0);
		return InkWell(
			onTap: onTap,
			borderRadius: BorderRadius.circular(14),
			child: Ink(
				width: tileWidth,
				padding: EdgeInsets.all(tilePadding),
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
						SizedBox(height: iconGap),
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
