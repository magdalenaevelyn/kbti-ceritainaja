import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kbti_ceritainaja/chats/chatScreen.dart';
import 'package:kbti_ceritainaja/signup.dart';

class WelcomeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "Welcome to Ceritain Aja",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Login with your account",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 15
                      ),
                    )
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/login-icon.png"),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(3.0),
                ),
                new TextFormField(
                  decoration: new InputDecoration(
                    labelText: "Username",
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(29),
                    ),
                    prefixIcon: IconButton(
                      icon: Icon(
                        Icons.person,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(3.0),
                ),
                new TextFormField(
                  decoration: new InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(29),
                    ),
                    prefixIcon: IconButton(
                      icon: Icon(Icons.lock),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(3.0),
                ),
                MaterialButton(
                  minWidth: double.infinity,
                  height: 40,
                  color: Colors.lightBlue[200],
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ChatScreen(title: "Ceritain Aja",)));
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(color: Colors.grey),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_){
                              return SignUp();
                            })
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.lightBlue,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}