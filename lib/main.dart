import 'package:Vacuate/Screens/OfficeInformationScreen.dart';
import 'package:Vacuate/Screens/SignupScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'Screens/HomeScreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.kanitTextTheme(),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
      initialRoute: '/',
      routes: {
        // '/': (context) => HomeScreen(),
        '/office_info': (context) => OfficeInformationScreen(),
        //Temporary 
        '/signup_screen': (context) => SignupScreen(),
      }
    );
  }
}

