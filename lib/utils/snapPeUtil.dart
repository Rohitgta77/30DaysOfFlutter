import 'dart:convert';

import 'package:flutter_catalog/constants/networkConstants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_catalog/constants/sharedPrefsConstants.dart';

class SnapPeUtils {
  Future<bool> checkLogin() async {
    SharedPreferences _preferences = await  SharedPreferences.getInstance();
    
    return (_preferences.getBool(isLogin)) ?? false;
  }

  setIsLogin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(isLogin, true);
  }

  Future<String?> getClientGroupName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var ClientGroupName =
        preferences.getString(NetworkConstants.CLIENT_GROUP_NAME);
    return ClientGroupName;
  }
}
