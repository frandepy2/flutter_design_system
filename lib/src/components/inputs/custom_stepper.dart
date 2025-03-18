import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';

class DSCustomStepper extends StatelessWidget {
  final int value;
  final int min;
  final int max;
  final ValueChanged<int> onChanged;

  const DSCustomStepper({
    super.key,
    required this.value,
    required this.onChanged,
    this.min = 0,
    this.max = 100,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.brightness == Brightness.dark ? AppColors.dark() : AppColors.light();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.remove, color: colors.textPrimary),
          onPressed: value > min ? () => onChanged(value - 1) : null,
        ),
        Text(value.toString(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: colors.textPrimary)),
        IconButton(
          icon: Icon(Icons.add, color: colors.textPrimary),
          onPressed: value < max ? () => onChanged(value + 1) : null,
        ),
      ],
    );
  }
}
