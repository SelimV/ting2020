import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:front/hacks.dart';
import 'package:http/http.dart' as http;

String testJson = """{
    "hacks": [
        {
            "name": "name1",
            "description": "vaa1"
        },
        {
            "name": "name2",
            "description": "vaa2"
        },
        {
            "name": "name",
            "description": "vaa"
        },
        {
            "name": "name",
            "description": "vaa"
        },
        {
            "name": "name",
            "description": "vaa"
        },
        {
            "name": "name",
            "description": "vaa"
        },
        {
            "name": "name",
            "description": "vaa"
        },
        {
            "name": "name",
            "description": "vaa"
        },
        {
            "name": "name",
            "description": "vaa"
        },
        {
            "name": "name",
            "description": "vaa"
        },
        {
            "name": "name",
            "description": "vaa"
        },
        {
            "name": "name",
            "description": "vaa"
        },
        {
            "name": "name",
            "description": "vaa"
        },
        {
            "name": "name",
            "description": "vaa"
        },
        {
            "name": "name",
            "description": "vaa"
        },
        {
            "name": "name",
            "description": "vaa"
        },
        {
            "name": "name",
            "description": "vaa"
        },
        {
            "name": "name",
            "description": "vaa"
        },
        {
            "name": "name",
            "description": "vaa"
        },
        {
            "name": "name",
            "description": "vaa"
        },
        {
            "name": "name",
            "description": "vaa"
        },
        {
            "name": "name",
            "description": "vaa"
        },
        {
            "name": "name",
            "description": "vaa"
        },
        {
            "name": "name",
            "description": "vaa"
        },
        {
            "name": "name",
            "description": "vaa"
        },
        {
            "name": "name",
            "description": "vaa"
        },
        {
            "name": "name",
            "description": "vaa"
        },
        {
            "name": "name",
            "description": "vaa"
        },
        {
            "name": "name",
            "description": "vaa"
        },
        {
            "name": "name",
            "description": "vaa"
        },
        {
            "name": "name",
            "description": "vaa"
        },
        {
            "name": "name",
            "description": "vaa"
        },
        {
            "name": "name",
            "description": "vaa"
        },
        {
            "name": "name",
            "description": "vaa"
        },
        {
            "name": "name",
            "description": "vaa"
        },
        {
            "name": "name",
            "description": "vaa"
        },
        {
            "name": "name",
            "description": "vaa"
        },
        {
            "name": "name",
            "description": "vaa"
        }
        
    ]
}""";

Future<Hacks> fetchHacks() async {
  final response = await http.post(
    'http://localhost:8000/query',
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode("""{
  hacks(func: anyofterms(name, "test hack name")) {
    name
    description
    img
  }
}"""),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Hacks.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load hacks');
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  Album({this.userId, this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //Future<Hacks> futureHacks;
  /* SearchBar searchBar; */

  @override
  void initState() {
    super.initState();
    //futureHacks = fetchHacks();
    /* searchBar = new SearchBar(
      inBar: false,
      setState: setState,
      onSubmitted: print,
      //buildDefaultAppBar: buildAppBar
    ); */
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LifeHackDB',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('LifeHackDB'),
        ),
        body: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 360,
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Search'),
                      onFieldSubmitted: (String str) {
                        //futureHacks = fetchHacks();
                      },
                    ),
                  ),
                ],
              ),
              Flexible(
                child: Hacks.fromJson(jsonDecode(testJson))
              ),
            ],
          ),
          /*Hacks.fromJson(jsonDecode(testJson))*/
          /*FutureBuilder<Hacks>(
                  future: futureHacks,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return snapshot.data;
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }

                    // By default, show a loading spinner.
                    return CircularProgressIndicator();
                  },
                ),  */
        ),
      ),
    );
  }
}
