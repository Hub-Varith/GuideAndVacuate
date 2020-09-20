import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:Vacuate/Services/firebase_api.dart';
import 'package:Vacuate/models/appUser.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class UserAuthProvider with ChangeNotifier {
  Api _api = Api(path: "/users");
  FirebaseAuth _auth;
  User _user;
  UserCredential _result;
  AppUser _appUser;
  Status _status = Status.Uninitialized;

  UserAuthProvider.instance() : _auth = FirebaseAuth.instance {
    _auth.authStateChanges();
  }

  Status get status => _status;
  User get user => _user;
  AppUser get appUser => _appUser;
  UserCredential get result => _result;

  Future<AppUser> _getProfile(String username) async {
    var result = await _api.getDocumentById(username);
    return AppUser.fromJson(result.data());
  }

  Future<bool> saveUserProfileData(
      String userId, String username, String email) async {
    DocumentSnapshot ds = await FirebaseFirestore.instance
        .collection("users")
        .doc(_result.user.uid.toString())
        .get();
    if (ds.exists) {
      return true;
    } else {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(_result.user.uid.toString())
          .set({
        // userId: _user.uid,
        "username": username,
        "email": email,
      });
      return true;
    }
  }

  // Future<bool> addProfile(String username, AppUser data) async {
  //   await _api.addDocumentWithId(username, data.toJson());
  //   return true;
  // }

  // Future<bool> addProfile(String userId, String email, String username) async{
  //   await _api.add
  // }

  Future<String> signIn(String email, String password) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      _result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return "success";
    } catch (error) {
      print("catch err");
      print(error.code);
      _status = Status.Unauthenticated;
      notifyListeners();
      return fireBaseError(error);
    }
  }

  Future<String> signUp(String email, String password) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      _result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print(_result.user.uid);
      // varf = FirebaseFirestore.instance.collection("users").doc().get();
      return "success";
    } catch (e) {
      print(e);
      _status = Status.Unauthenticated;
      notifyListeners();
      return fireBaseError(e);
    }
  }

  Future signOut() async {
    _auth.signOut();
    _status = Status.Unauthenticated;
    _appUser = null;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  Future<void> _onAuthStateChanged(User firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = firebaseUser;
      _status = Status.Authenticated;
      _appUser = await _getProfile(_user.uid);
    }
    notifyListeners();
  }

  String fireBaseError(dynamic error) {
    try {
      switch (error.code) {
        case "ERROR_INVALID_EMAIL":
          return "Your email address appears to be malformed.";
          break;
        case "ERROR_WRONG_PASSWORD":
          return "Your password is wrong. Please try again.";
          break;
        case "ERROR_USER_NOT_FOUND":
          return "User with this email doesn't exist.";
          break;
        case "ERROR_USER_DISABLED":
          return "User with this email has been disabled.";
          break;
        case "ERROR_TOO_MANY_REQUESTS":
          return "Too many requests. Try again later.";
          break;
        case "ERROR_OPERATION_NOT_ALLOWED":
          return "Signing in with Email and Password is not enabled.";
          break;
        case "ERROR_OPERATION_NOT_ALLOWED":
          return "Anonymous accounts are not enabled";
          break;
        case "ERROR_WEAK_PASSWORD":
          return "Your password is too weak, please try with a strong password.";
          break;
        case "ERROR_INVALID_EMAIL":
          return "Your email is invalid.";
          break;
        case "ERROR_EMAIL_ALREADY_IN_USE":
          return "Email is already in use on different account.";
          break;
        case "ERROR_INVALID_CREDENTIAL":
          return "Your email is invalid";
          break;
        default:
          return "An undefined Error happened, please try again later.";
      }
    } catch (e) {
      return "An undefined Error happened, please try again later.";
    }
  }
}
