import 'package:flutter/material.dart';

class DSAnimatedButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final IconData? icon;

  const DSAnimatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = Colors.blue,
    this.icon,
  });

  @override
  _DSAnimatedButtonState createState() => _DSAnimatedButtonState();
}

class _DSAnimatedButtonState extends State<DSAnimatedButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onPressed,
      borderRadius: BorderRadius.circular(12),
      splashColor: widget.color.withOpacity(0.4),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: _isPressed ? 12 : 14),
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: _isPressed
              ? []
              : [
                  BoxShadow(color: widget.color.withOpacity(0.3), blurRadius: 8, offset: Offset(0, 4)),
                ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.icon != null) Icon(widget.icon, color: Colors.white, size: 18),
            SizedBox(width: widget.icon != null ? 8 : 0),
            Text(widget.text, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
