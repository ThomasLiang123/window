import 'package:flutter/material.dart';
import 'package:window/create_post_page.dart';
import 'package:window/home_page.dart';
import 'package:window/topic_cell.dart';
import 'package:window/topic_page.dart';
import 'post_cell.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int navIndex = 0;

  List<Center> centers;
  
  @override
  Widget build(BuildContext context) {
    centers = <Center>[
      Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: HomePage()
        )
      ),

      Center(
          child: Container (
            child: CreatePostPage(["Topic 1", "Topic 2"])
          )
      ),

      Center()
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 30
          )
        ),
        backgroundColor: Colors.white,
      ),
      body: centers[navIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Create',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: navIndex,
        onTap: (int index) {
          setState(() {
            navIndex = index;
          });
        },
        unselectedItemColor: Colors.grey[500],
        selectedItemColor: Colors.grey[800],
      ),
    );
  }
}
