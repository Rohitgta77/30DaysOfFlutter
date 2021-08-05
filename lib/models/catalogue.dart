// To parse this JSON data, do
//
// final catalogue = catalogueFromJson(jsonString);

import 'dart:convert';

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
    required this.status,
    required this.messages,
    required this.id,
    required this.brand,
    required this.displayName,
    required this.type,
    required this.availability,
    required this.showMrp,
    required this.mrp,
    required this.sellingPrice,
    required this.images,
    required this.unit,
    required this.measurement,
    required this.description,
    required this.thirdPartySku,
    required this.length,
    required this.width,
    required this.height,
    required this.weight,
    required this.moq,
    required this.gst,
    required this.hsnSacCode,
    required this.includedInMrp,
    required this.discountPercent,
    required this.variant,
    required this.skuVariants,
    required this.isVisible,
    required this.tags,
    required this.trackInventory,
    required this.availableStock,
    required this.valid,
  });

  String status;
  List<dynamic> messages;
  int id;
  String brand;
  String displayName;
  String type;
  bool availability;
  bool showMrp;
  int mrp;
  int sellingPrice;
  List<Image> images;
  Unit unit;
  String measurement;
  dynamic description;
  dynamic thirdPartySku;
  int length;
  int width;
  int height;
  int weight;
  int moq;
  dynamic gst;
  dynamic hsnSacCode;
  bool includedInMrp;
  int discountPercent;
  Variant variant;
  List<Sku> skuVariants;
  bool isVisible;
  String tags;
  bool trackInventory;
  int availableStock;
  bool valid;

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
        measurement: json["measurement"],
        description: json["description"],
        thirdPartySku: json["thirdPartySku"],
        length: json["length"] == null ? null : json["length"],
        width: json["width"] == null ? null : json["width"],
        height: json["height"] == null ? null : json["height"],
        weight: json["weight"] == null ? null : json["weight"],
        moq: json["moq"] == null ? null : json["moq"],
        gst: json["gst"],
        hsnSacCode: json["hsnSacCode"],
        includedInMrp:
            json["includedInMrp"] == null ? null : json["includedInMrp"],
        discountPercent:
            json["discountPercent"] == null ? null : json["discountPercent"],
        variant: json["variant"],
        skuVariants:
            List<Sku>.from(json["skuVariants"].map((x) => Sku.fromJson(x))),
        isVisible: json["isVisible"],
        tags: json["tags"] == null ? null : json["tags"],
        trackInventory: json["trackInventory"],
        availableStock: json["availableStock"],
        valid: json["valid"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "messages": List<dynamic>.from(messages.map((x) => x)),
        "id": id,
        "brand": brand,
        "displayName": displayName,
        "type": type,
        "availability": availability,
        "showMrp": showMrp,
        "mrp": mrp,
        "sellingPrice": sellingPrice,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "unit": unit.toJson(),
        "measurement": measurement,
        "description": description,
        "thirdPartySku": thirdPartySku,
        "length": length == null ? null : length,
        "width": width == null ? null : width,
        "height": height == null ? null : height,
        "weight": weight == null ? null : weight,
        "moq": moq == null ? null : moq,
        "gst": gst,
        "hsnSacCode": hsnSacCode,
        "includedInMrp": includedInMrp == null ? null : includedInMrp,
        "discountPercent": discountPercent == null ? null : discountPercent,
        "variant": variant == null ? null : variant.toJson(),
        "skuVariants": List<dynamic>.from(skuVariants.map((x) => x.toJson())),
        "isVisible": isVisible,
        "tags": tags == null ? null : tags,
        "trackInventory": trackInventory,
        "availableStock": availableStock,
        "valid": valid,
      };
}

class Image {
  Image({
    required this.status,
    required this.messages,
    required this.id,
    required this.imageUrl,
    required this.imageText,
  });

  String status;
  List<dynamic> messages;
  int id;
  String imageUrl;
  String imageText;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        status: json["status"],
        messages: List<dynamic>.from(json["messages"].map((x) => x)),
        id: json["id"],
        imageUrl: json["imageUrl"],
        imageText: json["imageText"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "messages": List<dynamic>.from(messages.map((x) => x)),
        "id": id,
        "imageUrl": imageUrl,
        "imageText": imageText,
      };
}

class Unit {
  Unit({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Unit.fromJson(Map<String, dynamic> json) => Unit(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
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
