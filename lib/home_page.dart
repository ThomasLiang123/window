import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:window/post_cell.dart';
import 'package:window/topic_cell.dart';
import 'package:window/topic_page.dart';
import 'package:firebase_core/firebase_core.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool onTopicPage = false;
  String topicIDpressed = "";

  List<String> topicIDs = [];

  _HomePageState () {
    /*fb.database().ref("topics").once("value").then((snapshot) {
      snapshot.snapshot.forEach((childSnapshot) {
        topicIDs.add(childSnapshot.key);
        print(childSnapshot.key);
      });
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return !onTopicPage ? Column (
      children: [
        TopicCell(
            "Topic 1",
            "0 members",
                () {
              setState(() {
                onTopicPage = true;
                topicIDpressed = "Topic 1";
              });
            }
        )
      ]
    ) : TopicPage(topicIDpressed);
  }

}