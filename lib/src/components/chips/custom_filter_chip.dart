import 'package:flutter/material.dart';

class DSCustomFilterChip extends StatefulWidget {
  final String label;
  final bool isSelected;
  final ValueChanged<bool> onSelected;
  final Color selectedColor;

  const DSCustomFilterChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onSelected, required this.selectedColor,
  });

  @override
  _DSCustomFilterChipState createState() => _DSCustomFilterChipState();
}

class _DSCustomFilterChipState extends State<DSCustomFilterChip> {
  bool _selected = false;

  @override
  void initState() {
    super.initState();
    _selected = widget.isSelected;
  }

  void _toggleSelection(bool selected) {
    setState(() {
      _selected = selected;
    });
    widget.onSelected(selected);
  }

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(widget.label),
      selected: _selected,
      onSelected: _toggleSelection,
      selectedColor: widget.selectedColor,
      labelStyle: TextStyle(color: _selected ? Colors.white : Colors.black),
    );
  }
}
