import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:plasmacovid_app/Service/Notifications.dart';
import 'package:plasmacovid_app/Widgets/AppBar.dart';
import 'package:plasmacovid_app/Widgets/BottomAppbar.dart';
import 'package:plasmacovid_app/Widgets/LiveCase.dart';
import 'package:plasmacovid_app/Widgets/PreventionContainer.dart';
import 'package:plasmacovid_app/Widgets/TopContainer.dart';
import 'package:plasmacovid_app/views/SubmitionForm.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double xoffset = 0;
  double yoffset = 0;
  double scaleFactor = 1;
  bool isDrawer = false;
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<NotificationService>(context, listen: false).initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      transform: Matrix4.translationValues(xoffset, yoffset, 0)
        ..scale(scaleFactor),
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomAppbar(),
        body: Container(
          child: ListView(
            children: [
              appbar(),
              TopContainer(),
              PreventionContainer(),
              LiveCase(),
            ],
          ),
        ),
      ),
    );
  }

  Widget appbar() {
    return Container(
      height: MediaQuery.of(context).size.height * .1,
      width: MediaQuery.of(context).size.width * 1,
      color: Color(0xff4a4da1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isDrawer
              ? IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      xoffset = 0;
                      yoffset = 0;
                      scaleFactor = 1;
                      isDrawer = false;
                    });
                  },
                )
              : IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      xoffset = 230;
                      yoffset = 150;
                      scaleFactor = 0.6;
                      isDrawer = true;
                    });
                  },
                ),
          IconButton(
            icon: Icon(
              Icons.notification_important,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
