import 'dart:convert';
import 'package:corona/widgets/nepal.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

var data;
var lstCountry;
var news;
bool leading = true;

class _HomeScreenState extends State<HomeScreen> {
  //Nepal Information
  Future letsupdate() async {
    String url = "https://nepalcorona.info/api/v1/data/nepal";
    var response = await http.get(url);
    var jsonData = json.decode(response.body);
    setState(() {
      data = jsonData;
      leading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    leading = true;
    letsupdate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF473F97),
        appBar: AppBar(
          backgroundColor: Color(0xFF473F97),
          title: Text(
            'Corona Update',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ListView(
          children: [
            Column(children: [
              Image(
                image: AssetImage('assets/images/covid_infographic.jpg'),
                height: 200.0,
                width: 500.0,
                fit: BoxFit.fill,
              ),
              nepalinfo(),
            ]),
          ],
        ));
  }
}
