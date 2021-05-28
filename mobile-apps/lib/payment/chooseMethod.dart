import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kbti_ceritainaja/apiservices.dart';
import 'package:kbti_ceritainaja/constant.dart';
import 'package:kbti_ceritainaja/models/Schedule.dart';
import 'package:kbti_ceritainaja/payment/generateCode.dart';

class ChooseMethod extends StatefulWidget {
  ChooseMethod({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ChooseMethodState createState() => _ChooseMethodState();
}
class _ChooseMethodState extends State<ChooseMethod>{
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

  // payment
  final paymentLabel = ['BCA', 'BNI', 'Credit Card / Debit Card', 'Indomaret', 'Virtual Account'];
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: Column(
        children: [
          SizedBox(height: 15,),
          Text(
            "Choose your payment method",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20,),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, position){
                  return ListTile(
                    leading: Radio(
                      activeColor: kPrimaryColor,
                      value: position,
                      groupValue: value,
                      onChanged: (i) => setState(() => value = i),
                    ),
                    title: Text(paymentLabel[position]),
                  );
                },
                separatorBuilder: (context, position){
                  return Divider();
                },
                itemCount: paymentLabel.length
            ),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => GenerateCode(title: "Ceritain Aja",)));
            },
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            color: Colors.lightBlue[200],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)
            ),
            child: Text("Pay", style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          SizedBox(height: 20,),
        ],
      )
    );
  }
}
