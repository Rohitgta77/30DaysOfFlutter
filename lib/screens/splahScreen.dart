import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/constants/colorsConstants.dart';
import 'package:flutter_catalog/utils/snapPeRoutes.dart';
import 'package:flutter_catalog/utils/snapPeUI.dart';
import 'package:flutter_catalog/utils/snapPeUtil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLogin = false;

  _checkLogin() async {
    await Future.delayed(Duration(seconds: 1));
    _isLogin = await SnapPeUtils().checkLogin();
    print("Is Login - $_isLogin");
    if (_isLogin) {
      Navigator.pop(context);
      Navigator.pushNamed(context, SnapPeRoutes.homeRoute);
    } else {
      Navigator.pop(context);
      Navigator.pushNamed(context, SnapPeRoutes.loginRoute);
    }
  }

  @override
  void initState() {
    super.initState();
    _checkLogin();
    print(_isLogin);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SnapPeUI().appBarText("SnapPe", 50),
            SnapPeUI().appBarSubText("Your next wow.", 25),
          ],
        ),
      ),
    );
  }
}
