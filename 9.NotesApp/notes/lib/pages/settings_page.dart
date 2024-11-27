import "package:flutter/material.dart";

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text("Dark Mode", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
            Switch(
                value: false,
                onChanged: (bool value) {}
            ),
          ],
        ),
      ),
    );
  }
}
