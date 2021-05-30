import 'package:flutter/material.dart';
import 'package:plasmacovid_app/views/DrawerScreen.dart';
import 'package:plasmacovid_app/views/Home.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DrawerScreen(),
          Home(),
        ],
      ),
    );
  }
}
