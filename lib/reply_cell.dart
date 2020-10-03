import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ReplyCell extends StatefulWidget {
  String replyToID = "";

  ReplyCell(this.replyToID);

  @override
  _ReplyCellState createState() => _ReplyCellState(replyToID);
}

class _ReplyCellState extends State<ReplyCell> {
  bool expanded = false;

  String replyToID = "";

  _ReplyCellState(this.replyToID);

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}