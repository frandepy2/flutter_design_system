import 'package:flutter/material.dart';

class DSCustomActionChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  const DSCustomActionChip({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: Text(label),
      avatar: Icon(icon, size: 18),
      onPressed: onPressed,
      backgroundColor: Theme.of(context).primaryColor.withOpacity(0.2),
    );
  }
}
