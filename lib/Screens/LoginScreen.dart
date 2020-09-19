import 'package:flutter/material.dart';

import '../Custom/page_title.dart';
import '../constants.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override 
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void navToSignup(){
    print("Nav to Signup");
  }

  void login(){
    // TODO: Implement Login Process
    print("logging in");
  }

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
                    Flexible(
                        child: Text("Email: ", style: standardWhiteTitle)),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                              hintText: 'Enter Email',
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff707070)),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff707070)),
                              )),
                          style: TextStyle(color: titleColor),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              // Password Input
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Container(
                margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Row(
                  children: <Widget>[
                    Flexible(
                        child: Text("Password: ", style: standardWhiteTitle)),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                        child: TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: 'Enter Password',
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff707070)),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff707070)),
                              )),
                          style: TextStyle(color: titleColor),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              // Login Button
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              ButtonTheme(
                height: 50,
                minWidth: 120,
                child: FlatButton(
                  onPressed: this.login,
                  color: purpleColor,
                  textColor: Colors.white,
                  child: Text(
                    "Log in",
                    style: standardWhiteDetail,
                  ),
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
                    Text(
                      "Don't have an account?",
                      style: finePurpleText,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      child: Text("Sign Up", style: fineBlueText),
                      onTap: this.navToSignup,
                    )
                    
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
