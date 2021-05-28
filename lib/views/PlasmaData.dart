import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plasmacovid_app/Widgets/BottomAppbar.dart';
import 'package:plasmacovid_app/Widgets/SubAppbar.dart';

class PlasmaData extends StatefulWidget {
  @override
  _PlasmaDataState createState() => _PlasmaDataState();
}

class _PlasmaDataState extends State<PlasmaData> {
  final db = FirebaseFirestore.instance;
  // dataContainer(context, "anto tom abraham", "8547847301", "O+Ve",
  //             "Kerala", "8546 7786 6678"),
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe3eaff),
      bottomNavigationBar: BottomAppbar(),
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        child: Column(
          children: [
            SubAppbar(),
            textHead(),
            StreamBuilder<QuerySnapshot>(
              stream: db.collection('data').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot ds = snapshot.data.docs[index];
                      return Container(
                        child: Text("hai"),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return CircularProgressIndicator();
                } else {
                  return CircularProgressIndicator();
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Widget dataContainer(BuildContext context, String name, String number,
      String bloodgroup, String location, String aadharno) {
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
              textRich("name", name),
              textRich("Number", number),
              textRich("Blood Group", bloodgroup),
              textRich("location", location),
              textRich("Aadhar no", aadharno),
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
