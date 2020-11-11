import 'package:flutter/material.dart';
import '../globalhome.dart';

class Globalinfo extends StatefulWidget {
  @override
  _GlobalinfoState createState() => _GlobalinfoState();
}

class _GlobalinfoState extends State<Globalinfo> {
  @override
  Widget build(BuildContext context) {
    return isLoading == true
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: ListView.builder(
              itemCount: world.length - 2,
              itemBuilder: (context, index) {
                index = index + 2;
                return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 20),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.indigo),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              world[index].country,
                              style: TextStyle(
                                  fontSize: 40.0, color: Colors.white),
                            ),
                            Image(
                              image: NetworkImage(
                                world[index].countryInfo.flag,
                              ),
                              height: 40.0,
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          height: MediaQuery.of(context).size.height * 0.25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.indigo),
                          child: Column(
                            children: [
                              Flexible(
                                child: Row(
                                  children: [
                                    _buildStatCard(
                                        'Total Cases',
                                        world[index].totalCases.toString(),
                                        Colors.orange),
                                    _buildStatCard(
                                        'Active Cases',
                                        world[index].activeCases.toString(),
                                        Colors.blue),
                                  ],
                                ),
                              ),
                              Flexible(
                                child: Row(children: [
                                  _buildStatCard(
                                      'Deaths',
                                      world[index].totalDeaths.toString(),
                                      Colors.red),
                                  _buildStatCard(
                                      'Recovered',
                                      world[index].totalRecovered.toString(),
                                      Colors.green),
                                  _buildStatCard(
                                      'Isolated',
                                      world[index].criticalCases.toString(),
                                      Colors.purple),
                                ]),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
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
