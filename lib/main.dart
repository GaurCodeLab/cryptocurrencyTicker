import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'homePage.dart';

const String apikey = 'key=8114dc75f1144d09d2201f6fd20d5186';
void main() async {
  List listof = await getAllData();

  runApp(MyApp(listof));
}

class MyApp extends StatefulWidget {
  List listof;

  MyApp(this.listof);

  @override
  _MyAppState createState() => _MyAppState(listof);
}

class _MyAppState extends State<MyApp> {
  List listof;
  _MyAppState(this.listof);
  @override
  void initState() {
    super.initState();
    getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(listof),
    );
  }
}

Future<List> getAllData() async {
  var apiUrl = 'https://api.nomics.com/v1/currencies/ticker?$apikey';
  var data = await http.get(apiUrl);

  var jsonData = json.decode(data.body);

  return jsonData;
}
