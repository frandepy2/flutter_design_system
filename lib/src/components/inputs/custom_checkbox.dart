import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';

class DSCustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String label;
  final Color? activeColor;

  const DSCustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    required this.label,
    this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.brightness == Brightness.dark ? AppColors.dark() : AppColors.light();

    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: activeColor ?? colors.primary,
        ),
        Text(label, style: TextStyle(color: colors.textPrimary)),
      ],
    );
  }
}
