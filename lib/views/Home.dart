import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:plasmacovid_app/Widgets/AppBar.dart';
import 'package:plasmacovid_app/Widgets/BottomAppbar.dart';
import 'package:plasmacovid_app/Widgets/LiveCase.dart';
import 'package:plasmacovid_app/Widgets/PreventionContainer.dart';
import 'package:plasmacovid_app/Widgets/TopContainer.dart';
import 'package:plasmacovid_app/views/SubmitionForm.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppbar(),
      body: Container(
        child: ListView(
          children: [
            Appbar(),
            TopContainer(),
            PreventionContainer(),
            LiveCase(),
          ],
        ),
      ),
    );
  }
}
