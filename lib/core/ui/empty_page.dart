import 'package:flutter/material.dart';

class EmptyPageView extends StatelessWidget {
  const EmptyPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final bool canPop = Navigator.canPop(context);

    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.inbox_rounded,
              size: 64,
              color: theme.colorScheme.primary,
            ),
            SizedBox(height: 16),
            Text(
              'No Data Found',
              style: theme.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              'This page is currently empty. Try refreshing or come back later.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            if (canPop)
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Close'),
              ),
          ],
        ),
      ),
    );
  }
}
