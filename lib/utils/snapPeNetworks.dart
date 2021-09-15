import 'dart:convert';
import 'dart:io';
import 'package:snap_pe_merchant/models/model_community.dart';
import 'package:snap_pe_merchant/models/model_catalogue.dart';
import 'package:snap_pe_merchant/models/model_consumer.dart';
import 'package:snap_pe_merchant/models/model_order_summary.dart';
import 'package:snap_pe_merchant/models/model_item.dart';
import 'package:snap_pe_merchant/utils/snapPeUI.dart';
import 'package:snap_pe_merchant/utils/snapPeUtil.dart';
import 'package:snap_pe_merchant/constants/networkConstants.dart';
import 'package:snap_pe_merchant/constants/sharedPrefsConstants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

class SnapPeNetworks {
  Future requestOTP(String mobile, String signature) async {
    Uri url = NetworkConstants.getOTPUrl(mobile);
    print('requestOTP URL: $url');
    var response = await http.get(url);

    print('Response status: ${response.statusCode}');
    print('Response Body: ${response.body}');
    if (response.statusCode == 200) {
      return true;
    } else {
      SnapPeUI()
          .toastError(errorMessage: "SomeThing Wrong. ${response.statusCode}");
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
    print('${response.body}');
    if (response.statusCode == 200) {
      _saveUserInfo(response);
      return true;
    } else {
      SnapPeUI()
          .toastError(errorMessage: "SomeThing Wrong. ${response.statusCode}");
      return false;
    }
  }

  _saveUserInfo(http.Response response) async {
    //save User Info
    SnapPeUtils().setIsLogin();
    var token = response.headers[NetworkConstants.TOKEN]!;
    print(token);
    var responseData = jsonDecode(response.body);
    var merchant;
    try {
      var merchantsList = responseData["merchants"];
      merchant = merchantsList[0];
    } catch (ex) {
      merchant = responseData;
    }

    var clientGroupName = merchant[NetworkConstants.CLIENT_GROUP_NAME];
    var clientName = merchant[NetworkConstants.CLIENT_NAME];
    var phoneNo = merchant[NetworkConstants.PHONE_NO];
    var role = merchant[NetworkConstants.ROLE];
    var liveAgentUserId =
        merchant[NetworkConstants.LIVE_AGENT_USER_ID].toString();

    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(userDetails, response.body);
    preferences.setString(NetworkConstants.CLIENT_GROUP_NAME, clientGroupName);
    preferences.setString(NetworkConstants.CLIENT_NAME, clientName);
    preferences.setString(NetworkConstants.PHONE_NO, phoneNo);
    preferences.setString(NetworkConstants.ROLE, role);
    preferences.setString(NetworkConstants.LIVE_AGENT_USER_ID, liveAgentUserId);
    preferences.setString(NetworkConstants.TOKEN, token);
  }

  logOut() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(isLogin, false);
  }

  Future login(String email, String password) async {
    Uri url = NetworkConstants.loginURL;
    print('Request OTP URL: $url');
    var reqBody = NetworkConstants.requestBodyLogin(email, password);
    var response = await http.post(url,
        body: reqBody, headers: {"Content-Type": "application/json"});

    print('Resquest Body: $reqBody');
    print('Response status: ${response.statusCode}');
    print(' ${response.body}');
    if (response.statusCode == 200) {
      _saveUserInfo(response);
      return true;
    } else {
      SnapPeUI()
          .toastError(errorMessage: "SomeThing Wrong. ${response.statusCode}");
      return false;
    }
  }

  Future<String> getItemList(int page, int size) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var clientGroupName =
        preferences.getString(NetworkConstants.CLIENT_GROUP_NAME);
    var token = preferences.getString(NetworkConstants.TOKEN);
    if (clientGroupName == null) {
      SnapPeUI().toastError();
      return "";
    }
    Uri url = NetworkConstants.getItems(clientGroupName, page, size);

    var response = await http.get(url,
        headers: {"Content-Type": "application/json", "token": "$token"});

    print('Request getItemList: $url');
    print('Response status: ${response.statusCode}');
    //print(' ${response.body}');

    if (response.statusCode == 200) {
      return response.body;
    } else {
      SnapPeUI()
          .toastError(errorMessage: "SomeThing Wrong. ${response.statusCode}");
      return "";
    }
  }

  Future<String> getOrderList(
      int timeFrom, int timeTo, int page, int size) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var clientGroupName =
        preferences.getString(NetworkConstants.CLIENT_GROUP_NAME);
    var token = preferences.getString(NetworkConstants.TOKEN);
    if (clientGroupName == null) {
      SnapPeUI().toastError();
      return "";
    }
    Uri url = NetworkConstants.getAllOrderList(
        clientGroupName, timeFrom, timeTo, page, size);

    var response = await http.get(url,
        headers: {"Content-Type": "application/json", "token": "$token"});

    print('Request getItemList: $url');
    print('Response status: ${response.statusCode}');
    //print(' ${response.body}');

    if (response.statusCode == 200) {
      return response.body;
    } else {
      SnapPeUI()
          .toastError(errorMessage: "SomeThing Wrong. ${response.statusCode}");
      return "";
    }
  }

  Future<String> getOrderDetail(int orderId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var clientGroupName =
        preferences.getString(NetworkConstants.CLIENT_GROUP_NAME);
    var token = preferences.getString(NetworkConstants.TOKEN);
    if (clientGroupName == null) {
      SnapPeUI().toastError();
      return "";
    }
    Uri url = NetworkConstants.getOrderDetails(clientGroupName, orderId);

    var response = await http.get(url,
        headers: {"Content-Type": "application/json", "token": "$token"});

    print('Request getItemList: $url');
    print('Response status: ${response.statusCode}');
    //print(' ${response.body}');

    if (response.statusCode == 200) {
      return response.body;
    } else {
      SnapPeUI()
          .toastError(errorMessage: "SomeThing Wrong. ${response.statusCode}");
      return "";
    }
  }

  Future<bool> saveItem(Sku item, bool isNewItem) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var clientGroupName =
        preferences.getString(NetworkConstants.CLIENT_GROUP_NAME);
    var token = preferences.getString(NetworkConstants.TOKEN);
    if (clientGroupName == null) {
      SnapPeUI().toastError();
      return false;
    }
    Uri url = NetworkConstants.updateItem(clientGroupName, item.id.toString());
    // var df = jsonEncode(rse);
    // print(rse);
    var resbody = jsonEncode(item);

    var response;
    if (isNewItem) {
      response = await http.post(url,
          headers: {"Content-Type": "application/json", "token": "$token"},
          body: resbody);
    } else {
      response = await http.put(url,
          headers: {"Content-Type": "application/json", "token": "$token"},
          body: resbody);
    }

    print('Request saveItem: $url');
    print('Response status: ${response.statusCode}');
    print(' Body = $resbody');

    if (response.statusCode == 200) {
      SnapPeUI()
          .toastSuccess(successMessage: "your items edited successfully.");
      return true;
    } else {
      SnapPeUI()
          .toastError(errorMessage: "SomeThing Wrong. ${response.statusCode}");
      return false;
    }
  }

  Future<bool> createNewCustomer(ConsumerModel consumer) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var clientGroupName =
        preferences.getString(NetworkConstants.CLIENT_GROUP_NAME);
    var token = preferences.getString(NetworkConstants.TOKEN);
    if (clientGroupName == null) {
      SnapPeUI().toastError();
      return false;
    }
    Uri url = NetworkConstants.createNewCustomer(clientGroupName);
    var resbody = json.encode(consumer);
    var response = await http.post(url,
        headers: {"Content-Type": "application/json", "token": "$token"},
        body: resbody);

    print('Request createNewCustomer: $url');
    print('Response status: ${response.statusCode}');
    print(' Body = $resbody');

    if (response.statusCode == 200) {
      SnapPeUI().toastSuccess(successMessage: "Custumer Added successfully.");
      return true;
    } else {
      SnapPeUI()
          .toastError(errorMessage: "SomeThing Wrong. ${response.statusCode}");
      return false;
    }
  }

  Future getCategory() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var clientGroupName =
        preferences.getString(NetworkConstants.CLIENT_GROUP_NAME);
    var token = preferences.getString(NetworkConstants.TOKEN);
    if (clientGroupName == null) {
      SnapPeUI().toastError();
      return "";
    }
    Uri url = NetworkConstants.getCategory(clientGroupName);

    var response = await http.get(url,
        headers: {"Content-Type": "application/json", "token": "$token"});

    print('Request getCategory: $url');
    print('Response status: ${response.statusCode}');
    //print(' ${response.body}');

    if (response.statusCode == 200) {
      return response.body;
    } else {
      SnapPeUI()
          .toastError(errorMessage: "SomeThing Wrong. ${response.statusCode}");
      return "";
    }
  }

  Future getUnit() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var clientGroupName =
        preferences.getString(NetworkConstants.CLIENT_GROUP_NAME);
    var token = preferences.getString(NetworkConstants.TOKEN);
    if (clientGroupName == null) {
      SnapPeUI().toastError();
      return "";
    }
    Uri url = NetworkConstants.getUnit(clientGroupName);

    var response = await http.get(url,
        headers: {"Content-Type": "application/json", "token": "$token"});

    print('Request getCategory: $url');
    print('Response status: ${response.statusCode}');
    //print(' ${response.body}');

    if (response.statusCode == 200) {
      return response.body;
    } else {
      SnapPeUI()
          .toastError(errorMessage: "SomeThing Wrong. ${response.statusCode}");
      return "";
    }
  }

  Future<dynamic> uploadImage(String? skuId, File imageFile) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var clientGroupName =
        preferences.getString(NetworkConstants.CLIENT_GROUP_NAME);

    var token = preferences.getString(NetworkConstants.TOKEN);

    Uri url = NetworkConstants.uploadImage(clientGroupName!, skuId);

    print('Request uploadImage URL: $url');

    var formData = FormData.fromMap({
      'files': [
        MultipartFile.fromFileSync(imageFile.path, filename: 'files'),
        MultipartFile.fromFileSync(imageFile.path, filename: 'files'),
      ]
    });

    Response<Map> response = await Dio().post(url.toString(),
        data: formData,
        options: Options(headers: {
          "cookie": "token=$token",
          "Content-Type": "multipart/form-data"
        }));

    print('Response status: ${response.statusCode}');
    if (response.statusCode == 200) {
      print("uploadImage response :  ${response.data}");

      return response.data;
    } else {
      SnapPeUI()
          .toastError(errorMessage: "SomeThing Wrong. ${response.statusCode}");
      return "";
    }
  }

  Future getConsumer(String phoneNo) async {
    Uri url = NetworkConstants.getConsumer(phoneNo);

    var response = await http.get(url);

    print('Request getConsumer: $url');
    print('Response status: ${response.statusCode}');
    //print(' ${response.body}');

    if (response.statusCode == 200) {
      print("success");
      return response.body;
    } else {
      SnapPeUI()
          .toastError(errorMessage: "SomeThing Wrong. ${response.statusCode}");
      return "";
    }
  }

  Future<List<Sku>> itemsSuggestionsCallback(String pattern) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var clientGroupName =
        preferences.getString(NetworkConstants.CLIENT_GROUP_NAME);

    Uri url = NetworkConstants.getItemsSuggestion(clientGroupName!, pattern);

    var response = await http.get(url);

    print('Request itemsSuggestionsCallback: $url');
    print('Response status: ${response.statusCode}');
    //print(' ${response.body}');

    if (response.statusCode == 200) {
      print("success");
      ItemModel itemModel = itemFromJson(response.body);

      return itemModel.skuList == null ? [] : itemModel.skuList!;
    } else {
      SnapPeUI()
          .toastError(errorMessage: "SomeThing Wrong. ${response.statusCode}");
      return [];
    }
  }

  Future<List<OrderSummaryModel>> customerSuggestionsCallback(
      String pattern) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var clientGroupName =
        preferences.getString(NetworkConstants.CLIENT_GROUP_NAME);
    var token = preferences.getString(NetworkConstants.TOKEN);
    Uri url = NetworkConstants.getCustomerSuggestion(clientGroupName!, pattern);

    var response = await http.get(url,
        headers: {"Content-Type": "application/json", "token": "$token"});

    print('Request customerSuggestionsCallback: $url');
    print('Response status: ${response.statusCode}');
    //print(' ${response.body}');

    if (response.statusCode == 200) {
      print("success");
      print(response.body);
      var data = json.decode(response.body);
      var orderSummaryArray = data["orders"];
      List<OrderSummaryModel> osList = List<OrderSummaryModel>.from(
          orderSummaryArray.map((x) => OrderSummaryModel.fromJson(x)));

      return osList.length == 0 ? [] : osList;
    } else {
      SnapPeUI()
          .toastError(errorMessage: "SomeThing Wrong. ${response.statusCode}");
      return [];
    }
  }

  Future<OrderSummaryModel?> createNewOrder(OrderSummaryModel order) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var clientGroupName =
        preferences.getString(NetworkConstants.CLIENT_GROUP_NAME);
    var token = preferences.getString(NetworkConstants.TOKEN);
    if (clientGroupName == null) {
      SnapPeUI().toastError();
      return null;
    }
    order.merchantName = clientGroupName;
    Uri url = NetworkConstants.createNewOrder(clientGroupName);
    var resbody = orderSummaryModelToJson(order);

    var response = await http.post(url,
        headers: {"Content-Type": "application/json", "token": "$token"},
        body: resbody);

    print('Request createNewOrder: $url');
    print('Response status: ${response.statusCode}');
    print('Body = $resbody');

    if (response.statusCode == 200) {
      SnapPeUI()
          .toastSuccess(successMessage: "your order placed successfully.");
      OrderSummaryModel orderModel = orderSummaryModelFromJson(response.body);
      return orderModel;
    } else {
      SnapPeUI()
          .toastError(errorMessage: "SomeThing Wrong. ${response.statusCode}");
      return null;
    }
  }

  getDeliveryTime(String communityName) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var clientGroupName =
        preferences.getString(NetworkConstants.CLIENT_GROUP_NAME);
    var token = preferences.getString(NetworkConstants.TOKEN);
    Uri url =
        NetworkConstants.getDeliveryOption(clientGroupName!, communityName);

    var response = await http.get(url,
        headers: {"Content-Type": "application/json", "token": "$token"});

    print('Request getDeliveryTime: $url');
    print('Response status: ${response.statusCode}');
    //print(' ${response.body}');

    if (response.statusCode == 200) {
      print("success");
      return response.body;
    } else {
      SnapPeUI()
          .toastError(errorMessage: "SomeThing Wrong. ${response.statusCode}");
      return "";
    }
  }

  Future<List<Community>> getCommunity() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var clientGroupName =
        preferences.getString(NetworkConstants.CLIENT_GROUP_NAME);
    var token = preferences.getString(NetworkConstants.TOKEN);
    Uri url = NetworkConstants.getCommunity(clientGroupName!);

    var response = await http.get(url,
        headers: {"Content-Type": "application/json", "token": "$token"});

    print('Request getCommunity: $url');
    print('Response status: ${response.statusCode}');
    //print(' ${response.body}');
    CommunityModel communityModel = communityModelFromJson(response.body);
    if (response.statusCode == 200) {
      print("success");
      return communityModel.communities == null
          ? []
          : communityModel.communities!;
    } else {
      SnapPeUI()
          .toastError(errorMessage: "SomeThing Wrong. ${response.statusCode}");
      return [];
    }
  }
}
