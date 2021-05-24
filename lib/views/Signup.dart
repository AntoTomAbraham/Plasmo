import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plasmacovid_app/views/Home.dart';
import 'package:plasmacovid_app/views/Signin.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff4a4da1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 32.0),
            child: Container(
              alignment: new FractionalOffset(0.0, 0.1),
              child: Text("Signup",
                  style: GoogleFonts.poppins(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  )),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      hintText: 'Enter your email',
                      labelText: 'Email',
                      hintStyle: TextStyle(color: Colors.yellow),
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                    onChanged: (val) {
                      setState(() {
                        email = val;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(
                        Icons.keyboard,
                        color: Colors.white,
                      ),
                      hintText: 'Enter your password',
                      labelText: 'Password',
                      hintStyle: TextStyle(color: Colors.yellow),
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                    onChanged: (val) {
                      setState(() {
                        password = val;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 60),
                RaisedButton(
                  hoverColor: Color(0xff4649b8),
                  disabledColor: Color(0xff6a71b8),
                  focusColor: Color(0xff4a4da1),
                  onPressed: () {
                    Get.to(Home());
                  },
                  splashColor: Color(0xff4c4e91),
                  highlightColor: Color(0xff4a4da1),
                  color: Color(0xff4a4da1),
                  shape: StadiumBorder(),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 28.0, top: 8.0, right: 28.0, bottom: 8.0),
                    child: Text(
                      "Sign Up",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Get.to(Signin());
                  },
                  child: Text("Already a customer?Login",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 12,
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
