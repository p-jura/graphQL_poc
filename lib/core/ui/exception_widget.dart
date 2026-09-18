import 'package:flutter/material.dart';
import 'package:flutter_graphql_poc/app/config.dart';

class ExceptionWidget extends StatelessWidget {
  const ExceptionWidget({super.key, required this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: Config.generalPageHorizontalPadding,
      padding: Config.generalPageHorizontalPadding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: theme.colorScheme.surfaceContainerHighest,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,

        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Exception', style: theme.textTheme.titleMedium),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              message ?? 'Unknown error.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }
}
