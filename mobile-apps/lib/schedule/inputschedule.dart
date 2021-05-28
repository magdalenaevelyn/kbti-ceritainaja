import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kbti_ceritainaja/apiservices.dart';
import 'package:kbti_ceritainaja/models/Counselor.dart';
import 'package:kbti_ceritainaja/models/Schedule.dart';
import 'package:http/http.dart' show Client;

class InputSchedule extends StatefulWidget {
  InputSchedule({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _InputScheduleState createState() => _InputScheduleState();
}
class _InputScheduleState extends State<InputSchedule>{
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();

  Schedule schedule = new Schedule();
  bool isLoading = false;

  String counselor;
  List<dynamic> listCounselor = new List();

  Client client = Client();

  void getCounselor() async {
    final response = await client.get("http://192.168.100.13/kbti-ceritainaja-backend/api/counselor/getCounselor");
    var listDataCounselor = jsonDecode(response.body);
    setState(() {
      listCounselor = listDataCounselor;
    });
    // print("data : $listDataCounselor");
  }

  // -------------- date picker ---------------------
  DateTime date = DateTime.now();
  TextEditingController _dateController = TextEditingController();
  // Future<Null> _selectDate(BuildContext context) async {
  //   final DateTime _datePicker = await showDatePicker(
  //       context: context,
  //       initialDate: date,
  //       firstDate: DateTime(2021),
  //       lastDate: DateTime(2022)
  //   );
  //
  //   if(_datePicker != null && _datePicker != DateTime.now()) {
  //     setState(() {
  //       date = _datePicker;
  //       _dateController.text = date.toString().substring(0, 10);
  //       // print(date.toString());
  //     });
  //   }
  // }

  @override
  void initState() {
    super.initState();
    getCounselor();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Form(
                    key: _formState,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              icon: Icon(Icons.person),
                              labelText: "Name",
                              hintText: "Ex: Johny Doe",
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                          ),
                          onSaved: (String value) {
                            this.schedule.name = value;
                          },
                        ),
                        SizedBox(height: 15,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              icon: Icon(Icons.attribution_rounded),
                              labelText: "Age",
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                          ),
                          onSaved: (String value) {
                            this.schedule.age = value;
                          },
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(height: 15,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              icon: Icon(Icons.stay_primary_landscape_rounded),
                              labelText: "Problem",
                              hintText: "describe your problem in a simple way",
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                          ),
                          onSaved: (String value) {
                            this.schedule.problem = value;
                          },
                          maxLines: 5,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              icon: Icon(Icons.date_range),
                              labelText: "Choose date",
                              hintText: date.toString(),
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                          ),
                          // onTap: () {
                          //   setState(() {
                          //     _selectDate(context);
                          //   });
                          // },
                          controller: _dateController,
                          onTap: () async {
                            var date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2021),
                                lastDate: DateTime(2022)
                            );
                            _dateController.text = date.toString().substring(0,10);
                          },
                          onSaved: (String date) {
                            this.schedule.date = date.toString().substring(0,10);
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        // TextButton(
                        //     onPressed: () {
                        //       setState(() {
                        //         _selectDate(context);
                        //       });
                        //     },
                        //     child: Text(
                        //       'Choose Date',
                        //       style: TextStyle(color: Colors.lightBlue[200]),
                        //     ),
                        // ),
                        // Text(
                        //   date.toString(),
                        // ),
                        DropdownButtonFormField(
                          hint: Text("Choose Counselor"),
                          isExpanded: true,
                          value: counselor,
                          items: listCounselor.map((item) {
                            return DropdownMenuItem(
                              child: Text(item['counselorName'] + ' - ' + item['status']),
                              value: item['counselorName'],
                            );
                          }).toList(),
                          onChanged: (value){
                            setState(() {
                              counselor = value;
                            });
                          },
                          onSaved: (value){
                            this.schedule.counselor = counselor;
                          },
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                              enabledBorder: new OutlineInputBorder(
                                  borderSide: new BorderSide(color: Colors.lightBlue[200], width: 2),
                                  borderRadius: BorderRadius.circular(10)
                              )
                          ),
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
                            return showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Create Schedule"),
                                  content: Text("Do you want to create this schedule?"),
                                  actions: <Widget>[
                                    FlatButton(
                                        onPressed: () async {
                                          _formState.currentState.save();
                                          setState(() => isLoading = true);
                                          ApiServices().createSchedule(this.schedule).then((isSuccess) {
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
                                        child: Text("Yes")
                                    ),
                                    FlatButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("No")
                                    )
                                  ],
                                );
                              },
                            );
                          },
                          child: Text(
                            "Create Schedule",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
        )
    );
  }
}