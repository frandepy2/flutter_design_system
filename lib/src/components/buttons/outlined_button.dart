
import 'package:flutter/material.dart';


class DSOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  const DSOutlinedButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child:  Text(text),
    );
  }
}