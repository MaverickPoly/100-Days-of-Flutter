import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";


class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        title: const Text("Settings"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search, color: Colors.grey.shade700,))
        ],
      ),
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(CupertinoIcons.person, color: Colors.grey.shade700,),
              title: Text("Account", style: TextStyle(color: Colors.grey.shade700),),
              trailing: Icon(CupertinoIcons.chevron_forward),
              tileColor: Colors.grey.shade200,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: Divider(height: 2, color: Colors.grey.shade700,),
            ),
            ListTile(
              leading: Icon(Icons.notifications, color: Colors.grey.shade700,),
              title: Text("Notifications", style: TextStyle(color: Colors.grey.shade700),),
              trailing: Icon(CupertinoIcons.chevron_forward),
              tileColor: Colors.grey.shade200,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: Divider(height: 2, color: Colors.grey.shade700,),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.eye, color: Colors.grey.shade700),
              title: Text("Appearance", style: TextStyle(color: Colors.grey.shade700),),
              trailing: Icon(CupertinoIcons.chevron_forward),
              tileColor: Colors.grey.shade200,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: Divider(height: 2, color: Colors.grey.shade700,),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.lock, color: Colors.grey.shade700,),
              title: Text("Privacy", style: TextStyle(color: Colors.grey.shade700),),
              trailing: Icon(CupertinoIcons.chevron_forward),
              tileColor: Colors.grey.shade200,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: Divider(height: 2, color: Colors.grey.shade700,),
            ),
          ],
        ),
      ),);
  }
}
