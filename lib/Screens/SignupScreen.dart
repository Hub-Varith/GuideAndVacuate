import 'package:Vacuate/Widgets/Signup/Signup_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // @override
  // void initState(){
  //   // // TODO: implement initState
  //   // super.initState();
  //   // await Firebase.initializeApp().whenComplete(() {
  //   //   setState(() {});
  //   // });
  // }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _submitSignupForm(
    String email,
    String password,
    String username,
  ) async {
    UserCredential result;
    try {
      result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      var message = "an error occured";
      print(e);

      if (e.message != null) {
        message = e.message;
      }

    //   Scaffold.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text(message),
    //     ),
    //   );
    // } catch (err) {
    //   print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SignUpForm(submitSignupForm: _submitSignupForm);
  }
}
