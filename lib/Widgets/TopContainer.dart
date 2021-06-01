import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plasmacovid_app/Service/Notifications.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class TopContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff4a4da1),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40.0),
          bottomRight: Radius.circular(40.0),
        ),
      ),
      height: MediaQuery.of(context).size.height * .3,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Covid-19",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  alignment: new FractionalOffset(0.0, 0.3),
                  child: Text(
                    "Are you feeling sick ?",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  alignment: new FractionalOffset(0.0, 0.1),
                  child: Text(
                    "if you feel sick with any covid-19 probelm then",
                    style: GoogleFonts.poppins(
                      color: Colors.white54,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Consumer<NotificationService>(
            builder: (context, model, _) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                rbutton(
                  "Call now",
                  Icons.call,
                  Colors.red,
                  () {
                    launch("tel://8547847301")
                        .whenComplete(() => model.imageNotification());
                  },
                ),
                rbutton(
                  "Send SMS",
                  Icons.message,
                  Colors.blue,
                  () {
                    launch("sms:8547847301")
                        .whenComplete(() => model.instantNotification());
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget rbutton(String term, IconData icon, Color colour, Function funn) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        hoverColor: colour,
        disabledColor: colour,
        focusColor: colour,
        onPressed: funn,
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
