import 'dart:ui';

import 'package:flutter/material.dart';

class DSCustomOverlayLoader extends StatelessWidget {
  final bool isLoading;
  final String? message;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? progressIndicatorColor;
  final double? blurAmount;

  const DSCustomOverlayLoader({
    super.key,
    required this.isLoading,
    this.message,
    this.backgroundColor,
    this.textColor,
    this.blurAmount = 5.0,
    this.progressIndicatorColor
  });

  @override
  Widget build(BuildContext context) {
    if (!isLoading) return SizedBox.shrink();

    return Stack(
      children: [
        // Fondo Difuminado
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: blurAmount!, sigmaY: blurAmount!),
            child: Container(
              color: backgroundColor?.withOpacity(0.6) ?? Colors.black.withOpacity(0.6),
            ),
          ),
        ),
        // Contenido del Loader
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(color: progressIndicatorColor ?? Colors.white),
              const SizedBox(height: 16),
              if (message != null)
                Text(
                  message!,
                  style: TextStyle(
                    color: textColor ?? Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
