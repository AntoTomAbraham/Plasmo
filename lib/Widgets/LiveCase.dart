import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:plasmacovid_app/Service/ManageData.dart';
import 'package:plasmacovid_app/model/FetchModel.dart';
import 'package:plasmacovid_app/model/Tcases.dart';

class LiveCase extends StatefulWidget {
  @override
  _LiveCaseState createState() => _LiveCaseState();
}

class _LiveCaseState extends State<LiveCase> {
  Tcases tcases = Tcases();
  final String url = "https://corona.lmao.ninja/v3/covid-19/all";
  Future<Tcases> getJsonData() async {
    var response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      final convertDataJson = jsonDecode(response.body);
      return Tcases.fromJson(convertDataJson);
    } else {
      throw Exception('Try to Reload');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getJsonData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          //data(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: new FractionalOffset(0.0, 0.9),
              child: Text(
                "Covid Cases",
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Container(
              height: 150,
              child: FutureBuilder(
                  future: getJsonData(),
                  builder: (BuildContext context, Snapshot) {
                    if (Snapshot.hasData) {
                      final covid = Snapshot.data;
                      return ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          sBox(),
                          rouCorner("Affected", "${covid.cases}", Colors.red),
                          sBox(),
                          rouCorner("Death", "${covid.deaths}", Colors.yellow),
                          sBox(),
                          rouCorner(
                              "Recover", "${covid.recovered}", Colors.green),
                        ],
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  }))
        ],
      ),
    );
  }

//3071
  Widget rouCorner(String value, String text, Color colour) {
    return Container(
        width: 140,
        height: 50,
        decoration: BoxDecoration(
            color: colour,
            border: Border.all(
              color: colour,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(value,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                )),
            Text(text,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                )),
          ],
        ));
  }

  Widget sBox() {
    return SizedBox(
      width: 10,
    );
  }

  Widget data() {
    return FutureBuilder(
      future: getJsonData(),
      builder: (BuildContext context, Snapshot) {
        if (Snapshot.hasData) {
          final covid = Snapshot.data;
          return Container(
            height: 100,
            width: 100,
            child: Text("${covid.deaths}"),
          );
        }
      },
    );
  }
}
