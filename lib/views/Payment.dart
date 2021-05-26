import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plasmacovid_app/Widgets/BottomAppbar.dart';
import 'package:plasmacovid_app/Widgets/SubAppbar.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String name;
  String aadharno;
  String amount;
  String number;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppbar(),
      body: ListView(
        children: [
          SubAppbar(),
          textHead(),
          formField(),
        ],
      ),
    );
  }

  Widget textHead() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "Donate to PMs Covid Relief Fund",
        style: GoogleFonts.poppins(fontSize: 30),
      ),
    );
  }

  Widget formField() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (val) {
                setState(() {
                  name = val;
                });
              },
              decoration: new InputDecoration(
                border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Color(0xff4a4da1)),
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                ),
                filled: true,
                hintStyle: new TextStyle(color: Colors.grey[800]),
                hintText: "What is your Name?",
                labelText: "Name",
                fillColor: Colors.white70,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (val) {
                setState(() {
                  aadharno = val;
                });
              },
              decoration: new InputDecoration(
                border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Color(0xff4a4da1)),
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                ),
                filled: true,
                hintStyle: new TextStyle(color: Colors.grey[800]),
                hintText: "What is your Aadhar No?",
                labelText: "Aadharno",
                fillColor: Colors.white70,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (val) {
                setState(() {
                  number = val;
                });
              },
              decoration: new InputDecoration(
                border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Color(0xff4a4da1)),
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                ),
                filled: true,
                hintStyle: new TextStyle(color: Colors.grey[800]),
                hintText: "Enter your number",
                labelText: "Phone Number",
                fillColor: Colors.white70,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (val) {
                setState(() {
                  amount = val;
                });
              },
              decoration: new InputDecoration(
                border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Color(0xff4a4da1)),
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                ),
                filled: true,
                hintStyle: new TextStyle(color: Colors.grey[800]),
                hintText: "How much amount you are willing to pay",
                labelText: "Amount",
                fillColor: Colors.white70,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
