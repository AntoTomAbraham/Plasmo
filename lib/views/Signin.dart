import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plasmacovid_app/controllers/auth.dart';
import 'package:plasmacovid_app/views/Home.dart';
import 'package:plasmacovid_app/views/Signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
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
              child: Text("Signin",
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
                  onPressed: () async {
                    signin(email, password).whenComplete(() =>
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => Home())));
                    final SharedPreferences sharedPreferences =
                        await SharedPreferences.getInstance();
                    sharedPreferences.setString("email", email);
                  },
                  splashColor: Color(0xff4c4e91),
                  highlightColor: Color(0xff4a4da1),
                  color: Color(0xff4a4da1),
                  shape: StadiumBorder(),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 28.0, top: 8.0, right: 28.0, bottom: 8.0),
                    child: Text(
                      "Sign In",
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
                    Get.to(Signup());
                  },
                  child: Text("Are you new here?Signup",
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
    ;
  }
}
