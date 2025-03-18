import 'package:flutter/material.dart';

class DSCustomInteractiveCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onLike;
  final VoidCallback onShare;

  const DSCustomInteractiveCard({
    super.key,
    required this.title,
    required this.description,
    required this.onLike,
    required this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 5),
            Text(description, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.favorite_border, color: Colors.red),
                  onPressed: onLike,
                ),
                IconButton(
                  icon: Icon(Icons.share, color: Colors.blue),
                  onPressed: onShare,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
