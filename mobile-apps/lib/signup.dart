import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kbti_ceritainaja/welcomeScreen.dart';

class SignUp extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, size: 28, color: Colors.black,),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          height: MediaQuery.of(context).size.height - 100,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    "Create an account here",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700]
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
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
                  SizedBox(height: 7,),
                  new TextFormField(
                    decoration: new InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(29),
                      ),
                      prefixIcon: IconButton(
                        icon: Icon(
                          Icons.mail,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 7,),
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
                  SizedBox(height: 7,),
                  new TextFormField(
                    decoration: new InputDecoration(
                      labelText: " Confirm Password",
                      border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(29),
                      ),
                      prefixIcon: IconButton(
                        icon: Icon(Icons.lock),
                      ),
                    ),
                  ),
                  SizedBox(height: 7,),
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 40,
                    color: Colors.lightBlue[200],
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Already have an account? ",
                        style: TextStyle(color: Colors.grey),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_){
                                return WelcomeScreen();
                              })
                          );
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.lightBlue,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}