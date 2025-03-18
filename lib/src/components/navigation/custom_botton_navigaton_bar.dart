import 'package:flutter/material.dart';

class DSCustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<BottomNavigationBarItem> items;
  final Color? backgroundColor;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final double? elevation;

  const DSCustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
    this.backgroundColor,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.elevation = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.background,
      selectedItemColor: selectedItemColor ?? Theme.of(context).colorScheme.primary,
      unselectedItemColor: unselectedItemColor ?? Colors.grey,
      elevation: elevation!,
      items: items,
      type: BottomNavigationBarType.fixed,
    );
  }
}
