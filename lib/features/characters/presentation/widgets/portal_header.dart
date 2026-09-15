import 'package:flutter/material.dart';

class PortalHeader extends StatelessWidget {
  const PortalHeader({
    required this.eyebrow,
    required this.title,
    required this.subtitle,
    super.key,
  });

  final String eyebrow;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          right: -40,
          top: -65,
          child: Container(
            width: 180,
            height: 180,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  colorScheme.inversePrimary.withValues(alpha: .24),
                  colorScheme.inversePrimary.withValues(alpha: 0),
                ],
              ),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 9,
                  height: 9,
                  decoration: BoxDecoration(
                    color: colorScheme.inversePrimary,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: colorScheme.inversePrimary,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 9),
                Text(
                  eyebrow.toUpperCase(),
                  style: textTheme.labelMedium?.copyWith(
                    color: colorScheme.inversePrimary,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.4,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(title, style: textTheme.displaySmall),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
