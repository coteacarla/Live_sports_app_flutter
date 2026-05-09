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
    if (isLoading) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
            const SizedBox(height: 12),
            Text(message ?? 'Please wait...'),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 28),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          if (message != null) ...[
            const SizedBox(height: 6),
            Text(
              message!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
          if (onRetry != null) ...[
            const SizedBox(height: 12),
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
