import 'package:flutter/material.dart';
import 'package:plasmacovid_app/Widgets/AppBar.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            Appbar(),
          ],
        ),
      ),
    );
  }
}
