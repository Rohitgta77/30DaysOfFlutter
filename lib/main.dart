import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/constants/colorsConstants.dart';
import 'package:flutter_catalog/screens/Registration.dart';
import 'package:flutter_catalog/screens/demo.dart';
import 'package:flutter_catalog/screens/home.dart';
import 'package:flutter_catalog/screens/login.dart';
import 'package:flutter_catalog/screens/loginWithPwd.dart';
import 'package:flutter_catalog/screens/otp.dart';
import 'package:flutter_catalog/utils/snapPeRoutes.dart';
import 'package:google_fonts/google_fonts.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
          primarySwatch: kPrimaryColor,
          textTheme:
              Theme.of(context).textTheme.apply(bodyColor: kSecondayTextcolor),
          fontFamily: GoogleFonts.lato().fontFamily),
      darkTheme: ThemeData(brightness: Brightness.dark),
      initialRoute: SnapPeRoutes.loginRoute,
      routes: {
        SnapPeRoutes.loginRoute: (context) => LogIn(),
        SnapPeRoutes.homeRoute: (context) => Home(),
        SnapPeRoutes.otpRoute: (context) => Otp(
              mobileNumber: "",
            ),
        SnapPeRoutes.registrationRoute: (context) => Registration(),
        SnapPeRoutes.demo: (context) => Demo(),
        SnapPeRoutes.loginWithPwdRoute: (context) => LogInWithPwd()
      },
    );
  }
}
