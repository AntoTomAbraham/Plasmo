import 'package:flutter/material.dart';
import 'package:plasmacovid_app/Widgets/SubAppbar.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SubAppbar(),
        ],
      ),
    );
  }
}
