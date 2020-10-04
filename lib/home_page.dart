import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:window/post_cell.dart';
import 'package:window/topic_cell.dart';
import 'package:window/topic_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool onTopicPage = false;
  String topicIDpressed = "";

  List<String> topicIDs = [];
  List<String> recTopicIDs = [];

  @override
  void initState() {
    super.initState();

    var ref = FirebaseDatabase().reference().child("users");
    
    ref.child("user1").once().then((snapshot) {
      topicIDs = snapshot.value("topicsFollowed").toString().split(",");
      recTopicIDs = snapshot.value("topicsRecommended").toString().split(",");
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> followedTopics = [];

    for (int i = 0; i<topicIDs.length; i++) {
      followedTopics.add(TopicCell(
          topicIDs[i],
              "",
              () {
            setState(() {
              onTopicPage = true;
              topicIDpressed = topicIDs[i];
            });
          }
      ));
    }

    List<Widget> recTopics = [];

    for (int i = 0; i<recTopicIDs.length; i++) {
      recTopics.add(TopicCell(
          recTopicIDs[i],
          "",
              () {
            setState(() {
              onTopicPage = true;
              topicIDpressed = recTopicIDs[i];
            });
          }
      ));
    }

    return !onTopicPage ? Column (
      children: [
        Container (
          padding: EdgeInsets.all(10),
          child: Text(
            "Followed Topics",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
          ),
        ),

        Column(
          children: followedTopics
        ),


        Container (
          padding: EdgeInsets.all(10),
          child: Text(
            "Recommended Topics",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),
          ),
        ),

        Column(
            children: recTopics
        ),
      ]
    ) : TopicPage(topicIDpressed);
  }

}