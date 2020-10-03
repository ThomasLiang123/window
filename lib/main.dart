import 'package:flutter/material.dart';
import 'package:window/create_post_page.dart';
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

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool onTopicPage = false;

  int navIndex = 0;

  List<Center> centers;
  
  @override
  Widget build(BuildContext context) {
    centers = <Center>[
      Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: !onTopicPage ? Column (
              children: [
                TopicCell(
                    "Topic 1",
                    "0 members",
                        () {
                      setState(() {
                        onTopicPage = true;
                      });
                    }
                )
              ]
          ) : TopicPage("Topic 1")
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
