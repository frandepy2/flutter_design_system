import 'package:example/buttons.dart';
import 'package:example/cards.dart';
import 'package:example/overlay.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:design_system/design_system.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

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
      darkTheme: AppTheme(themeProvider.customColors).themeData,
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
  double sliderValue = 0;
  List<String> tags = [];
  int quantity = 1;
  String dropdownValue = 'Option 1';
  bool isFlutterSelected = false;
  bool isFilterApplied = false;
  int selectedIndex = 0;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      drawer: DSCustomDrawer(
        onLogOutPressed: () {},
        logoutLabel: 'Salir',
        logoutIcon: Icon(Icons.exit_to_app),
        userName: "John Doe",
        userEmail: "johndoe@example.com",
        profileImage: "https://picsum.photos/200",
        menuItems: [
          ListTile(
              leading: Icon(Icons.home), title: Text("Home"), onTap: () {}),
          ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {}),
          ListTile(
              leading: Icon(Icons.help), title: Text("Help"), onTap: () {}),
        ],
      ),
      bottomNavigationBar: DSCustomBottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: "Alerts"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
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
            Column(
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
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CardsExampleScreen()),
                    );
                  },
                  child: const Text("Go To Cards Page"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OverlayExample()),
                    );
                  },
                  child: const Text("Go To Ovelay Page"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text("Inputs",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            DSCustomTextField(label: 'Nombre'),
            const SizedBox(height: 10),
            DSCustomTextField(label: 'Apellido'),
            const SizedBox(
              height: 8,
            ),
            DSCustomTextField(
              label: "Email",
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Email is required";
                } else if (!RegExp(
                        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                    .hasMatch(value)) {
                  return "Enter a valid email";
                }
                return null;
              },
              prefixIcon: Icon(Icons.email),
            ),
            const SizedBox(height: 20),
            DSCustomTextArea(
              label: "Enter your message",
              maxLines: 5,
              maxLength: 500,
            ),
            const SizedBox(height: 20),
            const Text("Form Elements",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            DSCustomDropdown<String>(
              label: "Select a country",
              items: ["USA", "Canada", "UK", "Germany"],
              selectedItem: "USA",
              itemLabel: (item) => item,
              onChanged: (value) {
                print("Selected: $value");
              },
            ),
            const SizedBox(height: 10),
            DSCustomDatePicker(
              label: "Select Date",
              onDateSelected: (date) {
                print("Selected Date: $date");
              },
            ),
            const SizedBox(height: 10),
            DSCustomSlider(
              value: sliderValue,
              min: 0,
              max: 30,
              divisions: 3,
              onChanged: (newValue) {
                setState(() {
                  sliderValue = newValue;
                });
              },
            ),
            const SizedBox(height: 10),
            DSCustomCheckbox(
              value: isChecked,
              label: "Accept Terms",
              onChanged: (newValue) {
                setState(() {
                  isChecked = newValue!;
                });
              },
            ),
            const SizedBox(height: 10),
            DSCustomSwitch(
              value: switchValue,
              label: "Enable Notifications",
              onChanged: (newValue) {
                setState(() {
                  switchValue = newValue;
                });
              },
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                DSCustomRadioButton<int>(
                  value: 1,
                  groupValue: selectedRadio,
                  label: "Option 1",
                  onChanged: (value) {
                    setState(() {
                      selectedRadio = value!;
                    });
                  },
                ),
                DSCustomRadioButton<int>(
                  value: 2,
                  groupValue: selectedRadio,
                  label: "Option 2",
                  onChanged: (value) {
                    setState(() {
                      selectedRadio = value!;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            DSPrimaryButton(
                text: 'Show Modal',
                onPressed: () {
                  DSCustomModal.show(
                    context: context,
                    title: "Delete Item",
                    content: "Are you sure you want to delete this item?",
                    confirmText: "Delete",
                    cancelText: "Cancel",
                    onConfirm: () {
                      print("Item Deleted");
                    },
                  );
                }),
            const SizedBox(height: 20),
            DSPrimaryButton(
                text: 'Show Modal con Icono',
                onPressed: () {
                  DSCustomModalWithIcon.show(
                    context: context,
                    title: "Success!",
                    content: "Your file has been uploaded successfully.",
                    icon: Icons.check_circle,
                    iconColor: Colors.green,
                    confirmText: "Great!",
                  );
                }),
            const SizedBox(height: 20),
            DSPrimaryButton(
                text: 'Show Modal Full Screen',
                onPressed: () {
                  DSCustomFullScreenModal.show(
                    context: context,
                    child: Column(
                      children: [
                        Text("Edit Profile",
                            style: Theme.of(context).textTheme.bodyLarge),
                        const SizedBox(height: 20),
                        TextField(
                            decoration: InputDecoration(labelText: "Name")),
                        TextField(
                            decoration: InputDecoration(labelText: "Email")),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Save"),
                        ),
                      ],
                    ),
                  );
                }),
            const SizedBox(height: 20),
            DSPrimaryButton(
                text: 'Show BottomSheet',
                onPressed: () {
                  DSCustomBottomSheetModal.show(
                    context: context,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: Icon(Icons.camera_alt),
                          title: Text("Take a Photo"),
                          onTap: () {
                            print("Take a Photo");
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.photo_library),
                          title: Text("Choose from Gallery"),
                          onTap: () {
                            print("Choose from Gallery");
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.cancel),
                          title: Text("Cancel"),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                }),
            const SizedBox(height: 20),
            DSCustomTagInput(
              tags: tags,
              onChanged: (newTags) {
                setState(() {
                  tags = newTags;
                });
              },
            ),
            DSCustomChip(
              label: "Flutter",
              backgroundColor: Colors.blue,
              onTap: () {
                print("Flutter Chip tapped!");
              },
            ),
            DSCustomSelectableChip(
              label: "Flutter",
              isSelected: isFlutterSelected,
              onSelected: (selected) {
                setState(() {
                  isFlutterSelected = selected;
                });
              },
            ),
            DSCustomActionChip(
              label: "Settings",
              icon: Icons.settings,
              onPressed: () {
                print("Settings tapped!");
              },
            ),
            DSCustomFilterChip(
              label: "Show Active",
              selectedColor: Colors.green,
              isSelected: isFilterApplied,
              onSelected: (selected) {
                setState(() {
                  isFilterApplied = selected;
                });
              },
            ),
            DSCustomProgressBar(
              progress: 0.5,
              progressColor: AppColors.dark().primary,
              showPercentage: false,
            ),
            DSCustomStepper(
              value: quantity,
              min: 1,
              max: 10,
              onChanged: (newValue) {
                setState(() {
                  quantity = newValue;
                });
              },
            ),
            DSCustomSearchBar(
              controller: searchController,
              onChanged: (query) {
                print("Searching for: $query");
              },
            ),
            const SizedBox(height: 20),
            const Text("Cards",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            DSPrimaryButton(
                text: 'Show Snackbar',
                onPressed: () {
                  CustomSnackbar.show(context, "This is a custom snackbar!");
                }),
            const SizedBox(
              height: 8,
            ),
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
                      builder: (context) => DSCustomDialog(
                        title: 'TITULO',
                        message: 'Mensaje',
                        buttonText: 'cerrar',
                        icon: Icon(Icons.warning),
                        iconColor: Colors.red,
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
