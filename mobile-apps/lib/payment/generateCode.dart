import 'package:flutter/material.dart';
import 'package:kbti_ceritainaja/payment/paymentStatus.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';

class GenerateCode extends StatefulWidget {
  GenerateCode({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _GenerateCodeState createState() => _GenerateCodeState();
}

class _GenerateCodeState extends State<GenerateCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: Container(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            Container(
              height: MediaQuery.of(context).size.height / 4.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/time.png"),
                ),
              ),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Finish your transaction before time is up",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 15,),
            Container(
              margin: new EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
              decoration: BoxDecoration(
                color: Colors.lightBlue[100],
                border: Border.all(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    width: 5),
              ),
              height: 150,
              // margin: EdgeInsets.only(left: 15, right: 15),
              padding: EdgeInsets.all(8),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children:[
                  Text(
                    "YOU HAVE",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 25
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SlideCountdownClock(
                    duration: Duration(hours: 24),
                    separator: ':',
                    textStyle: TextStyle(
                      fontSize: 36
                    ),
                  ),
                  Text(
                    "Transfer to virtual account number",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "800070818282800 (BCA)",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20
                    ),
                    textAlign: TextAlign.center,
                  ),
                ]
              ),
            ),
            SizedBox(height: 15,),
            Text(
              "Counseling Cost",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15,),
            Text(
              "IDR 150.000",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 20,),
            MaterialButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PaymentStatus()));
              },
              minWidth: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              color: Colors.lightBlue[200],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)
              ),
              child: Text("OK", style: TextStyle(fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ),
    );
  }
}
