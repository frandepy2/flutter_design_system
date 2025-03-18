import 'package:flutter/material.dart';

class DSCustomSelectableChip extends StatefulWidget {
  final String label;
  final bool isSelected;
  final ValueChanged<bool> onSelected;

  const DSCustomSelectableChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  _DSCustomSelectableChipState createState() => _DSCustomSelectableChipState();
}

class _DSCustomSelectableChipState extends State<DSCustomSelectableChip> {
  bool _selected = false;

  @override
  void initState() {
    super.initState();
    _selected = widget.isSelected;
  }

  void _toggleSelection() {
    setState(() {
      _selected = !_selected;
    });
    widget.onSelected(_selected);
  }

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(widget.label),
      selected: _selected,
      onSelected: (selected) => _toggleSelection(),
      selectedColor: Colors.blue,
      labelStyle: TextStyle(color: _selected ? Colors.white : Colors.black),
    );
  }
}
