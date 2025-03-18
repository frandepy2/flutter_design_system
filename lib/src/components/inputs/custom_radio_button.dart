import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';

class DSCustomRadioButton<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final ValueChanged<T?>? onChanged;
  final String label;
  final Color? activeColor;

  const DSCustomRadioButton({
    super.key,
    required this.value,
    required this.groupValue,
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
        Radio<T>(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          activeColor: activeColor ?? colors.primary,
        ),
        Text(label, style: TextStyle(color: colors.textPrimary)),
      ],
    );
  }
}
