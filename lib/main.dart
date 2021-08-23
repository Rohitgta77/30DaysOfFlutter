import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snap_pe_merchant/constants/colorsConstants.dart';
import 'package:snap_pe_merchant/screens/Registration.dart';
import 'package:snap_pe_merchant/screens/categoryScreen.dart';
import 'package:snap_pe_merchant/screens/home.dart';
import 'package:snap_pe_merchant/screens/login.dart';
import 'package:snap_pe_merchant/screens/loginWithPwd.dart';
import 'package:snap_pe_merchant/screens/splahScreen.dart';
import 'package:snap_pe_merchant/utils/snapPeRoutes.dart';
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
      initialRoute: SnapPeRoutes.splashRoute,
      routes: {
        SnapPeRoutes.loginRoute: (context) => LogIn(),
        SnapPeRoutes.homeRoute: (context) => Home(),
        // SnapPeRoutes.otpRoute: (context) => Otp(mobileNumber: ""),
        SnapPeRoutes.registrationRoute: (context) => Registration(),
        SnapPeRoutes.loginWithPwdRoute: (context) => LogInWithPwd(),
        SnapPeRoutes.splashRoute: (context) => SplashScreen(),
        SnapPeRoutes.categoryRoute: (context) => CategoryScreen()
      },
    );
  }
}
