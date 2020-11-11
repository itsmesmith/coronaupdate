import 'package:flutter/material.dart';

import '../home.dart';

// ignore: camel_case_types
class nepalinfo extends StatefulWidget {
  @override
  _nepalinfoState createState() => _nepalinfoState();
}

// ignore: camel_case_types
class _nepalinfoState extends State<nepalinfo> {
  @override
  Widget build(BuildContext context) {
    return leading == true
        ? Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(4.0, 8, 4, 0),
                  child: Container(
                    margin: EdgeInsets.all(2.0),
                    height: 210.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.indigo),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Nepal',
                              style: TextStyle(
                                  fontSize: 40.0, color: Colors.white),
                            ),
                            Image(
                              image: NetworkImage(
                                'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9b/Flag_of_Nepal.svg/1200px-Flag_of_Nepal.svg.png',
                              ),
                              height: 40.0,
                            )
                          ],
                        ),
                        Flexible(
                          child: Row(
                            children: [
                              _buildStatCard(
                                  'Total Cases',
                                  data['tested_positive'].toString(),
                                  Colors.orange),
                              _buildStatCard(
                                  'Active Cases',
                                  data['tested_positive'].toString(),
                                  Colors.blue),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Row(children: [
                            _buildStatCard('Deaths', data['deaths'].toString(),
                                Colors.red),
                            _buildStatCard('Recovered',
                                data['recovered'].toString(), Colors.green),
                            _buildStatCard('Isolated',
                                data['in_isolation'].toString(), Colors.purple),
                          ]),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
  }

  Expanded _buildStatCard(String title, String count, MaterialColor colour) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              count,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
