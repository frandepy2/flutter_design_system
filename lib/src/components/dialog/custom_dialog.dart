import 'package:flutter/material.dart';

class DSCustomDialog extends StatelessWidget {
  final String title;
  final String message;
  final String buttonText;
  final VoidCallbackAction? onButtonPressed;
  final Widget? icon;
  final Color? iconColor;
  const DSCustomDialog({
    super.key,
    required this.title,
    required this.message,
    this.onButtonPressed,
    required this.buttonText,
    this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      icon: icon,
      iconColor: iconColor,
      actions: [
        TextButton(
          onPressed: () {
            if (onButtonPressed != null) onButtonPressed;
            Navigator.pop(context);
          },
          child: Text(buttonText),
        ),
      ],
    );
  }
}
