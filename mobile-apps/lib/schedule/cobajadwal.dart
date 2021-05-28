import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Schedule> fetchJadwal() async {
  final response = await http.get('http://192.168.100.13/kbti-ceritainaja-backend/api/schedule/getSchedule');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Schedule.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Schedule {
  String idSchedule;
  String name;
  String age;
  String problem;
  String date;
  String counselor;
  String fixSchedule;
  String isAccept;

  Schedule({
    this.idSchedule, this.name, this.age, this.problem, this.date, this.counselor, this.fixSchedule, this.isAccept
  });


  factory Schedule.fromJson(Map<String, dynamic> map) {
    return Schedule(idSchedule: map["idSchedule"], name: map["name"], age: map["age"], problem: map["problem"], date: map["date"],
        counselor: map["counselor"], fixSchedule: map["fixSchedule"], isAccept: map["isAccept"]);
  }
}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<Schedule> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchJadwal();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Schedule>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.name.toString());
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
