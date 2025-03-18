import 'package:flutter/material.dart';

class DSCustomBottomSheetModal {
  static void show({
    required BuildContext context,
    required Widget child,
    bool barrierDismissible = true,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black54,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          padding: EdgeInsets.all(16),
          child: child,
        );
      },
    );
  }
}
