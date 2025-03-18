import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class OverlayExample extends StatefulWidget {
  const OverlayExample({super.key});

  @override
  State<OverlayExample> createState() => _OverlayExampleState();
}

class _OverlayExampleState extends State<OverlayExample> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(body: Center(child: Text("Main Content"))),
        DSCustomOverlayLoader(
          isLoading: true,
          progressIndicatorColor: Colors.blue,
        ),
      ],
    );
  }
}
