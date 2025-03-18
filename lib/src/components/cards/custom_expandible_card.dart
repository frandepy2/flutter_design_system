import 'package:design_system/src/animations/fade_in_animation.dart';
import 'package:flutter/material.dart';

class DSCustomExpandableCard extends StatefulWidget {
  final String title;
  final String description;
  final Widget expandedContent;

  const DSCustomExpandableCard({
    super.key,
    required this.title,
    required this.description,
    required this.expandedContent,
  });

  @override
  _DSCustomExpandableCardState createState() => _DSCustomExpandableCardState();
}

class _DSCustomExpandableCardState extends State<DSCustomExpandableCard> {
  bool _isExpanded = false;

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DSFadeInAnimation(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            ListTile(
              title: Text(widget.title),
              subtitle: Text(widget.description),
              trailing: Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
              onTap: _toggleExpand,
            ),
            if (_isExpanded) Padding(
              padding: const EdgeInsets.all(12.0),
              child: widget.expandedContent,
            ),
          ],
        ),
      ),
    );
  }
}
