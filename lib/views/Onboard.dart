import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:plasmacovid_app/views/Signin.dart';
import 'package:plasmacovid_app/views/Signup.dart';
import 'package:get/get.dart';

class Onboard extends StatelessWidget {
  final pageDecoration = PageDecoration(
    imagePadding: EdgeInsets.only(top: 28),
    bodyTextStyle: GoogleFonts.poppins(fontSize: 30),
    titleTextStyle: GoogleFonts.poppins(fontSize: 18),
  );
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        image: Image.asset("assets/images/doctor.png"),
        title: "I protect you",
        body: "Getting a covid-19 vaccine will help you",
        footer: Text("Clean your hands often"),
        decoration: pageDecoration,
      ),
      PageViewModel(
        image: Image.asset("assets/images/doctormen.png"),
        title: "Social distancing",
        body: "Self isolation is the cure",
        footer: Text("Cover coughs and sneezes"),
        decoration: pageDecoration,
      ),
      PageViewModel(
        image: Image.asset("assets/images/own_test.png"),
        title: "Stay safe",
        body: "Please use hand sanitizer",
        footer: Text("Maintain social distance"),
        decoration: pageDecoration,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffebeff2),
      body: IntroductionScreen(
          globalBackgroundColor: Colors.white,
          pages: getPages(),
          done: RaisedButton(
            hoverColor: Color(0xff4649b8),
            disabledColor: Color(0xff4a4da1),
            focusColor: Color(0xff4a4da1),
            onPressed: () {
              Get.to(Signup());
            },
            splashColor: Color(0xff4c4e91),
            highlightColor: Color(0xff4a4da1),
            color: Color(0xff4a4da1),
            shape: StadiumBorder(),
            child: Text(
              "Sign in",
              style: GoogleFonts.poppins(color: Colors.yellow),
            ),
          ),
          onDone: () {
            Get.to(Signin());
          },
          showNextButton: true,
          next: RaisedButton(
            hoverColor: Color(0xff4649b8),
            disabledColor: Color(0xff4a4da1),
            focusColor: Color(0xff4a4da1),
            splashColor: Color(0xff4c4e91),
            highlightColor: Color(0xff4a4da1),
            color: Color(0xff4a4da1),
            shape: StadiumBorder(),
            child: Text("Next",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                )),
          )),
    );
  }
}
