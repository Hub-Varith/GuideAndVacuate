import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:Vacuate/Custom/page_title.dart';
import 'package:Vacuate/constants.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Vacuate/Services/UserAuthProvider.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String _userEmail = ''.trim();
  String _userPassword = ''.trim();
  bool _autoValidate = false;

  String validatePassword(String value) {
    if (value.isEmpty)
      return "Password can't be empty";
    else if (value.length < 8)
      return "Password can't be less than 8 chars";
    else
      return null;
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (value.isEmpty)
      return "Email can't be empty";
    else if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var userAuth = Provider.of<UserAuthProvider>(context);
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
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
                    "Login",
                    style: TextStyle(
                        fontFamily: "Kanit",
                        color: neonGreen,
                        fontWeight: FontWeight.bold,
                        fontSize: 35),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Form(
                  key: _formKey,
                  autovalidate: _autoValidate,
                  child: Column(
                    children: [
                      
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 17),
                        child: Row(
                          children: [
                            Flexible(
                              child:
                                  Text("Email:", style: credentialsTitleText),
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(70, 0, 0, 0),
                                child: TextFormField(
                                  onSaved: (value) {
                                    _userEmail = value;
                                  },
                                  validator: validateEmail,
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
                                  style: TextStyle(
                                      color: titleColor, fontSize: 25),
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
                              child: Text("Password:",
                                  style: credentialsTitleText),
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                child: TextFormField(
                                  onSaved: (value) {
                                    _userPassword = value;
                                  },
                                  validator: validatePassword,
                                  obscureText: true,
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
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                      FlatButton(
                        onPressed: () async {
                    final isValid = _formKey.currentState.validate();
                    FocusScope.of(context).unfocus();
                    if (isValid) {
                      _formKey.currentState.save();
                      var result =
                          await userAuth.signIn(_userEmail, _userPassword);
                      if (result == "success") {
                        print("tototot");
                        Navigator.of(context).pushNamed('/home_screen');
                      }
                    }
                  },
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(
                            30,
                            10,
                            30,
                            10,
                          ),
                          child: Text(
                            "Login",
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
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              "Don't have an account?",
                              style: TextStyle(color: titleColor, fontSize: 15),
                            ),
                          ),
                          FlatButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed("/");
                            },
                            child: Text(
                              "Sign Up Here",
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}