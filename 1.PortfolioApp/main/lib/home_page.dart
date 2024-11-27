import "package:flutter/material.dart";
import "package:main/projects_page.dart";
import "package:main/skills_page.dart";
import "package:flutter_local_notifications/flutter_local_notifications.dart";


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    _initializeNotifications();
  }

  void _initializeNotifications() {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  }

  void showNotification() async {
    const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      "channel_id",
      "Channel Name",
      channelDescription: "Description of the channel",
      importance: Importance.high,
      playSound: true,
      icon: '@mipmap/ic_launcher',
      color: Colors.blue,
    );

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    await flutterLocalNotificationsPlugin.show(
      0,
      "Hello!",
      "How are you doing buddy!!",
      notificationDetails,
      payload: "Open from Local Notifications",
    );
  }


  final List<Widget> _pages = [
    const ProjectsPage(),
    const SkillsPage(),
  ];

  void _onMenuSelection(String choiceSelected) {
    switch (choiceSelected) {
      case "Option 1":
        break;
      case "Option 2":
        break;
      case "Option 3":
        break;
      default:
        break;
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
                icon: const Icon(Icons.menu, size: 32),
                onPressed: () => Scaffold.of(context).openDrawer()
            );
          }
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, size: 30,),
            onPressed: showNotification,
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            onSelected: _onMenuSelection,
            itemBuilder: (context) {
              return [
                const PopupMenuItem<String>(
                  value: "Option 1",
                    child: Text("Option 1")),
                const PopupMenuItem<String>(
                  value: "Option 2",
                    child: Text("Option 2")),
                const PopupMenuItem<String>(
                  value: "Option 3",
                    child: Text("Option 3")),
              ];
            },
          )
        ]
      ),
      bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
        selectedIndex: selectedIndex,
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.work_outlined),
              label: "Projects"
          ),
          NavigationDestination(
              icon: Badge(
                label: Text("2"),
                child: Icon(Icons.balance_rounded),
              ),
              label: "Skills")
        ],

      ),
      body: _pages[selectedIndex],
      drawer: const Drawer(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 50.0),
          child: Column(
            children: [
              Text("Maverick", style: TextStyle(fontSize: 30),),
              ListTile(
                leading: Icon(Icons.home_filled),
                title: Text("Home"),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings"),
              )
            ],
          ),
        ),
      )
    );
  }
}
