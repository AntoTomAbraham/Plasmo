import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LiveCase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
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
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                sBox(),
                rouCorner("Affected", "67,889,00", Colors.red),
                sBox(),
                rouCorner("Death", "76,000", Colors.yellow),
                sBox(),
                rouCorner("Recover", "54,000,99", Colors.green),
              ],
            ),
          )
        ],
      ),
    );
  }

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
}
