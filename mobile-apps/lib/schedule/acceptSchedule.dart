import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:kbti_ceritainaja/apiservices.dart';
import 'package:kbti_ceritainaja/constant.dart';
import 'package:kbti_ceritainaja/models/Schedule.dart';
import 'package:kbti_ceritainaja/schedule/inputschedule.dart';

class AcceptSchedule extends StatefulWidget {
  AcceptSchedule({Key key, this.title, this.id}) : super(key: key);
  final String title;
  String id;

  @override
  _AcceptScheduleState createState() => _AcceptScheduleState();
}
class _AcceptScheduleState extends State<AcceptSchedule>{
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  bool isLoading = false;
  var refreshkey = GlobalKey<RefreshIndicatorState>();
  // List<Schedule> listSchedule = new List();
  Schedule schedule;

  Future<Null> refreshlist() async {
    await Future.delayed(Duration(seconds: 2)); //wait here for 2 second
    setState(() {
      ApiServices().getSchedule();
    });
  }

  FutureOr onGoBack(dynamic value) {
    // Refresh state
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: RefreshIndicator(
          onRefresh: refreshlist,
          child: Center(
            child: FutureBuilder(
              future: ApiServices().getScheduleById(widget.id),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if(snapshot.hasError) {
                  return Center(
                    child: Text(
                        "Something wrong with message: ${snapshot.error.toString()}"
                    ),
                  );
                } else if (snapshot.connectionState == ConnectionState.done) {
                  // listSchedule = snapshot.data;
                  schedule = snapshot.data;

                  // return ListView.builder(
                  //     itemBuilder: (context, position) {
                  //       return Card(
                  //         margin: new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  //         child: Container(
                  //           child: Container(
                  //               decoration: BoxDecoration(
                  //                 color: kPrimaryColor,
                  //                 border: Border.all(
                  //                     color: Theme.of(context).scaffoldBackgroundColor,
                  //                     width: 3),
                  //               ),
                  //             height: 100,
                  //             margin: EdgeInsets.only(left: 15, right: 15),
                  //             padding: EdgeInsets.all(3),
                  //             width: MediaQuery.of(context).size.width,
                  //             child: Column(
                  //               children: [
                  //                 Text("Name: " + schedule.name),
                  //                 Text("Age: " + schedule.age + " y.o"),
                  //                 Text("Problem: "  + schedule.problem),
                  //                 Text("Date: "  + schedule.date),
                  //                 Text("Cousnelor: "  + schedule.counselor),
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //       );
                  //     }
                  // );
                  return Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              border: Border.all(
                                  color: Theme.of(context).scaffoldBackgroundColor,
                                  width: 3),
                            ),
                              height: 100,
                              margin: EdgeInsets.only(left: 15, right: 15),
                              padding: EdgeInsets.all(3),
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: [
                                  Text("Name: " + schedule.name),
                                  Text("Age: " + schedule.age + " y.o"),
                                  Text("Problem: "  + schedule.problem),
                                  Text("Date: "  + schedule.date),
                                  Text("Counselor: "  + schedule.counselor),
                                ],
                              ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          // MaterialButton(
                          //   minWidth: MediaQuery.of(context).size.width,
                          //   padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          //   color: Colors.lightBlue[200],
                          //   shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.circular(25.0)
                          //   ),
                          //   onPressed: () {
                          //
                          //   },
                          //   child: Text(
                          //     "Accept",
                          //     textAlign: TextAlign.center,
                          //     style: TextStyle(
                          //         color: Colors.white,
                          //         fontWeight: FontWeight.bold
                          //     ),
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 15,
                          // ),
                          // MaterialButton(
                          //   minWidth: MediaQuery.of(context).size.width,
                          //   padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          //   color: Colors.red,
                          //   shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.circular(25.0)
                          //   ),
                          //   onPressed: () {
                          //
                          //   },
                          //   child: Text(
                          //     "Denied",
                          //     textAlign: TextAlign.center,
                          //     style: TextStyle(
                          //         color: Colors.white,
                          //         fontWeight: FontWeight.bold
                          //     ),
                          //   ),
                          // ),
                          MaterialButton(
                            minWidth: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            color: Colors.lightBlue[200],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0)
                            ),
                            onPressed: () {
                              return showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Action"),
                                    content: Text("Do you want to accept or deny this schedule?"),
                                    actions: <Widget>[
                                      FlatButton(
                                          onPressed: () async {
                                            // _formState.currentState.save();
                                            setState(() => isLoading = true);
                                            ApiServices().acceptSchedule(schedule.idSchedule, "1").then((isSuccess) {
                                              setState(() => isLoading = false);
                                              if (isSuccess) {
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                              } else {
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                              }
                                            });
                                          },
                                          child: Text("Accept")
                                      ),
                                      FlatButton(
                                          onPressed: () {
                                            // Navigator.pop(context);
                                            // _formState.currentState.save();
                                            setState(() => isLoading = true);
                                            ApiServices().acceptSchedule(schedule.idSchedule, "2").then((isSuccess) {
                                              setState(() => isLoading = false);
                                              if (isSuccess) {
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                              } else {
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                              }
                                            });
                                          },
                                          child: Text("Deny")
                                      )
                                    ],
                                  );
                                },
                              );
                            },
                            child: Text(
                              "Action",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ],
                      ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
      ),
    );
  }
}
