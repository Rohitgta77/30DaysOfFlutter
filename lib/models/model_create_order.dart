// To parse this JSON data, do
//
//     final createOrderModel = createOrderModelFromJson(jsonString);

import 'dart:convert';

import 'model_catalogue.dart';

CreateOrderModel createOrderModelFromJson(String str) =>
    CreateOrderModel.fromJson(json.decode(str));

String createOrderModelToJson(CreateOrderModel data) =>
    json.encode(data.toJson());

class CreateOrderModel {
  CreateOrderModel({
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
  List<String>? messages;
  int? id;
  String? orderStatus;
  String? remarks;
  double? amountPaid;
  double? orderAmount;
  int? selectedDeliveryBucketId;
  double? originalAmount;
  String? paymentStatus;
  dynamic paymentType;
  int? pinCode;
  String? firstName;
  String? middleName;
  String? lastName;
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
  DateTime? lastModifiedTime;
  DateTime? createdOn;
  String? houseNo;
  String? deliveryTime;
  List<Sku>? orderDetails;
  dynamic promotion;
  dynamic shipment;
  dynamic pricelist;
  dynamic coupon;
  double? deliveryCharges;
  double? previousBalance;
  String? referredBy;
  dynamic lastUpdatedBy;
  bool? isPickup;
  String? merchantRemarks;

  factory CreateOrderModel.fromJson(Map<String, dynamic> json) =>
      CreateOrderModel(
        status: json["status"],
        messages: List<String>.from(json["messages"].map((x) => x)),
        id: json["id"],
        orderStatus: json["orderStatus"],
        remarks: json["remarks"],
        amountPaid: json["amountPaid"] ?? 0,
        orderAmount: json["orderAmount"] ?? 0,
        selectedDeliveryBucketId: json["selectedDeliveryBucketId"],
        originalAmount: json["originalAmount"],
        paymentStatus: json["paymentStatus"],
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
        applicationNo: json["applicationNo"],
        applicationName: json["applicationName"],
        city: json["city"],
        lastModifiedTime: json["lastModifiedTime"] == null
            ? null
            : DateTime.parse(json["lastModifiedTime"]),
        createdOn: json["createdOn"] == null
            ? null
            : DateTime.parse(json["createdOn"]),
        houseNo: json["houseNo"],
        deliveryTime: json["deliveryTime"],
        orderDetails: json["orderDetails"] == null
            ? null
            : List<Sku>.from(
                json["orderDetails"].map((x) => Sku.fromJsonForOrderDetail(x))),
        promotion: json["promotion"],
        shipment: json["shipment"],
        pricelist: json["pricelist"],
        coupon: json["coupon"],
        deliveryCharges: json["deliveryCharges"],
        previousBalance: json["previousBalance"],
        referredBy: json["referredBy"],
        lastUpdatedBy: json["lastUpdatedBy"],
        isPickup: json["isPickup"] ?? false,
        merchantRemarks: json["merchantRemarks"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "messages": [],
        "id": id,
        "orderStatus": orderStatus,
        "remarks": remarks,
        "amountPaid": amountPaid,
        "orderAmount": orderAmount,
        "selectedDeliveryBucketId": selectedDeliveryBucketId,
        "originalAmount": originalAmount,
        "paymentStatus": paymentStatus,
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
        "applicationNo": applicationNo,
        "applicationName": applicationName,
        "city": city,
        "lastModifiedTime": lastModifiedTime,
        "createdOn": createdOn ?? DateTime.now().toIso8601String(),
        "houseNo": houseNo,
        "deliveryTime": deliveryTime,
        "orderDetails": orderDetails == null
            ? []
            : List<dynamic>.from(
                orderDetails!.map((x) => x.toJsonFororderDetail())),
        "promotion": promotion,
        "shipment": shipment,
        "pricelist": pricelist,
        "coupon": coupon,
        "deliveryCharges": deliveryCharges,
        "previousBalance": previousBalance,
        "referredBy": referredBy,
        "lastUpdatedBy": lastUpdatedBy,
        "isPickup": isPickup,
        "merchantRemarks": merchantRemarks,
      };
}

// class OrderDetail {
//   OrderDetail({
//     this.id,
//     this.skuId,
//     this.sellingPrice,
//     this.brand,
//     this.type,
//     this.unit,
//     this.quantity,
//     this.mrp,
//     this.itemStatus,
//     this.remarks,
//     this.measurement,
//     this.images,
//     this.displayName,
//     this.totalAmount,
//     this.thirdPartySku,
//     this.discountPercent,
//     this.discountValue,
//     this.gst,
//     this.size,
//   });

//   dynamic id;
//   int? skuId;
//   int? sellingPrice;
//   String? brand;
//   String? type;
//   Unit? unit;
//   int? quantity;
//   int? mrp;
//   String? itemStatus;
//   String? remarks;
//   String? measurement;
//   List<ImageC>? images;
//   String? displayName;
//   int? totalAmount;
//   int? thirdPartySku;
//   double? discountPercent;
//   int? discountValue;
//   int? gst;
//   String? size;

//   factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
//         id: json["id"],
//         skuId: json["skuId"],
//         sellingPrice: json["sellingPrice"],
//         brand: json["brand"],
//         type: json["type"],
//         unit: Unit.fromJson(json["unit"]),
//         quantity: json["quantity"],
//         mrp: json["mrp"],
//         itemStatus: json["itemStatus"],
//         remarks: json["remarks"],
//         measurement: json["measurement"],
//         images:
//             List<ImageC>.from(json["images"].map((x) => ImageC.fromJson(x))),
//         displayName: json["displayName"],
//         totalAmount: json["totalAmount"],
//         thirdPartySku: json["thirdPartySku"],
//         discountPercent: json["discountPercent"].toDouble(),
//         discountValue: json["discountValue"],
//         gst: json["gst"],
//         size: json["size"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "skuId": skuId,
//         "sellingPrice": sellingPrice,
//         "brand": brand,
//         "type": type,
//         "unit": unit == null ? null : unit!.toJson(),
//         "quantity": quantity,
//         "mrp": mrp,
//         "itemStatus": itemStatus,
//         "remarks": remarks,
//         "measurement": measurement,
//         "images": images == null
//             ? []
//             : List<ImageC>.from(images!.map((x) => x.toJson())),
//         "displayName": displayName,
//         "totalAmount": totalAmount,
//         "thirdPartySku": thirdPartySku,
//         "discountPercent": discountPercent,
//         "discountValue": discountValue,
//         "gst": gst,
//         "size": size,
//       };
// }
