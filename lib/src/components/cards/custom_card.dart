import 'package:design_system/src/animations/fade_in_animation.dart';
import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';

class DSCustomCard extends StatelessWidget {
  final String title;
  final String content;
  final Color? backgroundColor;
  final Widget? leading;
  final Widget? trailing;

  const DSCustomCard({
    super.key,
    required this.title,
    required this.content,
    this.backgroundColor,
    this.leading,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.brightness == Brightness.dark ? AppColors.dark() : AppColors.light();

    return DSFadeInAnimation(
      child: Card(
        color: backgroundColor ?? colors.background,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              if (leading != null) leading!,
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: theme.textTheme.bodyMedium),
                    const SizedBox(height: 5),
                    Text(content, style: theme.textTheme.bodySmall),
                  ],
                ),
              ),
              if (trailing != null) trailing!,
            ],
          ),
        ),
      ),
    );
  }
}
