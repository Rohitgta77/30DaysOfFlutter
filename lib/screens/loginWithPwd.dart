import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:snap_pe_merchant/constants/colorsConstants.dart';
import 'package:snap_pe_merchant/utils/snapPeNetworks.dart';
import 'package:snap_pe_merchant/utils/snapPeRoutes.dart';
import 'package:snap_pe_merchant/utils/snapPeUI.dart';
import 'package:sms_autofill/sms_autofill.dart';

import 'otp.dart';

class LogInWithPwd extends StatefulWidget {
  @override
  _LogInWithPwdState createState() => _LogInWithPwdState();
}

class _LogInWithPwdState extends State<LogInWithPwd> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  _btnLogin() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    if (await SnapPeNetworks().login(email, password)) {
      Navigator.pushNamedAndRemoveUntil(
          context, SnapPeRoutes.homeRoute, (route) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Authentication Error.."),
      ));
    }
  }

  _btnSendOTP() async {
    var signature = await SmsAutoFill().getAppSignature;
    print("AppSignature : $signature");
    final email = _emailController.text;
    if (await SnapPeNetworks().requestOTP(email, signature)) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Otp(
                    mobileNumber: email,
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
      appBar: SnapPeUI().appBarBig(),
      body: Container(
        height: double.infinity,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 120.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SnapPeUI().headingSubheadingText(
                  "Log In", "Hi there! Nice to see you again."),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 32),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          hintText: "Enter Email Id",
                          labelText: "Email Id"),
                    ),
                    TextFormField(
                      controller: _passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.password),
                          hintText: "Enter Password",
                          labelText: "Password"),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(Size(250, 40))),
                      onPressed: () {
                        _btnLogin();
                      },
                      child: Text(
                        "Log In",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 30),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "Forget Password ? ",
                          style: TextStyle(color: kLightTextColor)),
                      TextSpan(
                          text: "Send OTP",
                          style: TextStyle(color: kLinkTextColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              _btnSendOTP();
                            })
                    ])),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
