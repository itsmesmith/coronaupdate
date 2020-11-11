import 'package:corona/home.dart';

import 'package:flutter/material.dart';

import 'globalhome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  final List<Widget> _children = [HomeScreen(), HomePage()];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
        title: 'Corona Info',
        home: Scaffold(
          body: _children[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), title: Text('Nepal')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.cloud), title: Text('Global'))
            ],
            //backgroundColor: Color(0xFF473F97),
            currentIndex: _currentIndex,
            onTap: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ));
  }
}
