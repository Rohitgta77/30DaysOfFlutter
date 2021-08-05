import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalogueModel.dart';
import 'package:flutter_catalog/utils/snapPeUtil.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:flutter_catalog/constants/networkConstants.dart';
import 'package:flutter_catalog/constants/sharedPrefsConstants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SnapPeNetworks {
  Future requestOTP(String mobile, String signature) async {
    Uri url = NetworkConstants.getOTPUrl(mobile);
    var response = await http.get(url);
    print('requestOTP URL: $url');
    print('Response status: ${response.statusCode}');
    print('Response Body: ${response.body}');
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future verifyOTP(String mobileOrEmail, String otp) async {
    Uri url = NetworkConstants.getVerifyOtpURL;
    var reqBody = NetworkConstants.requestBodyVerifyOTP(mobileOrEmail, otp);
    var response = await http.post(url,
        body: reqBody, headers: {"Content-Type": "application/json"});
    print('Request OTP URL: $url');
    print('Resquest Body: $reqBody');
    print('Response status: ${response.statusCode}');
    print(' ${response.body}');
    if (response.statusCode == 200) {
      _saveUserInfo(response);
      return true;
    } else {
      return false;
    }
  }

  _saveUserInfo(http.Response response) async {
    //save User Info
    SnapPeUtils().setIsLogin();
    var token = response.headers[NetworkConstants.TOKEN]!;
    print(token);
    var responseData = jsonDecode(response.body);
    var clientGroupName = responseData[NetworkConstants.CLIENT_GROUP_NAME];
    var clientName = responseData[NetworkConstants.CLIENT_NAME];
    var phoneNo = responseData[NetworkConstants.PHONE_NO];
    var role = responseData[NetworkConstants.ROLE];
    var live_agent_user_id =
        responseData[NetworkConstants.LIVE_AGENT_USER_ID].toString();

    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(userDetails, response.body);
    preferences.setString(NetworkConstants.CLIENT_GROUP_NAME, clientGroupName);
    preferences.setString(NetworkConstants.CLIENT_NAME, clientName);
    preferences.setString(NetworkConstants.PHONE_NO, phoneNo);
    preferences.setString(NetworkConstants.ROLE, role);
    preferences.setString(
        NetworkConstants.LIVE_AGENT_USER_ID, live_agent_user_id);
    preferences.setString(NetworkConstants.TOKEN, token);
  }

  logOut() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(isLogin, false);
  }

  Future login(String email, String password) async {
    Uri url = NetworkConstants.loginURL;
    var reqBody = NetworkConstants.requestBodyLogin(email, password);
    var response = await http.post(url,
        body: reqBody, headers: {"Content-Type": "application/json"});
    print('Request OTP URL: $url');
    print('Resquest Body: $reqBody');
    print('Response status: ${response.statusCode}');
    print(' ${response.body}');
    if (response.statusCode == 200) {
      _saveUserInfo(response);
      return true;
    } else {
      return false;
    }
  }

  Future<String> getItemList(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var clientGroupName =
        preferences.getString(NetworkConstants.CLIENT_GROUP_NAME);
    var token = preferences.getString(NetworkConstants.TOKEN);
    if (clientGroupName == null) {
      MotionToast.error(
        title: "Error",
        description: "you esm",
        layoutOrientation: ORIENTATION.RTL,
        animationType: ANIMATION.FROM_RIGHT,
        width: 300,
      ).show(context);
      return "";
    }
    Uri url = NetworkConstants.getItems(clientGroupName, 0, 15);

    var response = await http.get(url,
        headers: {"Content-Type": "application/json", "token": "$token"});

    print('Request getItemList: $url');
    print('Response status: ${response.statusCode}');
    print(' ${response.body}');

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }

  Future saveItem(BuildContext context, String itemId, Item item) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var clientGroupName =
        preferences.getString(NetworkConstants.CLIENT_GROUP_NAME);
    var token = preferences.getString(NetworkConstants.TOKEN);
    if (clientGroupName == null) {
      MotionToast.error(
        title: "Error",
        description: "you esm",
        layoutOrientation: ORIENTATION.RTL,
        animationType: ANIMATION.FROM_RIGHT,
        width: 300,
      ).show(context);
      return "";
    }
    Uri url = NetworkConstants.updateItem(clientGroupName, itemId);

    var response = await http.put(
      url,
      headers: {"Content-Type": "application/json", "token": "$token"},
    ); //body:

    print('Request getItemList: $url');
    print('Response status: ${response.statusCode}');
    print(' ${response.body}');

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }
}
