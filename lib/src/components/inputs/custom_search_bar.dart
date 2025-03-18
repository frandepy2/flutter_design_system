import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';

class DSCustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String> onChanged;

  const DSCustomSearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
    this.hintText = "Search...",
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.brightness == Brightness.dark ? AppColors.dark() : AppColors.light();

    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(Icons.search, color: colors.primary),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        filled: true,
        fillColor: colors.secondaryLight.withOpacity(0.1),
      ),
    );
  }
}
