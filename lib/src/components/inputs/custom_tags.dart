import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';

class DSCustomTagInput extends StatefulWidget {
  final List<String> tags;
  final ValueChanged<List<String>> onChanged;
  final String hintText;

  const DSCustomTagInput({
    super.key,
    required this.tags,
    required this.onChanged,
    this.hintText = "Enter tags...",
  });

  @override
  _DSCustomTagInputState createState() => _DSCustomTagInputState();
}

class _DSCustomTagInputState extends State<DSCustomTagInput> {
  final TextEditingController _controller = TextEditingController();

  void _addTag(String tag) {
    if (tag.isNotEmpty && !widget.tags.contains(tag)) {
      setState(() {
        widget.tags.add(tag);
      });
      widget.onChanged(widget.tags);
      _controller.clear();
    }
  }

  void _removeTag(String tag) {
    setState(() {
      widget.tags.remove(tag);
    });
    widget.onChanged(widget.tags);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.brightness == Brightness.dark ? AppColors.dark() : AppColors.light();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _controller,
          onSubmitted: _addTag,
          decoration: InputDecoration(
            labelText: widget.hintText,
            border: OutlineInputBorder(),
          ),
        ),
        Wrap(
          spacing: 8.0,
          children: widget.tags.map((tag) {
            return Chip(
              label: Text(tag),
              backgroundColor: colors.primary,
              deleteIcon: Icon(Icons.close, color: Colors.white),
              onDeleted: () => _removeTag(tag),
            );
          }).toList(),
        ),
      ],
    );
  }
}
