import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardsExampleScreen extends StatelessWidget {
  const CardsExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards'),
        actions: [
          Switch(
            value: themeProvider.themeMode == ThemeMode.dark,
            onChanged: (value) {
              themeProvider.toggleTheme(value);
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            const SizedBox(height: 8),
            DSCustomCard(
              title: "Flutter Design System",
              content: "A modular UI component system.",
              leading: Icon(Icons.widgets, color: Colors.blue),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            const SizedBox(
              height: 8,
            ),
            DSCustomImageCard(
              imageUrl: "https://picsum.photos/200",
              title: "Beautiful Landscape",
              description: "A scenic view of the mountains.",
              onTap: () {
                print("Card tapped!");
              },
            ),
            const SizedBox(
              height: 8,
            ),
            DSCustomExpandableCard(
              title: "Tap to Expand",
              description: "Click to reveal more details.",
              expandedContent:
                  Text("This is the extra content that appears when expanded."),
            ),
            const SizedBox(
              height: 8,
            ),
            DSCustomInteractiveCard(
              title: "Interactive Card",
              description: "This card allows user interactions.",
              onLike: () {
                print("Liked!");
              },
              onShare: () {
                print("Shared!");
              },
            ),
          ],
        ),
      ),
    );
  }
}
