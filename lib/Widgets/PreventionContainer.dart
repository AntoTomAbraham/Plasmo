import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PreventionContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: [
            Container(
              alignment: new FractionalOffset(0.0, 0.9),
              child: Text(
                "Prevention",
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                imageprev("assets/images/headache.png", "Headache"),
                imageprev("assets/images/fever.png", "Fever"),
                imageprev("assets/images/caugh.png", " Caugh"),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget imageprev(String image, String text) {
    return Column(
      children: [
        Container(
          height: 150,
          width: 100,
          child: Image.asset(image),
        ),
        Text(
          text,
          style: GoogleFonts.poppins(),
        ),
      ],
    );
  }
}
