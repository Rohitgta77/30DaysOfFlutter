enum UrlName {
  Get_All_Communities,
  Get_Order_List,
  Get_All_Order_List,
  Get_Client_Properties,
  Get_Order_Details,
  Put_UpdateOrderStatus,
  Put_UpdatePaymentStatus,
  Get_All_Application,
  Get_Single_ChatData,
  Get_All_ChatData
}

class NetworkConstants {
  static const String CLIENT_GROUP_NAME = "clientGroupName";
  static const String CLIENT_NAME = "clientName";
  static const String TOKEN = "token";
  static const String ROLE = "role";
  static const String PHONE_NO = "phoneNo";
  static const String COMMUNITIES = "communities";
  static const String PROPERTIES = "properties";
  static const String SELECTED_COMMUNITY = "selected_community";
  static const String USER_DATA = "user_data";
  static const String NO_COMMUNITIES = "No Communities Available";
  static const String OTP = "OTP";
  static const String ACTION = "action";
  static const String ORDER_ID = "id";
  static const String AMOUNT = "amount";
  static const String ORDER_LIST_PATH = "order_list_path";
  static const String ORDER = "order";
  static const String SelectedOrderDetails = "SelectedOrderDetails";
  static const String SelectedOrderID = "SelectedOrderID";
  static const String CLIENT_KEY = "client_key";
  static const String CLIENT = "client";
  static const String NAME = "name";
  static const String SELECTED_CHATBOT = "selected_chatbot";
  static const String SERVICE_PHONE = "service_phone";
  static const String CHATBOT_DEVICE_KEY = "chatbot_device_key";
  static const String CHATBOT_APP_NAME = "chatbot_app_name";
  static const String CHATBOT_ASSET_NAME = "chatbot_asset_name";
  static const String MERCHANT_DETAILS = "merchant_details";
  static const String CONFIRMED = "CONFIRMED";
  static const String DELIVERED = "DELIVERED";
  static const String CANCELLED = "CANCELLED";
  static const String TAKE_OVER = "Take Over";
  static const String RELEASE = "Release";
  static const String LIVE_AGENT_USER_ID = "userId";
  static const String LIVE_AGENT_USER_NAME = "live_agent_user_name";
  static const String USER_ID = "userName";
  static const String PASSWORD = "password";
  static const String EXPIRY_IN_MINUTES = "expiresInMinutes";
  static const String EXPIRY_IN_MINUTES_VALUE = "43800";
  static const String FCM_TOKEN_ID = "fcm_id";
  static const String AGENT_CHANNEL_VALUE = "websocket";
  static const String LIVE_AGENT_SESSION_ID = "live_agent_session_id";
  static const String CUSTOMER_NAME = "customerName";
  static const String CUSTOMER_NUMBER =
      "customer_number"; //also it is fcm's Data message key
  static const String COUNT_CHATBOT = "count_chatbot";
  static const String LIVE_AGENT_PRIVILEGE = "live_agent_privilege";

  static String requestBodyLogin(String email, String password) {
    return "{\"" +
        USER_ID +
        "\":\"" +
        email +
        "\",\"" +
        PASSWORD +
        "\":\"" +
        password +
        "\",\"" +
        EXPIRY_IN_MINUTES +
        "\":\"" +
        EXPIRY_IN_MINUTES_VALUE +
        "\"}";
  }

  static String requestBodyVerifyOTP(String mobileOrEmail, String otp) {
    return "{\"userId\":\"" +
        mobileOrEmail +
        "\",\"otp\":\"" +
        otp +
        "\",\"" +
        EXPIRY_IN_MINUTES +
        "\":\"" +
        EXPIRY_IN_MINUTES_VALUE +
        "\"}";
  }

  //static const String SOCKET_SERVER = "https://websocket-staging.snap.pe/"; //"http://10.0.2.2:3001/";// https://websocket-staging.snap.pe/
  //static const String SOCKET_DOMAIN = "dev-cb.snap.pe";
  //static const String SOCKET_DOMAIN = "retail.snap.pe";

  //static const String Domain = "https://retail.snap.pe/"; //Production End-Point
  static const String Domain = "https://qa.snap.pe/"; //QA End-Point
  //static const String CHAT_DOMAIN = "https://retail.snap.pe/"; //Production End-Point
  //static const String CHAT_DOMAIN = "https://staging-cb.snap.pe/"; //QA End-Point
  //static const String CHAT_DOMAIN = "https://dev-cb.snap.pe/";                    //QA End-Point

  // static const String MESSENGER_EP =
  //     "${CHAT_DOMAIN}messenger/chatbot/rest/v1/app/";
  // static const String LIVEAGENT_EP =
  //     CHAT_DOMAIN + "chatbot/rest/v1/app/liveagent/";
  // static const String UPDATE_FCM_IN_SERVER =
  //     CHAT_DOMAIN + "messenger/chatbot/rest/v1/fcm/connection";
  // static const String DELETE_FCM_IN_SERVER =
  //     CHAT_DOMAIN + "messenger/chatbot/rest/v1/fcm/connection?fcm_id=";

  static const String DASHBOARD_EP = Domain + "merchant/orders";
  static const String SnapPe_SERVICES_EP = Domain + "snappe-services/rest/v1/";
  static const String MERCHANTS_EP = SnapPe_SERVICES_EP + "merchants/";

  static Uri loginURL = Uri.parse(SnapPe_SERVICES_EP + "login");

  static Uri getVerifyOtpURL =
      Uri.parse(SnapPe_SERVICES_EP + "verification/validate/otp");
  //https://retail.snap.pe/snappe-services/rest/v1/login

  static Uri getOTPUrl(String mobileOrEmail) {
    return Uri.parse(SnapPe_SERVICES_EP + "users/" + mobileOrEmail + "/otp");
  }

  static Uri getItems(String clientGroupName, int page, int size) {
    String finalURL = MERCHANTS_EP +
        clientGroupName +
        "/skus?page=$page&size=$size&mode=desktop";
    return Uri.parse(finalURL); //&page="+page+"&size=20
    //"https://retail.snap.pe/snappe-services/rest/v1/merchants/RejoiceFresh/skus?page=0&size=15&mode=desktop"
  }

  static Uri updateItem(String clientGroupName, String skuId) {
    String query = skuId == "null" ? "" : "/$skuId";
    String finalURL = MERCHANTS_EP + clientGroupName + "/skus$query";
    return Uri.parse(finalURL);
    //https://qa.snap.pe/snappe-services/rest/v1/merchants/RejoiceFresh/skus/30041
  }

  static Uri getCategory(String clientGroupName) {
    String finalURL = MERCHANTS_EP + clientGroupName + "/skus-types";
    return Uri.parse(finalURL);
    //https://qa.snap.pe/snappe-services/rest/v1/merchants/FoodForTravel/skus-types
  }

  static Uri getUnit(String clientGroupName) {
    String finalURL = MERCHANTS_EP + clientGroupName + "/skus-units";
    return Uri.parse(finalURL);
    //https://qa.snap.pe/snappe-services/rest/v1/merchants/Mtalkz/skus-units
  }

  static Uri uploadImage(String clientGroupName, String? skuId) {
    String query = skuId == "null" ? "" : "?skuId=$skuId";
    String finalURL = MERCHANTS_EP + clientGroupName + "/skus/images$query";
    return Uri.parse(finalURL);
    //https://qa.snap.pe/snappe-services/rest/v1/merchants/FoodForTravel/skus/images?skuId=707019
  }

  static Uri getAllOrderList(
      String clientGroupName, int timeFrom, int timeTo, int page, int size) {
    String finalURL = MERCHANTS_EP +
        clientGroupName +
        "/divigo-orders?timefrom=$timeFrom&timeto=$timeTo&page=$page&size=$size&sortBy=createdOn&sortOrder=DESC";
    return Uri.parse(finalURL); //&page="+page+"&size=20

    //https://retail.snap.pe/snappe-services/rest/v1/merchants/JustLaid/divigo-orders?timefrom=1623647998&timeto=1624339197&page=1&size=20&sortBy=createdOn&sortOrder=DESC
  }

  static Uri getOrderDetails(String clientGroupName, int orderId) {
    String finalURL =
        MERCHANTS_EP + clientGroupName + "/divigo-orders/$orderId";
    return Uri.parse(finalURL); //&page="+page+"&size=20

    //https://qa.snap.pe/snappe-services/rest/v1/merchants/FoodForTravel/divigo-orders/755362
  }

  static Uri getConsumer(String phonenNo) {
    String finalURL =
        SnapPe_SERVICES_EP + "consumers/consumer?phoneNo=91$phonenNo";
    return Uri.parse(finalURL); //&page="+page+"&size=20

    //https://qa.snap.pe/snappe-services/rest/v1/consumers/consumer?phoneNo=919026744092
  }

  static Uri getItemsSuggestion(String clientGroupName, String pattern) {
    String finalURL =
        MERCHANTS_EP + clientGroupName + "/web/skus/$pattern?mode=mobile";
    return Uri.parse(finalURL);

    //https://qa.snap.pe/snappe-services/rest/v1/merchants/FoodForTravel/web/skus/t?mode=mobile
  }

  static Uri createNewOrder(String clientGroupName) {
    String finalURL = MERCHANTS_EP + clientGroupName + "/web/snappe-order";
    return Uri.parse(finalURL);

    //https://qa.snap.pe/snappe-services/rest/v1/merchants/FoodForTravel/web/snappe-order
  }

  static Uri getDeliveryOption(String clientGroupName, String communityName) {
    String finalURL = MERCHANTS_EP +
        clientGroupName +
        "/communities/$communityName/deliver-options";
    return Uri.parse(finalURL);

    //https://qa.snap.pe/snappe-services/rest/v1/merchants/FoodForTravel/communities/AparnaCyberlife/deliver-options
  }

  // static String GetUrl(UrlName urlName, String clientGroupName) {
  //     //https://retail.snap.pe/snappe-services/rest/v1/merchants/{client_Group_name}";
  //     //http://44.238.171.136:8082/snappe-services/{client_Group_name}
  //     String finalURL = MERCHANTS_EP + clientGroupName;

  //     switch (urlName) {
  //         case  UrlName.Get_All_Communities:
  //             return finalURL + communities_URL;//https://retail.snap.pe/snappe-services/rest/v1/merchants/{client_Group_name}/communities";
  //         case UrlName.Get_Order_List:
  //             return finalURL + orders_URL;//https://retail.snap.pe/snappe-services/rest/v1/merchants/{client_Group_name}/orders?communityName=";
  //         case UrlName.Get_Client_Properties:
  //             return finalURL + properties_URL;//https://retail.snap.pe/snappe-services/rest/v1/merchants/{client_Group_name}/properties";
  //         case UrlName.Get_Order_Details:
  //             return finalURL + orderDetails_URL;//https://retail.snap.pe/snappe-services/rest/v1/merchants/{client_Group_name}/delivery/divigo-orders/details/";
  //         case UrlName.Put_UpdateOrderStatus:
  //             return finalURL + updateOrderStatus_URL;//https://retail.snap.pe/snappe-services/rest/v1/merchants/{client_Group_name}/divigo-orders?orderStatus=";
  //         case UrlName.Put_UpdatePaymentStatus:
  //             return finalURL + updatePaymentStatus_URL;//https://retail.snap.pe/snappe-services/rest/v1/merchants/{client_Group_name}/divigo-orders?orderStatus=DELIVERED&paymentStatus=COMPLETED";
  //         case UrlName.Get_All_Application:
  //             return finalURL + application_URL;//https://retail.snap.pe/snappe-services/rest/v1/merchants/{client_Group_name}/applications";
  //         default:
  //             return "";
  //     }
  // }

  // static String GetQRCodeUrl(String ApplicationNo, String UserId, String OrderId) {
  //     return SnapPe_SERVICES_EP + "applications/" + ApplicationNo + "/users/" + UserId + "/upi-code/" + UserId + "_" + OrderId + ".png";
  // }

  // static const String communities_URL = "/communities";
  // static const String properties_URL = "/properties";
  // static const String orders_URL = "/orders?communityName=";
  // static const String orderDetails_URL = "/delivery/divigo-orders/details/";
  // static const String updateOrderStatus_URL = "/divigo-orders?orderStatus=";
  // static const String updatePaymentStatus_URL = "/divigo-orders?orderStatus=DELIVERED&paymentStatus=COMPLETED";
  // static const String application_URL = "/applications";

  // static String GetChatDataUrl(urlName urlName, String appName, String tsFrom, String tsTo, String destinationId,String clientGroup) {
  //     //https://retail.snap.pe/messenger/chatbot/rest/v1/app/divigo1/Conversations/1615053111/1617645111

  //     switch (urlName) {
  //         case Get_All_ChatData:
  //             //"https://retail.snap.pe/snappe-services/messenger/chatbot/rest/v1/app/{appName}/Conversations/<ts_from>/<ts_to>"
  //             return MESSENGER_EP + appName + "/Conversations/" + tsFrom + "/" + tsTo+"?multi_tenant_context="+clientGroup;

  //         case Get_Single_ChatData:
  //             //"https://retail.snap.pe/snappe-services/messenger/chatbot/rest/v1/app/{appName}/Conversations/Customer/<destination_id>/<ts_from>/<ts_to>"
  //             return MESSENGER_EP + appName + "/Conversations/Customer/" + destinationId + "/" + tsFrom + "/" + tsTo+"?multi_tenant_context="+clientGroup;

  //         default:
  //             return "";
  //     }
  // }

  // static String SendMessage(String appName, String destinationId) {
  //     return MESSENGER_EP + appName + "/customer/" + destinationId + "/sendmessage";
  // }

  // static String OverrideStatus(String appName, String destinationId) {
  //     //GET - CheckOverrideStatus
  //     //POST {"live_agent_user_id": None} - TakeOver
  //     //Delete - ReleaseOverrideStatus
  //     return LIVEAGENT_EP + appName + "/" + destinationId + "";
  // }

  // static String SearchOrder_URL(String clientGroupName, String timeFrom, String timeTo, int page, int size ,String searchKeyword){
  //     page = 0;
  //     size = 20;
  //     String finalURL = MERCHANTS_EP + clientGroupName +"/divigo-orders?timefrom="+timeFrom+"&timeto="+timeTo+"&page="+page+"&size="+size+"&keyword="+searchKeyword+"&sortBy=createdOn&sortOrder=DESC";
  //     return finalURL ;//&page="+page+"&size=20
  //     //https://retail.snap.pe/snappe-services/rest/v1/merchants/JustLaid/divigo-orders?timefrom=1623964229&timeto=1624655428&page=0&size=20&keyword=47&sortBy=createdOn&sortOrder=DESC
  // }

  // static const String PREF_NAME = "SnapBasketDelivery";
  // static const String MSG_INTERNET_CONNECTION_ERROR = "No Internet ConnectedActivity";
  // static const String MSG_PLEASE_CONNECT_INTERNET = "Please check your internet connection or try again later";
  // static const String MSG_PLEASE_SELECT_COMMUNITY = "Please Select Community";
  // static const String MSG_PROCESSING = "Processing...";
  // static const String URL_APPLICATION_TYPE = "application/json";
  // int ENCODE_URL_CONNECT_TIMEOUT = 10000;
  // static const String NO_INTERNET = "No Internet Connection!";
  // static const String SOMETHINGWRONG = "Something Went Wrong, Please Try After Sometime";
  // static const String INVALIDUSER = "Invalid User";
}
