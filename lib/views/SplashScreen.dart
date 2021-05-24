import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plasmacovid_app/views/Onboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String name;
  @override
  void setState(fn) {
    //name = Userpreferance.getUsername("name");
    super.setState(fn);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), () {
      if (name != null) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => Onboard()));
      } else {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => Onboard()));
      }
    });
    return Scaffold(
      backgroundColor: Color(0xffebeff2),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(child: Image.asset("assets/images/Picture3.png")),
        ),
        Text(
          "Take care",
          style: GoogleFonts.poppins(
            fontSize: 40,
          ),
        )
      ]),
    );
  }
}