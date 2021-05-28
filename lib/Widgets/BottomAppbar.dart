import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:plasmacovid_app/views/Dataplasma.dart';
import 'package:plasmacovid_app/views/Home.dart';
import 'package:plasmacovid_app/views/Payment.dart';
import 'package:plasmacovid_app/views/PlasmaData.dart';
import 'package:plasmacovid_app/views/SubmitionForm.dart';

class BottomAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 5.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(
              Icons.home,
              color: Color(0xff93b8e6),
            ),
            onPressed: () {
              Get.to(Home());
            },
          ),
          IconButton(
            icon: Icon(
              Icons.folder,
              color: Color(0xff93b8e6),
            ),
            onPressed: () {
              Get.to(SubmitionForm());
            },
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              color: Color(0xff93b8e6),
            ),
            onPressed: () {
              Get.to(Dataplasma());
            },
          ),
          IconButton(
            icon: FaIcon(
              FontAwesomeIcons.rupeeSign,
              color: Color(0xff93b8e6),
            ),
            onPressed: () {
              Get.to(Payment());
            },
          )
        ],
      ),
    );
  }
}
