import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kbti_ceritainaja/apiservices.dart';
import 'package:kbti_ceritainaja/models/Schedule.dart';
import 'package:kbti_ceritainaja/payment/paymentDetail.dart';

class PaymentList extends StatefulWidget {
  PaymentList({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _PaymentListState createState() => _PaymentListState();
}
class _PaymentListState extends State<PaymentList>{
  var refreshkey = GlobalKey<RefreshIndicatorState>();
  List<Schedule> listSchedule = new List();

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
          future: ApiServices().getSchedule(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError){
              return Center(
                child: Text(
                    "Something wrong with message: ${snapshot.error.toString()}"
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              listSchedule = snapshot.data;

              return ListView.builder(
                itemBuilder: (context, position) {
                  return Card(
                    margin: new EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                    child: Container(
                      child: ListTile(
                        title: Text(listSchedule[position].name + " - " + listSchedule[position].age + " tahun - " + listSchedule[position].date),
                        subtitle: listSchedule[position].isAccept == "0" ? Text("Your counseling isn't over yet") :
                        listSchedule[position].isAccept == "1" ? Text("Pay now!", style: TextStyle(fontWeight: FontWeight.bold),)
                            : Text("You don't need to pay or counseling"),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentDetail(title: "Bill Detail",
                            id: listSchedule[position].idSchedule,)));
                        },
                      ),
                    ),
                  );
                },
                itemCount: listSchedule.length,
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
