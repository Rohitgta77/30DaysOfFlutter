// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

import 'model_order_Details.dart';

OrderModel orderModelFromJson(String str) =>
    OrderModel.fromJson(json.decode(str));

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  OrderModel({
    this.status,
    this.messages,
    this.orders,
    this.pages,
    this.totalRecords,
  });

  String? status;
  List<dynamic>? messages;
  List<Order>? orders;
  dynamic pages;
  dynamic totalRecords;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        status: json["status"],
        messages: List<dynamic>.from(json["messages"].map((x) => x)),
        orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
        pages: json["pages"],
        totalRecords: json["totalRecords"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "messages":
            messages == null ? [] : List<dynamic>.from(messages!.map((x) => x)),
        "orders": List<dynamic>.from(orders!.map((x) => x.toJson())),
        "pages": pages,
        "totalRecords": totalRecords,
      };
}

class Order {
  Order({
    this.status,
    this.messages,
    this.id,
    this.orderStatus,
    this.remarks,
    this.amountPaid,
    this.orderAmount,
    this.selectedDeliveryBucketId,
    this.originalAmount,
    this.paymentStatus,
    this.paymentType,
    this.pinCode,
    this.firstName,
    this.middleName,
    this.lastName,
    this.customerName,
    this.customerNumber,
    this.merchantName,
    this.clientGroupId,
    this.flatNo,
    this.community,
    this.userId,
    this.applicationNo,
    this.applicationName,
    this.city,
    this.lastModifiedTime,
    this.createdOn,
    this.houseNo,
    this.deliveryTime,
    this.orderDetails,
    this.promotion,
    this.shipment,
    this.pricelist,
    this.coupon,
    this.deliveryCharges,
    this.previousBalance,
    this.referredBy,
    this.lastUpdatedBy,
    this.isPickup,
    this.merchantRemarks,
  });

  String? status;
  List<dynamic>? messages;
  int? id;
  String? orderStatus;
  String? remarks;
  double? amountPaid;
  double? orderAmount;
  dynamic selectedDeliveryBucketId;
  double? originalAmount;
  String? paymentStatus;
  dynamic paymentType;
  int? pinCode;
  dynamic firstName;
  dynamic middleName;
  dynamic lastName;
  String? customerName;
  String? customerNumber;
  String? merchantName;
  int? clientGroupId;
  String? flatNo;
  String? community;
  int? userId;
  String? applicationNo;
  String? applicationName;
  String? city;
  String? lastModifiedTime;
  String? createdOn;
  String? houseNo;
  String? deliveryTime;
  List<OrderDetail>? orderDetails;
  dynamic promotion;
  dynamic shipment;
  dynamic pricelist;
  dynamic coupon;
  double? deliveryCharges;
  dynamic previousBalance;
  dynamic referredBy;
  String? lastUpdatedBy;
  bool? isPickup;
  String? merchantRemarks;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        status: json["status"],
        messages: List<dynamic>.from(json["messages"].map((x) => x)),
        id: json["id"],
        orderStatus: json["orderStatus"],
        remarks: json["remarks"] == null ? null : json["remarks"],
        amountPaid: json["amountPaid"],
        orderAmount: json["orderAmount"],
        selectedDeliveryBucketId: json["selectedDeliveryBucketId"],
        originalAmount:
            json["originalAmount"] == null ? null : json["originalAmount"],
        paymentStatus:
            json["paymentStatus"] == null ? null : json["paymentStatus"],
        paymentType: json["paymentType"],
        pinCode: json["pinCode"],
        firstName: json["firstName"],
        middleName: json["middleName"],
        lastName: json["lastName"],
        customerName: json["customerName"],
        customerNumber: json["customerNumber"],
        merchantName: json["merchantName"],
        clientGroupId: json["clientGroupId"],
        flatNo: json["flatNo"],
        community: json["community"],
        userId: json["userId"],
        applicationNo:
            json["applicationNo"] == null ? null : json["applicationNo"],
        applicationName:
            json["applicationName"] == null ? null : json["applicationName"],
        city: json["city"],
        lastModifiedTime: json["lastModifiedTime"],
        createdOn: json["createdOn"],
        houseNo: json["houseNo"],
        deliveryTime: json["deliveryTime"],
        orderDetails: json["orderDetails"] == null
            ? null
            : List<OrderDetail>.from(
                json["orderDetails"].map((x) => OrderDetail.fromJson(x))),
        promotion: json["promotion"],
        shipment: json["shipment"],
        pricelist: json["pricelist"],
        coupon: json["coupon"],
        deliveryCharges:
            json["deliveryCharges"] == null ? null : json["deliveryCharges"],
        previousBalance: json["previousBalance"],
        referredBy: json["referredBy"],
        lastUpdatedBy:
            json["lastUpdatedBy"] == null ? null : json["lastUpdatedBy"],
        isPickup: json["isPickup"] == null ? null : json["isPickup"],
        merchantRemarks:
            json["merchantRemarks"] == null ? null : json["merchantRemarks"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "messages":
            messages == null ? [] : List<dynamic>.from(messages!.map((x) => x)),
        "id": id,
        "orderStatus": orderStatus,
        "remarks": remarks == null ? null : remarks,
        "amountPaid": amountPaid,
        "orderAmount": orderAmount,
        "selectedDeliveryBucketId": selectedDeliveryBucketId,
        "originalAmount": originalAmount == null ? null : originalAmount,
        "paymentStatus": paymentStatus == null ? null : paymentStatus,
        "paymentType": paymentType,
        "pinCode": pinCode,
        "firstName": firstName,
        "middleName": middleName,
        "lastName": lastName,
        "customerName": customerName,
        "customerNumber": customerNumber,
        "merchantName": merchantName,
        "clientGroupId": clientGroupId,
        "flatNo": flatNo,
        "community": community,
        "userId": userId,
        "applicationNo": applicationNo == null ? null : applicationNo,
        "applicationName": applicationName == null ? null : applicationName,
        "city": city,
        "lastModifiedTime": lastModifiedTime,
        "createdOn": createdOn,
        "houseNo": houseNo,
        "deliveryTime": deliveryTime,
        "orderDetails": orderDetails == null
            ? null
            : List<dynamic>.from(orderDetails!.map((x) => x.toJson())),
        "promotion": promotion,
        "shipment": shipment,
        "pricelist": pricelist,
        "coupon": coupon,
        "deliveryCharges": deliveryCharges == null ? null : deliveryCharges,
        "previousBalance": previousBalance,
        "referredBy": referredBy,
        "lastUpdatedBy": lastUpdatedBy == null ? null : lastUpdatedBy,
        "isPickup": isPickup == null ? null : isPickup,
        "merchantRemarks": merchantRemarks == null ? null : merchantRemarks,
      };
}
