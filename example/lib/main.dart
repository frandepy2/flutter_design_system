import 'package:example/buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:design_system/design_system.dart';

void main() {
  WidgetsFlutterBinding
      .ensureInitialized();

  final themeProvider = ThemeProvider();

  runApp(
    ChangeNotifierProvider(
      create: (_) => themeProvider,
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(themeProvider.customColors).themeData,
      darkTheme:  AppTheme(themeProvider.customColors).themeData,
      themeMode: themeProvider.themeMode,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isChecked = false;
  bool switchValue = false;
  int selectedRadio = 1;
  double sliderValue = 50;
  String dropdownValue = 'Option 1';

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Design System Demo'),
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
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text("Buttons",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ButtonScreen()),
                    );
                  },
                  child: const Text("Go To Buttons Page"),
                ),
              ],
            ),

            const SizedBox(height: 20),

            const Text("Inputs",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextField(),
            const SizedBox(height: 10),
            TextField(),

            const SizedBox(height: 20),

            const Text("Form Elements",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            DropdownButton<String>(
              value: dropdownValue,
              items: const [
                DropdownMenuItem(value: "Option 1", child: Text("Option 1")),
                DropdownMenuItem(value: "Option 2", child: Text("Option 2")),
                DropdownMenuItem(value: "Option 3", child: Text("Option 3")),
              ],
              onChanged: (value) {
                setState(() {
                  dropdownValue = value!;
                });
              },
            ),
            const SizedBox(height: 10),
            Slider(
              value: sliderValue,
              min: 0,
              max: 100,
              divisions: 10,
              label: sliderValue.round().toString(),
              onChanged: (value) {
                setState(() {
                  sliderValue = value;
                });
              },
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                const Text("Accept terms"),
              ],
            ),
            const SizedBox(height: 10),
            Switch(
              value: switchValue,
              onChanged: (value) {
                setState(() {
                  switchValue = value;
                });
              },
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Radio(
                  value: 1,
                  groupValue: selectedRadio,
                  onChanged: (value) {
                    setState(() {
                      selectedRadio = value!;
                    });
                  },
                ),
                const Text("Option A"),
                const SizedBox(width: 20),
                Radio(
                  value: 2,
                  groupValue: selectedRadio,
                  onChanged: (value) {
                    setState(() {
                      selectedRadio = value!;
                    });
                  },
                ),
                const Text("Option B"),
              ],
            ),

            const SizedBox(height: 20),

            const Text("Cards",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Card(
              color: Theme.of(context).cardColor,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Card Title",
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 5),
                    const Text(
                        "This is an example card with a custom design system."),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("This is a success message!"),
                        backgroundColor: Colors.green,
                      ),
                    );
                  },
                  child: const Text("Show Snackbar"),
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Dialog Title"),
                        content: const Text(
                            "This is a sample dialog with custom styles."),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Close"),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text("Show Dialog"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
