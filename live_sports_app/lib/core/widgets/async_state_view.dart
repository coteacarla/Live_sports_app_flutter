import 'package:flutter/material.dart';

class AsyncStateView extends StatelessWidget {
  const AsyncStateView.loading({super.key, this.message})
      : title = 'Loading',
        onRetry = null,
        icon = Icons.hourglass_top,
        isLoading = true;

  const AsyncStateView.empty({
    required this.title,
    this.message,
    super.key,
  })  : onRetry = null,
        icon = Icons.inbox_outlined,
        isLoading = false;

  const AsyncStateView.error({
    required this.title,
    this.message,
    required this.onRetry,
    super.key,
  })  : icon = Icons.wifi_off_rounded,
        isLoading = false;

  final String title;
  final String? message;
  final VoidCallback? onRetry;
  final IconData icon;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final verticalPadding = (mq.size.height * 0.015).clamp(8.0, 20.0);
    final titleGap = (mq.size.height * 0.01).clamp(6.0, 14.0);
    final actionGap = (mq.size.height * 0.012).clamp(8.0, 16.0);
    final iconSize = (mq.size.width * 0.07).clamp(24.0, 36.0);

    if (isLoading) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: verticalPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
            SizedBox(height: titleGap),
            Text(message ?? 'Please wait...'),
          ],
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding,
        horizontal: (mq.size.width * 0.02).clamp(8.0, 16.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: iconSize),
          SizedBox(height: titleGap),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          if (message != null) ...[
            SizedBox(height: (titleGap * 0.6).clamp(4.0, 10.0)),
            Text(
              message!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
          if (onRetry != null) ...[
            SizedBox(height: actionGap),
            FilledButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ],
      ),
    );
  }
}
