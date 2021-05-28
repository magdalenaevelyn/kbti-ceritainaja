import 'package:flutter/material.dart';
import 'package:kbti_ceritainaja/chats/chatScreen.dart';
import 'package:kbti_ceritainaja/constant.dart';

class PaymentStatus extends StatefulWidget {
  @override
  _PaymentStatusState createState() => _PaymentStatusState();
}

class _PaymentStatusState extends State<PaymentStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("assets/images/success.gif"),
            ),
            Text(
              "Succesfull!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20
              ),
            ),
            SizedBox(height: 30,),
            Text(
              "Your payment was done succesfully",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25
              ),
            ),
            MaterialButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ChatScreen(title: "Ceritain Aja",)));
                },
              padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              color: Colors.lightBlue[200],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)
              ),
              child: Text("Ok"),
            )
          ],
        ),
      ),
    );
  }
}
