import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plasmacovid_app/Widgets/BottomAppbar.dart';
import 'package:plasmacovid_app/Widgets/SubAppbar.dart';

class PlasmaData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe3eaff),
      bottomNavigationBar: BottomAppbar(),
      body: ListView(
        children: [
          SubAppbar(),
          textHead(),
          dataContainer(context),
          dataContainer(context),
          dataContainer(context),
          dataContainer(context),
          dataContainer(context),
          dataContainer(context),
          dataContainer(context),
        ],
      ),
    );
  }

  Widget dataContainer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 300,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0),
                  blurRadius: 6.0,
                ),
              ],
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(
            children: [
              textRich("name", "anto tom abraham"),
              textRich("Number", "8547847301"),
              textRich("Blood Group", "O+Ve"),
              textRich("location", "Kerala"),
              textRich("Aadhar no", "8546 7786 6678"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  rbutton("Whatsapp", FontAwesomeIcons.whatsapp, Colors.green),
                  rbutton("Chat", Icons.chat, Colors.red),
                ],
              )
            ],
          )),
    );
  }

  Widget textHead() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "Know about plasma donors nearbuy",
        style: GoogleFonts.poppins(fontSize: 30),
      ),
    );
  }

  Widget textRich(String text1, String text2) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(text1, style: GoogleFonts.poppins(fontSize: 20)),
          SizedBox(width: 20, child: Text(":")),
          Text(text2, style: GoogleFonts.poppins(fontSize: 15)),
        ],
      ),
    );
  }

  Widget rbutton(
    String term,
    IconData icon,
    Color colour,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        hoverColor: colour,
        disabledColor: colour,
        focusColor: colour,
        onPressed: () {},
        splashColor: colour,
        highlightColor: colour,
        color: colour,
        shape: StadiumBorder(),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 8.0, top: 8.0, right: 8.0, bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              Text(
                term,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 15,
                  //fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
