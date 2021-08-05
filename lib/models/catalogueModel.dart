import 'package:flutter_catalog/models/catalogue.dart';

class CatalogueModel {
  static List<Item> items = [];
}

class Item {
  int id;
  String displayName;
  double sellingPrice;
  String measurement;
  Unit unit;
  bool availability;
  String status;
  List<dynamic> messages;
  String brand;
  String type;
  bool showMrp;
  double mrp;
  List<Image> images;
  dynamic description;
  dynamic thirdPartySku;
  double length;
  double width;
  double height;
  double weight;
  int moq;
  dynamic gst;
  dynamic hsnSacCode;
  bool includedInMrp;
  double discountPercent;
  Variant ?variant;
  List<Sku> skuVariants;
  bool isVisible;
  String tags;
  bool trackInventory;
  int availableStock;
  bool valid;

  String subTitle;

  // A Dart class may have generative constructors or factory constructors.
  // unnamed generative constructor
  Item({
    required this.id,
    required this.displayName,
    required this.sellingPrice,
    required this.measurement,
    required this.unit,
    required this.subTitle,
    required this.availability,
    required this.status,
    required this.messages,
    required this.brand,
    required this.type,
    required this.showMrp,
    required this.mrp,
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
    required this.isVisible,
    required this.tags,
    required this.trackInventory,
    required this.availableStock,
    required this.valid,
    required this.images,
    this.variant,
    required this.skuVariants,
  });

  factory Item.fromMap(Map<String, dynamic> json) {
    //imageUrl: json["images"][0]["imageUrl"],
    return Item(
      id: json["id"],
      displayName: json["displayName"],
      images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
      sellingPrice: json["sellingPrice"],
      measurement: json["measurement"],
      unit: Unit.fromJson(json["unit"]),
      availability: json["availability"],
      subTitle:
          "₹${json["sellingPrice"]} per ${json["measurement"] + " " + json["unit"]["name"]}",
      status: json["status"],
      messages: List<dynamic>.from(json["messages"].map((x) => x)),
      brand: json["brand"],
      type: json["type"],
      showMrp: json["showMrp"],
      mrp: json["mrp"],
      description: json["description"],
      thirdPartySku: json["thirdPartySku"],
      length: json["length"] == null ? 0 : json["length"],
      width: json["width"] == null ? 0 : json["width"],
      height: json["height"] == null ? 0 : json["height"],
      weight: json["weight"] == null ? 0 : json["weight"],
      moq: json["moq"] == null ? 0 : json["moq"],
      gst: json["gst"],
      hsnSacCode: json["hsnSacCode"],
      includedInMrp:
          json["includedInMrp"] == null ? false : json["includedInMrp"],
      discountPercent:
          json["discountPercent"] == null ? 0 : json["discountPercent"],
      isVisible: json["isVisible"],
      tags: json["tags"] == null ? "" : json["tags"],
      trackInventory: json["trackInventory"],
      availableStock: json["availableStock"],
      valid: json["valid"],
      skuVariants:
          List<Sku>.from(json["skuVariants"].map((x) => Sku.fromJson(x))),
      variant: json["variant"] == null ? null : json["variant"],
    );
  }

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
        "variant": variant == null ? null : variant!.toJson(),
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
