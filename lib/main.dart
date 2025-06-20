import 'package:flutter/material.dart';
import 'package:thirdp/Pages/Home.dart';
import 'package:thirdp/Pages/about.dart';
import 'package:thirdp/Pages/contact.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    AboutPage(),
    ContactPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Project-3',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.grey,
        actions: [
          IconButton(
            icon: const Icon(Icons.login),
            onPressed: () {
              print("Login Button Clicked");
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              print("Logout Button Clicked");
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(Icons.menu_open, size: 30, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    "Menu",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, size: 30),
              title: const Text(
                "Home",
                style: TextStyle(fontSize: 25),
              ),
              onTap: () {
                setState(() {
                  _currentIndex = 0;
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.info, size: 30),
              title: const Text(
                "About",
                style: TextStyle(fontSize: 25),
              ),
              onTap: () {
                setState(() {
                  _currentIndex = 1;
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.mail, size: 30),
              title: const Text(
                "Contact",
                style: TextStyle(fontSize: 25),
              ),
              onTap: () {
                setState(() {
                  _currentIndex = 2;
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout_rounded, size: 30),
              title: const Text(
                "Logout",
                style: TextStyle(fontSize: 25),
              ),
              onTap: () {
                print("Logout from Drawer");
              },
            ),
          ],
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: "About",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail_outline_rounded),
            label: "Contact",
          ),
        ],
      ),
    );
  }
}
