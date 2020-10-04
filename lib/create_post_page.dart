import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:window/post_cell.dart';

class CreatePostPage extends StatefulWidget {
  List<String> topics;

  CreatePostPage (this.topics);

  @override
  _CreatePostPageState createState() => _CreatePostPageState(topics);
}

class _CreatePostPageState extends State<CreatePostPage> {
  String topicChosen;
  String tagChosen;

  String postTitle = "";
  String postBody = "";
  String author = "user1";

  bool flagged = false;

  List<String> topics;
  List<String> tags;

  @override
  void initState() {
    super.initState();

    var ref = FirebaseDatabase().reference().child("users");

    ref.child(author).once().then((snapshot) {
      topics = snapshot.value("topicsFollowed").toString().split(",");
    });
  }

  _CreatePostPageState(this.topics) {
    topicChosen = topics[0];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container (
          padding: EdgeInsets.all(10),
          child: DropdownButton<String>(
            value: topicChosen,
            icon: Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.grey),
            onChanged: (String newValue) {
              setState(() {
                topicChosen = newValue;
              });
            },
            items: topics
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),

        Container (
          padding: EdgeInsets.all(10),
          child: DropdownButton<String>(
            value: tagChosen,
            icon: Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.grey),
            onChanged: (String newValue) {
              setState(() {
                tagChosen = newValue;
              });
            },
            items: tags
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),

        Container(
          padding: EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration (
              border: OutlineInputBorder(),
              labelText: "Title"
            ),
          ),
        ),

        Container(
          padding: EdgeInsets.all(10),
          child: TextField(
            keyboardType: TextInputType.multiline,
            maxLines: null,

            decoration: InputDecoration (
                border: OutlineInputBorder(),
                labelText: "Body"
            ),
          )
        ),

        flagged ? Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "Your post has been flagged. Please refrain from using offensive speech.",
              style: TextStyle(
                color: Colors.red,
                fontSize: 15
              ),
            )
        ) : Container(),

        Container(
          padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: FlatButton (
            onPressed: () {
              FirebaseDatabase().reference().child(topicChosen).child("posts").child(postTitle).update({
                "body": postBody,
                "author": author
              });
            },

            child: ClipRRect (
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                decoration: BoxDecoration (
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: 2,
                    color: Colors.grey
                  )
                ),
                child: Text(
                  "Post"
                )
              )
            )
          )
        )
      ],
    );
  }
}