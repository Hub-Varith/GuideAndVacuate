import 'package:flutter/material.dart';
import '../Custom/page_title.dart';
import '../constants.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _emailController;
  TextEditingController _usernameController;
  TextEditingController _passwordContrller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              PageTitle(title: "Vacuate"),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(
                  15,
                ),
                child: Text(
                  "Sign up",
                  style: TextStyle(
                      fontFamily: "Kanit",
                      color: neonGreen,
                      fontWeight: FontWeight.bold,
                      fontSize: 35),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 17),
                    child: Row(
                      children: [
                        Flexible(
                          child: Text("Username:", style: credentialsTitleText),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                            child: TextField(
                              controller: _usernameController,
                              decoration: InputDecoration(
                                hintText: "Enter Username",
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF707070),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF707070),
                                  ),
                                ),
                              ),
                              style: TextStyle(color: titleColor, fontSize: 25),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 17),
                    child: Row(
                      children: [
                        Flexible(
                          child: Text("Email:", style: credentialsTitleText),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(70, 0, 0, 0),
                            child: TextField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                hintText: "Enter Email",
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF707070),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF707070),
                                  ),
                                ),
                              ),
                              style: TextStyle(color: titleColor, fontSize: 25),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 17.0),
                    child: Row(
                      children: [
                        Flexible(
                          child: Text("Password:", style: credentialsTitleText),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                            child: TextField(
                              controller: _passwordContrller,
                              decoration: InputDecoration(
                                hintText: "Enter Password",
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF707070),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF707070),
                                  ),
                                ),
                              ),
                              style: TextStyle(
                                color: titleColor,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  FlatButton(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(
                        30,
                        10,
                        30,
                        10,
                      ),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontFamily: "Kanit",
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: purpleColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: null,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          "Already have an account?",
                          style: TextStyle(color: titleColor, fontSize: 15),
                        ),
                      ),
                      FlatButton(
                        onPressed: null,
                        child: Text(
                          "Login here",
                          style: TextStyle(
                            color: neonGreen,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
