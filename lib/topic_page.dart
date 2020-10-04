import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:window/post_cell.dart';

class TopicPage extends StatefulWidget {
  String name = "";

  TopicPage (String n) {
    name = n;
  }

  @override
  _TopicPageState createState() => _TopicPageState(name);
}

class _TopicPageState extends State<TopicPage> {
  String name;

  List<PostCell> posts = new List();
  List<Widget> tags = new List();

  _TopicPageState (String n) {
    name = n;

    var ref = FirebaseDatabase().reference().child("users");

    List<String> postIDs = [];
    ref.child(name).once().then((snapshot) {
      postIDs = snapshot.value("postIDs").toString().split(",");

      for (int i = 0; i<postIDs.length; i++) {
        String title;
        String body;
        String author;
        String publishTime;
        String tag;
        String tagColor;

        ref.child(name).child(postIDs[i]).once().then((snapshot) {
          title = snapshot.value("title").toString();
          body = snapshot.value("body").toString();
          author = snapshot.value("author").toString();
          publishTime = snapshot.value("publishTime").toString();
          tag = snapshot.value("tag").toString();
          tagColor = snapshot.value("color").toString();

          PostCell cell = new PostCell(title, body, author, publishTime, tag, Colors.blue, [], false);
          posts.add(cell);
        });
      }
    });

    ref.child(name).once().then((snapshot) {
      List<String> tagNames = snapshot.value("tags").toString().split(",");

      for (int i = 0; i<tagNames.length; i++) {
        tags.add(Text(
          tagNames[i],
          textAlign: TextAlign.left,
          style: TextStyle(
              backgroundColor: Colors.blue,
              fontWeight: FontWeight.normal,
              fontSize: 16,
              color: Colors.white
          ),
        ),)
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: tags
          ),
        ),

        Container(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: posts
            ),
          )
        )
      ],
    );
  }
}