// // To parse this JSON data, do
// //
// //     final customerModel = customerModelFromJson(jsonString);
//
// import 'dart:convert';
//
// CustomerModel customerModelFromJson(String str) => CustomerModel.fromJson(json.decode(str));
//
// String customerModelToJson(CustomerModel data) => json.encode(data.toJson());
//
// class CustomerModel {
//     CustomerModel({
//         this.customers,
//         this.pages,
//         this.totalRecords,
//     });
//
//     List<Customer>? customers;
//     int? pages;
//     int? totalRecords;
//
//     factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
//         customers: List<Customer>.from(json["customers"].map((x) => Customer.fromJson(x))),
//         pages: json["pages"],
//         totalRecords: json["totalRecords"],
//     );
//
//     Map<String, dynamic> toJson() => {
//         "customers": customers == null?[]: List<dynamic>.from(customers!.map((x) => x.toJson())),
//         "pages": pages,
//         "totalRecords": totalRecords,
//     };
// }
//
// class Customer {
//     Customer({
//         this.pincode,
//         this.city,
//         this.addressLine1,
//         this.houseNo,
//         this.community,
//         this.id,
//         this.userId,
//         this.relationId,
//         this.mobileNumber,
//         this.emailAddress,
//         this.firstName,
//         this.lastName,
//         this.customerName,
//         this.role,
//         this.roleId,
//         this.customerRefferal,
//         this.organizationName,
//         this.parentCustomerId,
//         this.parentCustomerName,
//         this.referralLink,
//         this.guid,
//         this.affiliateStatus,
//         this.pagingId,
//         this.gst,
//         this.pan,
//     });
//
//     int? pincode;
//     String? city;
//     String? addressLine1;
//     String? houseNo;
//     String? community;
//     int? id;
//     int? userId;
//     int? relationId;
//     String? mobileNumber;
//     dynamic emailAddress;
//     String? firstName;
//     String? lastName;
//     String? customerName;
//     String? role;
//     int? roleId;
//     dynamic customerRefferal;
//     String? organizationName;
//     dynamic parentCustomerId;
//     dynamic parentCustomerName;
//     dynamic referralLink;
//     String? guid;
//     dynamic affiliateStatus;
//     int? pagingId;
//     dynamic gst;
//     dynamic pan;
//
//     factory Customer.fromJson(Map<String, dynamic> json) => Customer(
//         pincode: json["pincode"],
//         city: json["city"] == null ? null : json["city"],
//         addressLine1: json["addressLine1"] == null ? null : json["addressLine1"],
//         houseNo: json["houseNo"] == null ? null : json["houseNo"],
//         community: json["community"],
//         id: json["id"],
//         userId: json["userId"],
//         relationId: json["relationId"],
//         mobileNumber: json["mobileNumber"],
//         emailAddress: json["emailAddress"],
//         firstName: json["firstName"] == null ? null : json["firstName"],
//         lastName: json["lastName"] == null ? null : json["lastName"],
//         customerName: json["customerName"] == null ? null : json["customerName"],
//         role: json["role"],
//         roleId: json["roleId"],
//         customerRefferal: json["customerRefferal"],
//         organizationName: json["organizationName"] == null ? null : json["organizationName"],
//         parentCustomerId: json["parentCustomerId"],
//         parentCustomerName: json["parentCustomerName"],
//         referralLink: json["referralLink"],
//         guid: json["guid"],
//         affiliateStatus: json["affiliateStatus"],
//         pagingId: json["pagingId"],
//         gst: json["gst"],
//         pan: json["pan"],
//     );
//
//     Map<String, dynamic> toJson() => {
//         "pincode": pincode,
//         "city": city == null ? null : city,
//         "addressLine1": addressLine1 == null ? null : addressLine1,
//         "houseNo": houseNo == null ? null : houseNo,
//         "community": community,
//         "id": id,
//         "userId": userId,
//         "relationId": relationId,
//         "mobileNumber": mobileNumber,
//         "emailAddress": emailAddress,
//         "firstName": firstName == null ? null : firstName,
//         "lastName": lastName == null ? null : lastName,
//         "customerName": customerName == null ? null : customerName,
//         "role": role,
//         "roleId": roleId,
//         "customerRefferal": customerRefferal,
//         "organizationName": organizationName == null ? null : organizationName,
//         "parentCustomerId": parentCustomerId,
//         "parentCustomerName": parentCustomerName,
//         "referralLink": referralLink,
//         "guid": guid,
//         "affiliateStatus": affiliateStatus,
//         "pagingId": pagingId,
//         "gst": gst,
//         "pan": pan,
//     };
// }
