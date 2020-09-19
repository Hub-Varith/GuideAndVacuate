import 'package:Vacuate/Services/UserAuthProvider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:Vacuate/Custom/page_title.dart';
import 'package:Vacuate/constants.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
class SignUpForm extends StatefulWidget {
  final void Function(String email, String password, String username)
      submitSignupForm;

  SignUpForm({this.submitSignupForm});

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  User _result;

  final _formKey = GlobalKey<FormState>();
  String _userEmail = ''.trim();
  String _username = ''.trim();
  String _userPassword = ''.trim();
  bool _autoValidate = false;
  bool _loading = false;

  String validateUsername(String value) {
    if (value.isEmpty)
      return "Username can't be empty";
    else if (value.length < 4)
      return "Username can't be less than 4 chars";
    else
      return null;
  }

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
                    "Sign up",
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
                      Padding(
                        padding: const EdgeInsets.only(left: 17),
                        child: Row(
                          children: [
                            Flexible(
                              child: Text("Username:",
                                  style: credentialsTitleText),
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                child: TextFormField(
                                  onSaved: (value) {
                                    _username = value;
                                  },
                                  validator:
                                      // if (value.isEmpty || value.length < 4) {
                                      //   return "please enter at least 4 characters";
                                      // }
                                      validateUsername,

                                  // controller: _usernameController,
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
                                  // validator: (value) {
                                  //   if (value.isEmpty || !value.contains('@')) {
                                  //     return "Please enter a valid email address.";
                                  //   }
                                  //   return null;
                                  // },
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
                                  // validator: (value) {
                                  //   if (value.isEmpty || value.length < 7) {
                                  //     return "Password must be at least 7 characters long";
                                  //   }
                                  //   return null;
                                  // },
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
                            setState(() {
                              _loading = true;
                            });
                            // _api.signUp(_userEmail, _userPassword);
                            // widget.submitSignupForm(
                            //   _username.trim(),
                            //   _userEmail.trim(),
                            //   _userPassword.trim(),
                            // );
                            _formKey.currentState.save();
                            var result = await userAuth.signUp(
                                _userEmail, _userPassword);
                            if (result == "success") {
                              await userAuth.saveUserProfileData(userAuth.result.credential.toString(), _username, _userEmail);
                              print("oi");
                              // FirebaseFirestore.instance.collection('users').doc(a)
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
                        // onPressed: () async {
                        //   FocusScope.of(context).unfocus();
                        //   var result = await userAuth.signUp(
                        //       _emailController.text, _passwordContrller.text);
                        //   if (result == "success") {
                        //     var appUser = AppUser(
                        //       userEmail: _emailController.text,
                        //       userName: _usernameController.text,
                        //     );
                        //     await userAuth.addProfile(_usernameController.text, appUser);
                        //     print("Sign in Success");
                        //   }
                        // },
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
                            onPressed: () {
                              Navigator.of(context).pushNamed("/login_screen");
                            },
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
