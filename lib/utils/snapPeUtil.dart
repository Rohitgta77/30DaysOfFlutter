
import 'dart:io';

import 'package:snap_pe_merchant/constants/networkConstants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snap_pe_merchant/constants/sharedPrefsConstants.dart';

class SnapPeUtils {
  Future<bool> checkLogin() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();

    return (_preferences.getBool(isLogin)) ?? false;
  }

  setIsLogin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(isLogin, true);
  }

  Future<String?> getClientGroupName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var clientGroupName =
        preferences.getString(NetworkConstants.CLIENT_GROUP_NAME);
    return clientGroupName;
  }

  static Future<File?> pickMedia( 
      Future<File?> Function(File file) cropImage) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile == null) {
      return null;
    }

    File file = File(pickedFile.path);
    return cropImage(file);
  }
}
