// To parse this JSON data, do
//
// final catalogue = catalogueFromJson(jsonString);

import 'dart:convert';

import 'package:snap_pe_merchant/models/unit.dart';

Catalogue catalogueFromJson(String str) => Catalogue.fromJson(json.decode(str));

String catalogueToJson(Catalogue data) => json.encode(data.toJson());

class Catalogue {
  Catalogue({
    required this.status,
    required this.messages,
    required this.skuList,
    required this.skuCategorySequence,
    required this.totalRecords,
    required this.pages,
    required this.pricelist,
    required this.categories,
  });

  String status;
  List<dynamic> messages;
  List<Sku> skuList;
  String skuCategorySequence;
  int totalRecords;
  int pages;
  dynamic pricelist;
  String categories;

  factory Catalogue.fromJson(Map<String, dynamic> json) => Catalogue(
        status: json["status"],
        messages: List<dynamic>.from(json["messages"].map((x) => x)),
        skuList: List<Sku>.from(json["skuList"].map((x) => Sku.fromJson(x))),
        skuCategorySequence: json["skuCategorySequence"],
        totalRecords: json["totalRecords"],
        pages: json["pages"],
        pricelist: json["pricelist"],
        categories: json["categories"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "messages": List<dynamic>.from(messages.map((x) => x)),
        "skuList": List<dynamic>.from(skuList.map((x) => x.toJson())),
        "skuCategorySequence": skuCategorySequence,
        "totalRecords": totalRecords,
        "pages": pages,
        "pricelist": pricelist,
        "categories": categories,
      };
}

class Sku {
  Sku({
    this.brand,
    this.displayName,
    this.mrp,
    this.sellingPrice,
    this.unit,
    this.measurement,
    this.moq,
    this.discountPercent,
    this.type,
    this.status,
    this.messages,
    this.id,
    this.availability,
    this.showMrp,
    this.images,
    this.description,
    this.thirdPartySku,
    this.length,
    this.width,
    this.height,
    this.weight,
    this.gst,
    this.hsnSacCode,
    this.includedInMrp,
    this.variant,
    this.skuVariants,
    this.isVisible,
    this.tags,
    this.trackInventory,
    this.availableStock,
    this.valid,
  });

  String? status;
  List<dynamic>? messages;
  int? id;
  String? brand;
  String? displayName;
  String? type;
  bool? availability = true;
  bool? showMrp = true;
  double? mrp;
  double? sellingPrice;
  List<Image>? images;
  Unit? unit;
  String? measurement = "1";
  String? description;
  String? thirdPartySku;
  double? length;
  double? width;
  double? height;
  double? weight;
  int? moq = 1;
  double? gst;
  String? hsnSacCode;
  bool? includedInMrp = true;
  double? discountPercent;
  Variant? variant;
  List<Sku>? skuVariants;
  bool? isVisible = true;
  String? tags;
  bool? trackInventory;
  int? availableStock;
  bool? valid;

  factory Sku.fromJson(Map<String, dynamic> json) => Sku(
        status: json["status"],
        messages: List<dynamic>.from(json["messages"].map((x) => x)),
        id: json["id"],
        brand: json["brand"],
        displayName: json["displayName"],
        type: json["type"],
        availability: json["availability"],
        showMrp: json["showMrp"],
        mrp: json["mrp"],
        sellingPrice: json["sellingPrice"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        unit: Unit.fromJson(json["unit"]),
        measurement: json["measurement"] ?? "",
        description: json["description"] ?? "",
        thirdPartySku:
            json["thirdPartySku"] == null ? null : json["thirdPartySku"],
        length: json["length"] == null ? null : json["length"],
        width: json["width"] == null ? null : json["width"],
        height: json["height"] == null ? null : json["height"],
        weight: json["weight"] == null ? null : json["weight"],
        moq: json["moq"] == null ? null : json["moq"],
        gst: json["gst"] == null ? null : json["gst"],
        hsnSacCode: json["hsnSacCode"] == null ? null : json["hsnSacCode"],
        includedInMrp:
            json["includedInMrp"] == null ? true : json["includedInMrp"],
        discountPercent:
            json["discountPercent"] == null ? 0 : json["discountPercent"],
        variant:
            json["variant"] == null ? null : Variant.fromJson(json["variant"]),
        skuVariants:
            List<Sku>.from(json["skuVariants"].map((x) => Sku.fromJson(x))),
        isVisible: json["isVisible"],
        tags: json["tags"] == null ? null : json["tags"],
        trackInventory: json["trackInventory"],
        availableStock: json["availableStock"],
        valid: json["valid"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "brand": brand,
        "displayName": displayName,
        "type": type,
        "availability": availability ?? true,
        "showMrp": showMrp ?? true,
        "mrp": mrp,
        "sellingPrice": sellingPrice,
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "unit": unit == null ? null : unit!.toJson(),
        "measurement": measurement,
        "description": description == null ? null : description,
        // "thirdPartySku": thirdPartySku == null ? null : thirdPartySku,
        // "length": length == null ? null : length,
        // "width": width == null ? null : width,
        // "height": height == null ? null : height,
        // "weight": weight == null ? null : weight,
        "moq": moq ?? 1,
        // "gst": gst == null ? null : gst,
        // "hsnSacCode": hsnSacCode == null ? null : hsnSacCode,
        "includedInMrp": includedInMrp ?? true,
        // "discountPercent": discountPercent,
        // "variant": variant == null ? null : variant!.toJson(),
        // "skuVariants": skuVariants == null
        //     ? null
        //     : List<dynamic>.from(skuVariants!.map((x) => x.toJson())),
        "isVisible": isVisible ?? true,
        // "tags": tags == null ? null : tags,
        "trackInventory": trackInventory ?? false,
        "availableStock": availableStock ?? 0,
        // "valid": valid ?? true,
      };
}

class Image {
  Image({
    this.status,
    this.messages,
    this.id,
    this.imageUrl,
    this.imageText,
  });

  String? status;
  List<dynamic>? messages;
  int? id;
  String? imageUrl;
  String? imageText;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        status: json["status"],
        messages: List<dynamic>.from(json["messages"].map((x) => x)),
        id: json["id"],
        imageUrl: json["imageUrl"],
        imageText: json["imageText"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "messages": List<dynamic>.from(messages!.map((x) => x)),
        "id": id,
        "imageUrl": imageUrl,
        "imageText": imageText,
      };
}



class Variant {
  Variant({
    required this.status,
    required this.messages,
    required this.id,
    required this.variantColumn1,
    required this.variantColumn2,
    required this.variantType,
  });

  String status;
  List<dynamic> messages;
  int id;
  String variantColumn1;
  dynamic variantColumn2;
  VariantType variantType;

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        status: json["status"],
        messages: List<dynamic>.from(json["messages"].map((x) => x)),
        id: json["id"],
        variantColumn1: json["variantColumn1"],
        variantColumn2: json["variantColumn2"],
        variantType: VariantType.fromJson(json["variantType"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "messages": List<dynamic>.from(messages.map((x) => x)),
        "id": id,
        "variantColumn1": variantColumn1,
        "variantColumn2": variantColumn2,
        "variantType": variantType.toJson(),
      };
}

class VariantType {
  VariantType({
    required this.status,
    required this.messages,
    required this.id,
    required this.name,
    required this.columnCount,
    required this.columnName1,
    required this.columnName2,
  });

  String status;
  List<dynamic> messages;
  int id;
  String name;
  int columnCount;
  String columnName1;
  dynamic columnName2;

  factory VariantType.fromJson(Map<String, dynamic> json) => VariantType(
        status: json["status"],
        messages: List<dynamic>.from(json["messages"].map((x) => x)),
        id: json["id"],
        name: json["name"],
        columnCount: json["columnCount"],
        columnName1: json["columnName1"],
        columnName2: json["columnName2"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "messages": List<dynamic>.from(messages.map((x) => x)),
        "id": id,
        "name": name,
        "columnCount": columnCount,
        "columnName1": columnName1,
        "columnName2": columnName2,
      };
}











// Map<String, dynamic> toJson() => {
//         "status": status,
//         "messages": [],
//         "id": id,
//         "brand": brand,
//         "displayName": displayName,
//         "type": type,
//         "availability": availability ?? true,
//         "showMrp": showMrp ?? true,
//         "mrp": mrp,
//         "sellingPrice": sellingPrice,
//         "images": images == null
//             ? null
//             : List<dynamic>.from(images!.map((x) => x.toJson())),
//         "unit": unit == null ? null : unit!.toJson(),
//         "measurement": measurement,
//         "description": description == null ? null : description,
//         "thirdPartySku": thirdPartySku == null ? null : thirdPartySku,
//         "length": length == null ? null : length,
//         "width": width == null ? null : width,
//         "height": height == null ? null : height,
//         "weight": weight == null ? null : weight,
//         "moq": moq ?? 1,
//         "gst": gst == null ? null : gst,
//         "hsnSacCode": hsnSacCode == null ? null : hsnSacCode,
//         "includedInMrp": includedInMrp ?? true,
//         "discountPercent": discountPercent,
//         "variant": variant == null ? null : variant!.toJson(),
//         "skuVariants": skuVariants == null
//             ? null
//             : List<dynamic>.from(skuVariants!.map((x) => x.toJson())),
//         "isVisible": isVisible ?? true,
//         "tags": tags == null ? null : tags,
//         "trackInventory": trackInventory ?? false,
//         "availableStock": availableStock,
//         "valid": valid ?? true,
//       };