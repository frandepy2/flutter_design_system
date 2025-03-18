import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonScreen extends StatelessWidget {
  static const routeName = 'buttons';
  const ButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons'),
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
            DSPrimaryButton(text: 'Primary Button', onPressed: () {}),
            const SizedBox(
              height: 8,
            ),
            DSOutlinedButton(
              text: 'Secondary Button',
              onPressed: () {},
            ),
            const SizedBox(
              height: 8,
            ),
            DSPrimaryButton(
              text: 'Disable Button',
              onPressed: null,
            ),
            const SizedBox(
              height: 16,
            ),
            Text('Diferentes tamanos'),
            const SizedBox(
              height: 8,
            ),
            DSIconButton(
              backgroundColor: Colors.green,
              text: "Add to Cart",
              icon: Icons.shopping_cart,
              onPressed: () {
                print("Added to Cart");
              },
            ),
            const SizedBox(
              height: 8,
            ),
            DSIconButton(
              backgroundColor: Colors.red,
              text: "Eliminar",
              icon: Icons.delete,
              onPressed: () {
                print("Added to Cart");
              },
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.2),
              child: DSPrimaryButton(text: 'Primary Button', onPressed: () {}),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.4),
              child: DSPrimaryButton(text: 'Primary Button', onPressed: () {}),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.6),
              child: DSPrimaryButton(text: 'Button', onPressed: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
