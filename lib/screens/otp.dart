import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:snap_pe_merchant/constants/colorsConstants.dart';
import 'package:snap_pe_merchant/utils/snapPeNetworks.dart';
import 'package:snap_pe_merchant/utils/snapPeRoutes.dart';
import 'package:snap_pe_merchant/utils/snapPeUI.dart';
import 'package:sms_autofill/sms_autofill.dart';

class Otp extends StatefulWidget {
  final mobileNumber;
  const Otp({Key? key, required this.mobileNumber}) : super(key: key);

  @override
  _OtpState createState() => _OtpState(mobileNumber);
}

class _OtpState extends State<Otp> with CodeAutoFill {
  String? appSignature;
  String? otpCode;
  String mobile = "";

  _OtpState(mobileNumber) {
    this.mobile = mobileNumber;
  }

  _btnResendOTP() async {
    var signature = await SmsAutoFill().getAppSignature;
    print("AppSignature : $signature");

    if (await SnapPeNetworks().requestOTP(mobile, signature)) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Successfully Resend OTP."),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Authentication Error.."),
      ));
    }
  }

  @override
  void codeUpdated() {
    setState(() {
      otpCode = code!;
    });
  }

  @override
  void initState() {
    super.initState();
    listenForCode();

    SmsAutoFill().getAppSignature.then((signature) {
      setState(() {
        appSignature = signature;
        print(appSignature);
      });
    });
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    super.dispose();
    cancel();
  }

  final _codeController = TextEditingController();
  _continueBtn() async {
    var otp = _codeController.text;
    print(otp);
    bool result = await SnapPeNetworks().verifyOTP(mobile, otp);
    if (result) {      
      Navigator.pushNamedAndRemoveUntil(
          context, SnapPeRoutes.homeRoute, (route) => false);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error Occured.")));
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
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 120),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SnapPeUI().headingSubheadingText(
                  "OTP Validation", "Please verify your number with OTP."),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 32),
                child: Column(
                  children: [
                    PinFieldAutoFill(
                      controller: _codeController,
                      decoration: UnderlineDecoration(
                          colorBuilder: FixedColorBuilder(kPrimaryColor)),
                      codeLength: 4,
                      currentCode: code,
                      onCodeSubmitted: (code) {},
                      onCodeChanged: (code) {
                        if (code!.length == 4) {
                          FocusScope.of(context).requestFocus(FocusNode());
                        }
                      },
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(Size(250, 40))),
                      onPressed: () {
                        _continueBtn();
                      },
                      child: SnapPeUI().appBarText("Continue", 15),
                    ),
                    SizedBox(height: 30),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "Have any Problem ?  ",
                              style: TextStyle(color: kLightTextColor)),
                          TextSpan(
                              text: "Resend OTP",
                              style: TextStyle(color: kLinkTextColor),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  _btnResendOTP();
                                })
                        ],
                      ),
                    ),
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
