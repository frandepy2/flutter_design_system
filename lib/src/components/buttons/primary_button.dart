import 'package:flutter/material.dart';

class DSPrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const DSPrimaryButton(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
