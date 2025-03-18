import 'package:flutter/material.dart';

class DSCustomDrawer extends StatelessWidget {
  final String userName;
  final String userEmail;
  final String profileImage;
  final List<Widget> menuItems;
  final VoidCallback onLogOutPressed;
  final String logoutLabel;
  final Icon logoutIcon;

  const DSCustomDrawer({
    super.key,
    required this.userName,
    required this.userEmail,
    required this.profileImage,
    required this.menuItems, required this.onLogOutPressed, required this.logoutLabel, required this.logoutIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(userName, style: TextStyle(fontWeight: FontWeight.bold)),
            accountEmail: Text(userEmail),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(profileImage),
            ),
          ),
          Expanded(
            child: ListView(
              children: menuItems,
            ),
          ),
          ListTile(
            leading: logoutIcon,
            title: Text(logoutLabel),
            onTap: () {
              onLogOutPressed();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
