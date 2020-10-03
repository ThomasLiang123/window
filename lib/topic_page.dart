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

  _TopicPageState (String n) {
    name = n;

    String title = "Title";
    String body = "test test test test test test test test test test test test test test test test";
    String author = "Thomas";
    String publishTime = "4:30";
    String tag = "Test Tag";
    Color tagColor = Colors.blue;

    PostCell subcell = new PostCell(title, "subcell test", author, publishTime, tag, tagColor, []);
    List<PostCell> subcells = [subcell];

    PostCell cell = new PostCell(title, body, author, publishTime, tag, tagColor, subcells);
    posts.add(cell);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
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