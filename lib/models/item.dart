// class Item {
//   String status;
//   List<Null> messages;
//   List<SkuList> skuList;
//   String skuCategorySequence;
//   int totalRecords;
//   int pages;
//   Null pricelist;
//   String categories;

//   Item(
//       {this.status,
//       this.messages,
//       this.skuList,
//       this.skuCategorySequence,
//       this.totalRecords,
//       this.pages,
//       this.pricelist,
//       this.categories});

//   Item.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     if (json['messages'] != null) {
//       messages = new List<Null>();
//       json['messages'].forEach((v) {
//         messages.add(new Null.fromJson(v));
//       });
//     }
//     if (json['skuList'] != null) {
//       skuList = new List<SkuList>();
//       json['skuList'].forEach((v) {
//         skuList.add(new SkuList.fromJson(v));
//       });
//     }
//     skuCategorySequence = json['skuCategorySequence'];
//     totalRecords = json['totalRecords'];
//     pages = json['pages'];
//     pricelist = json['pricelist'];
//     categories = json['categories'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     if (this.messages != null) {
//       data['messages'] = this.messages.map((v) => v.toJson()).toList();
//     }
//     if (this.skuList != null) {
//       data['skuList'] = this.skuList.map((v) => v.toJson()).toList();
//     }
//     data['skuCategorySequence'] = this.skuCategorySequence;
//     data['totalRecords'] = this.totalRecords;
//     data['pages'] = this.pages;
//     data['pricelist'] = this.pricelist;
//     data['categories'] = this.categories;
//     return data;
//   }
// }

// class SkuList {
//   String status;
//   List<Null> messages;
//   int id;
//   String brand;
//   String displayName;
//   String type;
//   bool availability;
//   bool showMrp;
//   int mrp;
//   int sellingPrice;
//   List<Images> images;
//   Unit unit;
//   String measurement;
//   Null description;
//   Null thirdPartySku;
//   int length;
//   int width;
//   int height;
//   int weight;
//   Null moq;
//   Null gst;
//   Null hsnSacCode;
//   Null includedInMrp;
//   int discountPercent;
//   Null variant;
//   List<SkuVariants> skuVariants;
//   bool isVisible;
//   String tags;
//   bool trackInventory;
//   int availableStock;
//   bool valid;

//   SkuList(
//       {this.status,
//       this.messages,
//       this.id,
//       this.brand,
//       this.displayName,
//       this.type,
//       this.availability,
//       this.showMrp,
//       this.mrp,
//       this.sellingPrice,
//       this.images,
//       this.unit,
//       this.measurement,
//       this.description,
//       this.thirdPartySku,
//       this.length,
//       this.width,
//       this.height,
//       this.weight,
//       this.moq,
//       this.gst,
//       this.hsnSacCode,
//       this.includedInMrp,
//       this.discountPercent,
//       this.variant,
//       this.skuVariants,
//       this.isVisible,
//       this.tags,
//       this.trackInventory,
//       this.availableStock,
//       this.valid});

//   SkuList.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     if (json['messages'] != null) {
//       messages = new List<Null>();
//       json['messages'].forEach((v) {
//         messages.add(new Null.fromJson(v));
//       });
//     }
//     id = json['id'];
//     brand = json['brand'];
//     displayName = json['displayName'];
//     type = json['type'];
//     availability = json['availability'];
//     showMrp = json['showMrp'];
//     mrp = json['mrp'];
//     sellingPrice = json['sellingPrice'];
//     if (json['images'] != null) {
//       images = new List<Images>();
//       json['images'].forEach((v) {
//         images.add(new Images.fromJson(v));
//       });
//     }
//     unit = json['unit'] != null ? new Unit.fromJson(json['unit']) : null;
//     measurement = json['measurement'];
//     description = json['description'];
//     thirdPartySku = json['thirdPartySku'];
//     length = json['length'];
//     width = json['width'];
//     height = json['height'];
//     weight = json['weight'];
//     moq = json['moq'];
//     gst = json['gst'];
//     hsnSacCode = json['hsnSacCode'];
//     includedInMrp = json['includedInMrp'];
//     discountPercent = json['discountPercent'];
//     variant = json['variant'];
//     if (json['skuVariants'] != null) {
//       skuVariants = new List<SkuVariants>();
//       json['skuVariants'].forEach((v) {
//         skuVariants.add(new SkuVariants.fromJson(v));
//       });
//     }
//     isVisible = json['isVisible'];
//     tags = json['tags'];
//     trackInventory = json['trackInventory'];
//     availableStock = json['availableStock'];
//     valid = json['valid'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     if (this.messages != null) {
//       data['messages'] = this.messages.map((v) => v.toJson()).toList();
//     }
//     data['id'] = this.id;
//     data['brand'] = this.brand;
//     data['displayName'] = this.displayName;
//     data['type'] = this.type;
//     data['availability'] = this.availability;
//     data['showMrp'] = this.showMrp;
//     data['mrp'] = this.mrp;
//     data['sellingPrice'] = this.sellingPrice;
//     if (this.images != null) {
//       data['images'] = this.images.map((v) => v.toJson()).toList();
//     }
//     if (this.unit != null) {
//       data['unit'] = this.unit.toJson();
//     }
//     data['measurement'] = this.measurement;
//     data['description'] = this.description;
//     data['thirdPartySku'] = this.thirdPartySku;
//     data['length'] = this.length;
//     data['width'] = this.width;
//     data['height'] = this.height;
//     data['weight'] = this.weight;
//     data['moq'] = this.moq;
//     data['gst'] = this.gst;
//     data['hsnSacCode'] = this.hsnSacCode;
//     data['includedInMrp'] = this.includedInMrp;
//     data['discountPercent'] = this.discountPercent;
//     data['variant'] = this.variant;
//     if (this.skuVariants != null) {
//       data['skuVariants'] = this.skuVariants.map((v) => v.toJson()).toList();
//     }
//     data['isVisible'] = this.isVisible;
//     data['tags'] = this.tags;
//     data['trackInventory'] = this.trackInventory;
//     data['availableStock'] = this.availableStock;
//     data['valid'] = this.valid;
//     return data;
//   }
// }

// class Images {
//   String status;
//   List<Null> messages;
//   int id;
//   String imageUrl;
//   String imageText;

//   Images({this.status, this.messages, this.id, this.imageUrl, this.imageText});

//   Images.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     if (json['messages'] != null) {
//       messages = new List<Null>();
//       json['messages'].forEach((v) {
//         messages.add(new Null.fromJson(v));
//       });
//     }
//     id = json['id'];
//     imageUrl = json['imageUrl'];
//     imageText = json['imageText'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     if (this.messages != null) {
//       data['messages'] = this.messages.map((v) => v.toJson()).toList();
//     }
//     data['id'] = this.id;
//     data['imageUrl'] = this.imageUrl;
//     data['imageText'] = this.imageText;
//     return data;
//   }
// }

// class Unit {
//   int id;
//   String name;

//   Unit({this.id, this.name});

//   Unit.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     return data;
//   }
// }

// class SkuVariants {
//   String status;
//   List<Null> messages;
//   int id;
//   String brand;
//   String displayName;
//   String type;
//   bool availability;
//   bool showMrp;
//   int mrp;
//   int sellingPrice;
//   List<Null> images;
//   Unit unit;
//   String measurement;
//   Null description;
//   Null thirdPartySku;
//   Null length;
//   Null width;
//   Null height;
//   Null weight;
//   int moq;
//   Null gst;
//   Null hsnSacCode;
//   bool includedInMrp;
//   int discountPercent;
//   Variant variant;
//   List<Null> skuVariants;
//   bool isVisible;
//   Null tags;
//   bool trackInventory;
//   int availableStock;
//   bool valid;

//   SkuVariants(
//       {this.status,
//       this.messages,
//       this.id,
//       this.brand,
//       this.displayName,
//       this.type,
//       this.availability,
//       this.showMrp,
//       this.mrp,
//       this.sellingPrice,
//       this.images,
//       this.unit,
//       this.measurement,
//       this.description,
//       this.thirdPartySku,
//       this.length,
//       this.width,
//       this.height,
//       this.weight,
//       this.moq,
//       this.gst,
//       this.hsnSacCode,
//       this.includedInMrp,
//       this.discountPercent,
//       this.variant,
//       this.skuVariants,
//       this.isVisible,
//       this.tags,
//       this.trackInventory,
//       this.availableStock,
//       this.valid});

//   SkuVariants.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     if (json['messages'] != null) {
//       messages = new List<Null>();
//       json['messages'].forEach((v) {
//         messages.add(new Null.fromJson(v));
//       });
//     }
//     id = json['id'];
//     brand = json['brand'];
//     displayName = json['displayName'];
//     type = json['type'];
//     availability = json['availability'];
//     showMrp = json['showMrp'];
//     mrp = json['mrp'];
//     sellingPrice = json['sellingPrice'];
//     if (json['images'] != null) {
//       images = new List<Null>();
//       json['images'].forEach((v) {
//         images.add(new Null.fromJson(v));
//       });
//     }
//     unit = json['unit'] != null ? new Unit.fromJson(json['unit']) : null;
//     measurement = json['measurement'];
//     description = json['description'];
//     thirdPartySku = json['thirdPartySku'];
//     length = json['length'];
//     width = json['width'];
//     height = json['height'];
//     weight = json['weight'];
//     moq = json['moq'];
//     gst = json['gst'];
//     hsnSacCode = json['hsnSacCode'];
//     includedInMrp = json['includedInMrp'];
//     discountPercent = json['discountPercent'];
//     variant =
//         json['variant'] != null ? new Variant.fromJson(json['variant']) : null;
//     if (json['skuVariants'] != null) {
//       skuVariants = new List<Null>();
//       json['skuVariants'].forEach((v) {
//         skuVariants.add(new Null.fromJson(v));
//       });
//     }
//     isVisible = json['isVisible'];
//     tags = json['tags'];
//     trackInventory = json['trackInventory'];
//     availableStock = json['availableStock'];
//     valid = json['valid'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     if (this.messages != null) {
//       data['messages'] = this.messages.map((v) => v.toJson()).toList();
//     }
//     data['id'] = this.id;
//     data['brand'] = this.brand;
//     data['displayName'] = this.displayName;
//     data['type'] = this.type;
//     data['availability'] = this.availability;
//     data['showMrp'] = this.showMrp;
//     data['mrp'] = this.mrp;
//     data['sellingPrice'] = this.sellingPrice;
//     if (this.images != null) {
//       data['images'] = this.images.map((v) => v.toJson()).toList();
//     }
//     if (this.unit != null) {
//       data['unit'] = this.unit.toJson();
//     }
//     data['measurement'] = this.measurement;
//     data['description'] = this.description;
//     data['thirdPartySku'] = this.thirdPartySku;
//     data['length'] = this.length;
//     data['width'] = this.width;
//     data['height'] = this.height;
//     data['weight'] = this.weight;
//     data['moq'] = this.moq;
//     data['gst'] = this.gst;
//     data['hsnSacCode'] = this.hsnSacCode;
//     data['includedInMrp'] = this.includedInMrp;
//     data['discountPercent'] = this.discountPercent;
//     if (this.variant != null) {
//       data['variant'] = this.variant.toJson();
//     }
//     if (this.skuVariants != null) {
//       data['skuVariants'] = this.skuVariants.map((v) => v.toJson()).toList();
//     }
//     data['isVisible'] = this.isVisible;
//     data['tags'] = this.tags;
//     data['trackInventory'] = this.trackInventory;
//     data['availableStock'] = this.availableStock;
//     data['valid'] = this.valid;
//     return data;
//   }
// }

// class Variant {
//   String status;
//   List<Null> messages;
//   int id;
//   String variantColumn1;
//   Null variantColumn2;
//   VariantType variantType;

//   Variant(
//       {this.status,
//       this.messages,
//       this.id,
//       this.variantColumn1,
//       this.variantColumn2,
//       this.variantType});

//   Variant.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     if (json['messages'] != null) {
//       messages = new List<Null>();
//       json['messages'].forEach((v) {
//         messages.add(new Null.fromJson(v));
//       });
//     }
//     id = json['id'];
//     variantColumn1 = json['variantColumn1'];
//     variantColumn2 = json['variantColumn2'];
//     variantType = json['variantType'] != null
//         ? new VariantType.fromJson(json['variantType'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     if (this.messages != null) {
//       data['messages'] = this.messages.map((v) => v.toJson()).toList();
//     }
//     data['id'] = this.id;
//     data['variantColumn1'] = this.variantColumn1;
//     data['variantColumn2'] = this.variantColumn2;
//     if (this.variantType != null) {
//       data['variantType'] = this.variantType.toJson();
//     }
//     return data;
//   }
// }

// class VariantType {
//   String status;
//   List<Null> messages;
//   int id;
//   String name;
//   int columnCount;
//   String columnName1;
//   Null columnName2;

//   VariantType(
//       {this.status,
//       this.messages,
//       this.id,
//       this.name,
//       this.columnCount,
//       this.columnName1,
//       this.columnName2});

//   VariantType.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     if (json['messages'] != null) {
//       messages = new List<Null>();
//       json['messages'].forEach((v) {
//         messages.add(new Null.fromJson(v));
//       });
//     }
//     id = json['id'];
//     name = json['name'];
//     columnCount = json['columnCount'];
//     columnName1 = json['columnName1'];
//     columnName2 = json['columnName2'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     if (this.messages != null) {
//       data['messages'] = this.messages.map((v) => v.toJson()).toList();
//     }
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['columnCount'] = this.columnCount;
//     data['columnName1'] = this.columnName1;
//     data['columnName2'] = this.columnName2;
//     return data;
//   }
// }
