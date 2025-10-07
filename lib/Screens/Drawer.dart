import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  final VoidCallback onCategoryClick;

  const DrawerWidget({super.key, required this.onCategoryClick});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.green),
            child: Center(
              child: Text(
                "News App",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.category, color: Colors.green),
            title: const Text(
              "Categories",
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.pop(context); // يقفل الـDrawer
              onCategoryClick(); // ينفذ اللي في الـHomeScreen
            },
          ),
        ],
      ),
    );
  }
}
