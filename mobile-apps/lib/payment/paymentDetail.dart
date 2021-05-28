import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kbti_ceritainaja/apiservices.dart';
import 'package:kbti_ceritainaja/models/Schedule.dart';
import 'package:kbti_ceritainaja/payment/chooseMethod.dart';

class PaymentDetail extends StatefulWidget {
  PaymentDetail({Key key, this.title, this.id}) : super(key: key);
  final String title;
  String id;

  @override
  _PaymentDetailState createState() => _PaymentDetailState();
}
class _PaymentDetailState extends State<PaymentDetail>{
  bool isLoading = false;
  var refreshkey = GlobalKey<RefreshIndicatorState>();
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
                schedule = snapshot.data;

                return Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        "Your Bill",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/receipt.png"),
                          ),
                        ),
                        height: 200,
                        width: 200,
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.0),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(3.0),
                          ),
                          Text("Name         : " + schedule.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                          Text("Age            : " + schedule.age + " years old", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                          Text("Problem    : "  + schedule.problem, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                          Text("Date           : "  + schedule.date, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                          Text("Counselor : "  + schedule.counselor, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                          Text("Fee             : IDR 150.000 ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      MaterialButton(
                        minWidth: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        color: Colors.lightBlue[200],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0)
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ChooseMethod(title: "Payment Method",)));
                        },
                        child: Text(
                          "Pay Now",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
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
