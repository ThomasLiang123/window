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
  List<String> topics;

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

        Container(
          padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: FlatButton (
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