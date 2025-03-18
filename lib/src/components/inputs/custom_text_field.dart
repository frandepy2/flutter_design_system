import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';

class DSCustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool autoFocus;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? fillColor;

  const DSCustomTextField({
    super.key,
    required this.label,
    this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.autoFocus = false,
    this.prefixIcon,
    this.suffixIcon,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.brightness == Brightness.dark ? AppColors.dark() : AppColors.light();

    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      autofocus: autoFocus,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: fillColor ?? colors.secondaryLight.withOpacity(0.1),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
