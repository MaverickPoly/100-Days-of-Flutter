import "package:flutter/material.dart";
import "package:recipe_app/pages/favourites_page.dart";
import "package:recipe_app/pages/recipe_page.dart";
import "package:recipe_app/pages/settings_page.dart";


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  final List<Widget> _pages = [
    const RecipePage(),
    const FavouritesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recipe app"),
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey.shade700,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              DrawerHeader(child: Icon(Icons.fastfood, color: Colors.grey.shade50, size: 90,)),
              const SizedBox(height: 14),
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: ListTile(
                  leading: Icon(Icons.home_filled, color: Colors.grey.shade100,),
                  title: const Text("Home", style: TextStyle(color: Colors.white, fontSize: 16),),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) => const SettingsPage())
                ),
                child: ListTile(
                  leading: Icon(Icons.settings, color: Colors.grey.shade100,),
                  title: const Text("Settings", style: TextStyle(color: Colors.white, fontSize: 16),),
                ),
              ),
              ListTile(
                leading: Icon(Icons.person, color: Colors.grey.shade100,),
                title: const Text("Contact", style: TextStyle(color: Colors.white, fontSize: 16),),
              ),
            ],
          ),
        )
      ),
      body: _pages[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        onTap: (int index) => navigateBottomBar(index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.restaurant), label: "Recipes"),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "Favourites"),
        ],
      ),
    );
  }
}
