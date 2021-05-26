import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Get.back();
              })
        ],
      ),
    );
  }
}
