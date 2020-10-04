import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PostCell extends StatefulWidget {
  String title = "";
  String body = "";
  String author = "";
  String publishTime = "";
  String tag = "";
  Color tagColor = Colors.white;

  List<PostCell> subcells;

  bool isReply;

  PostCell(String t, String b, String a, String pt, String tg, Color tc, List<PostCell> sc, bool isrep) {
    title = t;
    body = b;
    author = a;
    publishTime = pt;
    tag = tg;
    tagColor = tc;
    subcells = sc;
    isReply = isrep;
  }

  @override
  _PostCellState createState() => _PostCellState(title, body, author, publishTime, tag, tagColor, subcells, isReply);
}

class _PostCellState extends State<PostCell> {
  final int maxInt = 4294967296;

  String title = "";
  String body = "";
  String author = "";
  String publishTime = "";
  String tag = "";
  Color tagColor = Colors.white;

  List<PostCell> subcells;

  bool isReply;

  bool expanded = false;

  _PostCellState(String t, String b, String a, String pt, String tg, Color tc, List<PostCell> sc, bool isrep) {
    title = t;
    body = b;
    author = a;
    publishTime = pt;
    tag = tg;
    tagColor = tc;
    subcells = sc;
    isReply = isrep;
  }

  @override
  Widget build(BuildContext context) {
    return Container (
      child: Column (
        children: [
          Container (
            child: FlatButton (
              onPressed: () {
                setState(() {
                  expanded = !expanded;
                });
              },

              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,

              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 2,
                      style: BorderStyle.solid,
                      color: Colors.grey
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      !isReply ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            title,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                            ),
                          ),

                          Text(
                            publishTime,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16
                            ),
                          ),
                        ]
                      ) : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              " "+author,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16
                              ),
                            ),

                            Text(
                              publishTime,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16
                              ),
                            ),
                          ]
                      ),

                      !isReply && expanded ? Text(
                        " "+author,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16
                        ),
                      ) : Container(),

                      !isReply ? Text(
                        " "+tag+" ",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          backgroundColor: tagColor,
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          color: Colors.white
                        ),
                      ): Container(),

                      Text(
                        body,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: isReply || expanded ? 1000 : 1,
                      )
                    ],
                  ),
                ),
              )
            )
          ),

          expanded ? Container(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
            child: ClipRRect (
              borderRadius: BorderRadius.circular(25),
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                decoration: BoxDecoration (
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                        width: 2,
                        color: Colors.grey
                    )
                ),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,

                  decoration: InputDecoration (
                      border: InputBorder.none,
                      labelText: "Reply"
                  ),
                )
              )
            )
          ): Container(),

          expanded ? Container(
            padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: subcells
            )
          ) : Container()
        ]
      )
    );
  }

}