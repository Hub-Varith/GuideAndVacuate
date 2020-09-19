import 'package:flutter/material.dart';

import '../Custom/page_title.dart';
import '../constants.dart';



class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Column(
            // Header Top Page
            children: [
              PageTitle(
                title: "Vacuate",
              ),

              // Login Title
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.topLeft,
                child: Text("Login", style: subTextStyle),
              ),
  
              // Email Form
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Container(
                margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Row(
                  children: <Widget>[
                    Flexible(child: Text("Email: ", style: standardWhiteTitle)),
                    Flexible(child: Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                      child: TextField(cursorColor: Colors.white, style: TextStyle(color: Colors.white),),
                    ),)
                  ],
                ),
              ),

              // Password Input
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Container(
                margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Row(
                  children: <Widget>[
                    Flexible(child: Text("Password: ", style: standardWhiteTitle)),
                    Flexible(child: Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                      child: TextField(cursorColor: Colors.white, style: TextStyle(color: Colors.white),),
                    ),)
                  ],
                ),
              ),

              // Login Button
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              ButtonTheme(
                height: 50,
                minWidth: 120,
                              child: FlatButton(
                  onPressed: () { print("GO TO LOGIN"); }, // TODO: Implement LOGIN API
                  color: purpleColor,
                  textColor: Colors.white,
                  child: Text("Log in", style: standardWhiteDetail,),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0), 
                      
                  ),
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Don't have an account?", style: finePurpleText,),
                    SizedBox(width: 5,),
                    Text("Sign Up", style: fineBlueText)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}