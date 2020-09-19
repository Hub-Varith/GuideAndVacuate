import 'package:Vacuate/Widgets/Signup/login_form.dart';
import 'package:flutter/material.dart';

import '../Custom/page_title.dart';


class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  

  @override
  Widget build(BuildContext context) {
    return LoginForm();
  }
  
  
}
