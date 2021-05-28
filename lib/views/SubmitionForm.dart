import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plasmacovid_app/Widgets/BottomAppbar.dart';
import 'package:plasmacovid_app/Widgets/subAppbar.dart';

import 'Home.dart';

class SubmitionForm extends StatefulWidget {
  @override
  _SubmitionFormState createState() => _SubmitionFormState();
}

class _SubmitionFormState extends State<SubmitionForm> {
  final db = FirebaseFirestore.instance;
  final _formKey = GlobalKey<FormState>();
  String name;
  String email;
  String aadharno;
  String phoneNumber;
  String bloodGroup;
  String place;
  var _bloodgroup = [
    "A+ve",
    "A-ve",
    "B+ve",
    "B-ve",
    "O+ve",
    "O-ve",
    "AB+ve",
    "AB-ve",
  ];
  var _states = [
    "Kerala",
    "Tamil nadu",
    "Karnataka",
    "Andhra Pradesh",
    "Maharashtra",
    "Gujarat",
    "Punjab",
    "Madhya pradesh",
    "Harayana",
    "Arunachal Pradesh",
    "Mizoram",
    "Assam",
    "Bihar",
    "kashmir",
    "Rajasthan",
    "Delhi",
    "West Bengal",
    "Chattisgarh",
    "Odisha",
    "Jharkand",
    "Goa",
    "Telengana",
    "Utarakand",
    "Tripur",
    "Nagaland",
    "Manipur",
    "Sikkhim",
    "Meghalaya",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppbar(),
      body: ListView(
        children: [
          SubAppbar(),
          textHead(),
          Image.asset("assets/images/wear_mask.png"),
          Form(
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
                      hintText: "What is your name?",
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
                        email = val;
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
                      hintText: "What is your email ?",
                      labelText: "Email",
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
                        phoneNumber = val;
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
                      hintText: "What is your Phone number?",
                      labelText: "Phone Number",
                      fillColor: Colors.white70,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 28.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Enter your Blood Group :             ",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: Colors.grey,
                          )),
                      DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          icon: Icon(Icons.location_history),
                          iconEnabledColor: Color(0xff93b8e6),
                          iconDisabledColor: Color(0xff93b8e6),
                          value: bloodGroup,
                          dropdownColor: Colors.white,
                          isDense: false,
                          onChanged: (String newValue) {
                            setState(() {
                              bloodGroup = newValue;
                            });
                          },
                          items: _bloodgroup.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 28.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Enter your State : ",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: Colors.grey,
                          )),
                      DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          icon: Icon(Icons.location_history),
                          iconEnabledColor: Color(0xff93b8e6),
                          iconDisabledColor: Color(0xff93b8e6),
                          value: place,
                          dropdownColor: Colors.white,
                          isDense: false,
                          onChanged: (String newValue) {
                            setState(() {
                              place = newValue;
                            });
                          },
                          items: _states.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: RaisedButton(
              hoverColor: Color(0xff4649b8),
              disabledColor: Color(0xff6a71b8),
              focusColor: Color(0xff4a4da1),
              onPressed: () {
                db.collection('data').add({
                  'name': name,
                  'location': place,
                  'Blood Group': bloodGroup,
                  'Number': phoneNumber,
                  'Aadhar no': aadharno,
                  'email': email,
                }).whenComplete(() => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Home())));
              },
              splashColor: Color(0xff4c4e91),
              highlightColor: Color(0xff4a4da1),
              color: Color(0xff4a4da1),
              shape: StadiumBorder(),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 18.0, top: 8.0, right: 18.0, bottom: 8.0),
                child: Text(
                  "Submit",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget textHead() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "Are you willing to donate plasma?",
        style: GoogleFonts.poppins(fontSize: 30),
      ),
    );
  }
}
