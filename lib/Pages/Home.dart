import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Home",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, size: 35),
            onPressed: () {
              print("Click Setting button");
            },
          ),
        ],
      ),
        body: const SingleChildScrollView(  // अगर content बड़ा हो तो scroll हो सके
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 35),
                Text(
                  "Welcome to Our App",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Explore the features and information we offer.\nStay updated with the latest news and insights.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "App Highlights",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.explore_outlined,size: 40,),
                  title: Text(
                    'Explore',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Discover new content and features',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.email_outlined,size: 40,),
                  title: Text(
                    'Contact',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Get in touch with us',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        )

    );
  }
}
