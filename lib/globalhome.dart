import 'package:corona/sources/globalsources.dart';
import 'package:flutter/material.dart';
import 'package:corona/widgets/global.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

String url;
List data = [];
var response;
bool isLoading = true;
List<GlobalCases> world = [];
int i;

class _HomePageState extends State<HomePage> {
  Future<List<GlobalCases>> getUsers() async {
    url = "https://nepalcorona.info/api/v1/data/world";
    response = await http.get(url);
    data = json.decode(response.body);
    setState(() {
      world = data.map((json) => GlobalCases.fromJson(json)).toList();
      isLoading = false;
    });

    return world;
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF473F97),
      appBar: AppBar(
        backgroundColor: Color(0xFF473F97),
        title: Text('World Update'),
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                showSearch(context: context, delegate: CountrySearch());
              })
        ],
      ),
      body: Globalinfo(),
    );
  }
}

class CountrySearch extends SearchDelegate<GlobalCases> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            world[i].country,
            style: TextStyle(fontSize: 30.0),
          ),
        ]),
        Container(
          margin: EdgeInsets.all(8.0),
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: [
              Flexible(
                child: Row(
                  children: [
                    _buildStatCard('Total Cases',
                        world[i].totalCases.toString(), Colors.orange),
                    _buildStatCard('Active Cases',
                        world[i].activeCases.toString(), Colors.blue),
                  ],
                ),
              ),
              Flexible(
                child: Row(children: [
                  _buildStatCard(
                      'Deaths', world[i].totalDeaths.toString(), Colors.red),
                  _buildStatCard('Recovered',
                      world[i].totalRecovered.toString(), Colors.green),
                  _buildStatCard('Isolated', world[i].criticalCases.toString(),
                      Colors.purple),
                ]),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final mylist = query.isEmpty
        ? world
        : world
            .where((p) => p.country.toLowerCase().startsWith(query))
            .toList();
    return mylist.isEmpty
        ? Text('No Results Found')
        : ListView.builder(
            itemCount: mylist.length,
            itemBuilder: (context, index) {
              //final GlobalCases listitem = mylist[index];
              return ListTile(
                title:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text(
                    mylist[index].country,
                    style: TextStyle(fontSize: 20.0),
                  ),

                  // Image(
                  //   image: NetworkImage(
                  //     world[index].countryInfo.flag,
                  //   ),
                  //   height: 20.0,
                  // )
                ]),
                onTap: () {
                  i = index;
                  showResults(context);
                },
              );
            },
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
