import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';

class DSCustomTextArea extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final int maxLines;
  final int? maxLength;
  final String? Function(String?)? validator;

  const DSCustomTextArea({
    super.key,
    required this.label,
    this.controller,
    this.maxLines = 5,
    this.maxLength,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.brightness == Brightness.dark ? AppColors.dark() : AppColors.light();

    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      maxLength: maxLength,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: colors.secondaryLight.withOpacity(0.1),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}