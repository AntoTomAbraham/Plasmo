import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plasmacovid_app/Service/ManageData.dart';
import 'package:plasmacovid_app/Widgets/BottomAppbar.dart';
import 'package:plasmacovid_app/Widgets/SubAppbar.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Dataplasma extends StatefulWidget {
  @override
  _DataplasmaState createState() => _DataplasmaState();
}

class _DataplasmaState extends State<Dataplasma> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe3eaff),
      bottomNavigationBar: BottomAppbar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SubAppbar(),
            textHead(),
            data(),
          ],
        ),
      ),
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

  Widget data() {
    return Container(
      height: 500.0,
      //color: Colors.red,
      child: FutureBuilder(
        //future is the particular source from where we get the Data
        future:
            Provider.of<ManageData>(context, listen: false).fetchData('data'),
        //Asyncsnapshot gives us the data when the future is called
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Image.network(
                "https://tse3.mm.bing.net/th?id=OIP.ixrIL01VXJFnaBin_oqH0QHaFj&pid=Api&P=0&w=229&h=173",
              ),
            );
          }
          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: snapshot.data.length,
            //itembuilder needs a build context and a index for compulsory
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 296,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Column(
                    children: [
                      textRich(
                        "name",
                        snapshot.data[index].data()['name'],
                      ),
                      textRich(
                        "email",
                        snapshot.data[index].data()['email'],
                      ),
                      textRich(
                        "Number",
                        snapshot.data[index].data()['Number'],
                      ),
                      textRich(
                        "Blood Group",
                        snapshot.data[index].data()['Blood Group'],
                      ),
                      textRich(
                        "Location",
                        snapshot.data[index].data()['location'],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          rbutton(
                            "Whatsapp",
                            FontAwesomeIcons.whatsapp,
                            Colors.green,
                            snapshot.data[index].data()['Number'],
                          ),
                          rrbutton(
                            "Chat",
                            Icons.chat,
                            Colors.red,
                            snapshot.data[index].data()['Number'],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
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

  void launchWhatsappmessage({@required number, @required message}) async {
    String url = "whatsapp://send?phone=$number&text=$message";
    await canLaunch(url) ? launch(url) : print("Can't open whatsapp");
  }

  Widget rbutton(String term, IconData icon, Color colour, String number) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        hoverColor: colour,
        disabledColor: colour,
        focusColor: colour,
        onPressed: () {
          launchWhatsappmessage(
              number: number, message: "message from plasma donation");
        },
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

  Widget rrbutton(String term, IconData icon, Color colour, String number) {
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
