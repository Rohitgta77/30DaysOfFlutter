import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/constants/colorsConstants.dart';
import 'package:flutter_catalog/helper/dbhelper.dart';
import 'package:flutter_catalog/utils/snapPeNetworks.dart';
import 'package:flutter_catalog/utils/snapPeRoutes.dart';
import 'package:flutter_catalog/utils/snapPeUI.dart';
import 'package:flutter_catalog/utils/snapPeUtil.dart';

import 'otp.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool _isLogin = false;
  //final _fromKey = GlobalKey()

  @override
  void initState() {
    super.initState();
    _checkLogin();
    print(_isLogin);
  }

  _checkLogin() async {
    _isLogin = await SnapPeUtils().checkLogin();
    print("Is Login - $_isLogin");
    if (_isLogin) {
      print("home");
      Navigator.pushNamed(context, SnapPeRoutes.homeRoute);
    }
    // print("Is Login - $_isLogin");
    // setState(() {});
  }

  void insertdata() async {
    Map<String, dynamic> row = {
      DataBaseHelper.cUserName: "Rohit Gupta",
      DataBaseHelper.cUserID: 10
    };
    final id = await DataBaseHelper.instance.insert(row);
    print(id);
  }

  final _mobileController = TextEditingController();

  _btnGetOTP() async {
    var mobile = "91" + _mobileController.text;

    //var signature = await SmsAutoFill().getAppSignature;
    var signature = ""; //test
    print("AppSignature : $signature");

    if (await SnapPeNetworks().requestOTP(mobile, signature)) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Otp(
                    mobileNumber: mobile,
                  )));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Authentication Error.."),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SnapPeUI().AppBarBig(),
      body: Container(
        height: double.infinity,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 120.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SnapPeUI().headingSubheadingText(
                  "Sign In / Sign Up", "Hi there! Nice to see you again."),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 32),
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _mobileController,
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone_android),
                            errorMaxLines: 10,
                            prefix: Text("+91  "),
                            hintText: "Enter Phone Number",
                            labelText: "Phone"),
                        validator: (value) {
                          if (value != null && value.length < 10) {
                            return "Please Enter Valid Phone Number.";
                          }
                        },
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                        style: ButtonStyle(
                            fixedSize:
                                MaterialStateProperty.all(Size(250, 40))),
                        onPressed: () {
                          _btnGetOTP(); //test
                        },
                        child: SnapPeUI().appBarText("Get OTP", 15),
                      ),
                      SizedBox(height: 30),
                      RichText(
                          text: TextSpan(
                        children: [
                          TextSpan(
                              text: "Have an Password ? ",
                              style: TextStyle(color: kLightTextColor)),
                          TextSpan(
                              text: "Sign In",
                              style: TextStyle(color: kLinkTextColor),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(
                                      context, SnapPeRoutes.loginWithPwdRoute);
                                  print("sign In button press.");
                                })
                        ],
                      )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
