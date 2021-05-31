import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:plasmacovid_app/model/FetchModel.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class ManageData extends ChangeNotifier {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Future fetchData(String collection) async {
    QuerySnapshot querySnapshot =
        await firebaseFirestore.collection(collection).get();
    return querySnapshot.docs;
  }

  // List countryData;
  // Future<FetchModel> fetchCountryData() async {
  //   http.Response response =
  //       await http.get(Uri.parse("https://corona.lmao.ninja/v2/countries"));
  //   FetchModel fetchModel = FetchModel.fromJson(json.decode(response.body));
  //   return fetchModel;
  //   // setState(() {
  //   //   countryData = json.decode(response.body);
  //   // });
  // }
}
