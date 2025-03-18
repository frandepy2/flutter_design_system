import 'package:flutter/material.dart';

class DSCustomFullScreenModal {
  static void show({
    required BuildContext context,
    required Widget child,
    bool barrierDismissible = true,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      barrierColor: Colors.black54,
      backgroundColor: Colors.transparent,
      isDismissible: barrierDismissible,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 1.0,
          minChildSize: 0.5,
          maxChildSize: 1.0,
          builder: (context, scrollController) {
            return Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: SingleChildScrollView(
                controller: scrollController,
                child: child,
              ),
            );
          },
        );
      },
    );
  }
}
