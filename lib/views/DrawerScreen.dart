import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plasmacovid_app/views/Body.dart';
import 'package:plasmacovid_app/views/Dataplasma.dart';
import 'package:plasmacovid_app/views/Home.dart';
import 'package:plasmacovid_app/views/Payment.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff4a4da1),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 80,
              ),
              textIconButton("Home", Icons.home, Body()),
              textIconButton("Donate", FontAwesomeIcons.rupeeSign, Body()),
              textIconButton("Search", Icons.search, Body()),
              textIconButton(
                  "Sign out", Icons.follow_the_signs_outlined, Body()),
            ]));
  }

  Widget textIconButton(String text, IconData iconn, dynamic fun) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: ListTile(
        leading: Icon(
          iconn,
          color: Colors.white,
        ),
        title: Text(
          text,
          style: GoogleFonts.poppins(color: Colors.white),
        ),
        onTap: () {
          Get.to(fun);
        },
      ),
    );
  }
}
