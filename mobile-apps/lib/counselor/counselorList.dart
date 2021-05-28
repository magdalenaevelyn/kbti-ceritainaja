import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kbti_ceritainaja/apiservices.dart';
import 'package:kbti_ceritainaja/counselor/counselorDetail.dart';
import 'package:kbti_ceritainaja/counselor/inputComment.dart';
import 'package:kbti_ceritainaja/models/Counselor.dart';

class CounselorList extends StatefulWidget {
  CounselorList({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CounselorListState createState() => _CounselorListState();
}
class _CounselorListState extends State<CounselorList>{
  var refreshkey = GlobalKey<RefreshIndicatorState>();
  List<Counselor2> listCounselor = new List();

  Future<Null> refreshlist() async {
    await Future.delayed(Duration(seconds: 2)); //wait here for 2 second
    setState(() {
      ApiServices().getCounselor();
    });
  }

  FutureOr onGoBack(dynamic value) {
    // Refresh state
    setState(() {

    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: RefreshIndicator(
        onRefresh: refreshlist,
        child: FutureBuilder<List<dynamic>>(
          future: ApiServices().getCounselor(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError){
              return Center(
                child: Text(
                    "Something wrong with message: ${snapshot.error.toString()}"
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              listCounselor = snapshot.data;

              return ListView.builder(
                itemBuilder: (context, position) {
                  return Card(
                    margin: new EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                    child: Container(
                      child: ListTile(
                        title: Text(listCounselor[position].counselorName),
                        subtitle: Text(listCounselor[position].status),
                        leading: CircleAvatar(
                          radius: 24,
                          backgroundImage: AssetImage("assets/images/boy1.jpg"),
                        ),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CounselorDetail(title: "Counselor Detail",)));
                        },
                      ),
                    ),
                  );
                },
                itemCount: listCounselor.length,
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      // body: RefreshIndicator(
      //   onRefresh: refreshlist,
      //   child: Padding(
      //     padding: EdgeInsets.all(20.0),
      //     child: Column(
      //       children: [
      //         Container(
      //           decoration: BoxDecoration(
      //             color: kPrimaryColor,
      //             border: Border.all(
      //                 color: Theme.of(context).scaffoldBackgroundColor,
      //                 width: 3),
      //           ),
      //           height: 100,
      //           margin: EdgeInsets.only(left: 15, right: 15),
      //           padding: EdgeInsets.all(3),
      //           width: MediaQuery.of(context).size.width,
      //           child: Column(
      //             children: [
      //               Text("Name: ABC"),
      //               Text("Age: 12 y.o"),
      //               Text("Problem: stress"),
      //               Text("Date: 2021-07-05"),
      //               Text("Cousnelor: Ollie Kendal"),
      //             ],
      //           ),
      //         ),
      //         SizedBox(
      //           height: 15,
      //         ),
      //         MaterialButton(
      //           minWidth: MediaQuery.of(context).size.width,
      //           padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      //           color: Colors.lightBlue[200],
      //           shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(25.0)
      //           ),
      //           onPressed: () {
      //
      //           },
      //           child: Text(
      //             "Accept",
      //             textAlign: TextAlign.center,
      //             style: TextStyle(
      //                 color: Colors.white,
      //                 fontWeight: FontWeight.bold
      //             ),
      //           ),
      //         ),
      //         SizedBox(
      //           height: 15,
      //         ),
      //         MaterialButton(
      //           minWidth: MediaQuery.of(context).size.width,
      //           padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      //           color: Colors.red,
      //           shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(25.0)
      //           ),
      //           onPressed: () {
      //
      //           },
      //           child: Text(
      //             "Denied",
      //             textAlign: TextAlign.center,
      //             style: TextStyle(
      //                 color: Colors.white,
      //                 fontWeight: FontWeight.bold
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   )
      // ),
    );
  }
}
