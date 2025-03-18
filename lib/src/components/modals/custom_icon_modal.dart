import 'package:flutter/material.dart';

class DSCustomModalWithIcon {
  static void show({
    required BuildContext context,
    required String title,
    required String content,
    required IconData icon,
    Color? iconColor,
    String confirmText = "OK",
    String cancelText = "Cancel",
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    bool barrierDismissible = true,
  }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: Column(
            children: [
              Icon(icon, size: 50, color: iconColor ?? Theme.of(context).primaryColor),
              const SizedBox(height: 10),
              Text(title, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
          content: Text(content, textAlign: TextAlign.center),
          actions: [
            TextButton(
              onPressed: onCancel ?? () => Navigator.pop(context),
              child: Text(cancelText),
            ),
            ElevatedButton(
              onPressed: onConfirm ?? () => Navigator.pop(context),
              child: Text(confirmText),
            ),
          ],
        );
      },
    );
  }
}
