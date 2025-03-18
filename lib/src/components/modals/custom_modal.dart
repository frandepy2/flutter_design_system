import 'package:flutter/material.dart';

class DSCustomModal {
  static void show({
    required BuildContext context,
    required String title,
    required String content,
    String confirmText = "OK",
    String cancelText = "Cancel",
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    bool barrierDismissible = true,
    Color? backgroundColor,
  }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return AlertDialog(
          backgroundColor: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: Text(title, style: Theme.of(context).textTheme.bodyLarge),
          content: Text(content, style: Theme.of(context).textTheme.bodyMedium),
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
