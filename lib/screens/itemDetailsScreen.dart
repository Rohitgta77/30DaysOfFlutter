import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:snap_pe_merchant/constants/colorsConstants.dart';
import 'package:snap_pe_merchant/models/model_catalogue.dart' as i_Catalogue;
import 'package:snap_pe_merchant/models/model_category.dart' as i_Category;
import 'package:snap_pe_merchant/models/model_unit.dart';
import 'package:snap_pe_merchant/utils/snapPeNetworks.dart';
import 'package:snap_pe_merchant/utils/snapPeRoutes.dart';
import 'package:snap_pe_merchant/utils/snapPeUI.dart';
import 'package:snap_pe_merchant/utils/snapPeUtil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_cropper/image_cropper.dart';

class ItemDetailsScreen extends StatefulWidget {
  final i_Catalogue.Sku skuItem;
  const ItemDetailsScreen({
    Key? key,
    required this.skuItem,
  }) : super(key: key);

  @override
  _ItemDetailsScreenState createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  final titleController = TextEditingController();
  final brandController = TextEditingController();
  final mrpController = TextEditingController();
  final sellingPriceController = TextEditingController();
  //final unitController = TextEditingController();
  final measurementController = TextEditingController();
  final descriptionController = TextEditingController();
  final categoryController = TextEditingController();
  bool isNewItem = true;
  List<String> imageUrlList = [];
  late i_Catalogue.Sku sku;

  Unit? selectedUnit;
  List<Unit> units = [
    Unit(id: 1, name: "Kgs"),
    Unit(id: 1, name: "Gms"),
    Unit(id: 1, name: "Mgs")
  ];

  @override
  void initState() {
    super.initState();
    populateValue();
    _loaddata();
  }

  _loaddata() async {
    final resData = await SnapPeNetworks().getCategory();
    if (resData == "") {
      return;
    }
    category = i_Category.categoryFromJson(resData);

    final resDatas = await SnapPeNetworks().getUnit();
    if (resDatas == "") {
      return;
    }
    UnitModel unitModel = unitFromJson(resDatas);
    units = unitModel.units;
    selectedUnit = sku.unit;
    print("Units : ${units.length}");
  }

  populateValue() {
    sku = widget.skuItem;
    selectedUnit = sku.unit;
    //print("selected Unit : ${selectedUnit!.name}");

    if (sku.id != null) {
      isNewItem = false;
      if (sku.images != null && sku.images!.length != 0) {
        imageUrlList = sku.images!.map((e) => e.imageUrl ?? "").toList();
      }

      titleController.text = sku.displayName ?? "";
      brandController.text = sku.brand ?? "";
      mrpController.text = sku.mrp!.round().toString();
      sellingPriceController.text = sku.sellingPrice!.round().toString();
      //unitController.text = sku.unit!.name;
      measurementController.text = sku.measurement!;
      descriptionController.text = sku.description ?? "";
      categoryController.text = sku.type ?? "";
    }
  }

  imageSlider() {
    return CarouselSlider.builder(
      itemCount: imageUrlList.length,
      itemBuilder: (context, index, realIndex) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            image: DecorationImage(
              image: NetworkImage(imageUrlList[index]),
            ),
          ),
        );
      },
      options: CarouselOptions(
          height: 200,
          enableInfiniteScroll: false,
          viewportFraction: 0.7,
          autoPlay: true,
          enlargeCenterPage: true),
    );
  }

  btnImage() async {
    final file = await SnapPeUtils.pickMedia(cropSquareImage);
    print("final image -  $file");
    if (file == null) {
      return;
    }
    var result = await SnapPeNetworks().uploadImage(sku.id.toString(), file);
    if (result != "") {
      Fluttertoast.showToast(
          msg: "Image Successfully Uploaded.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);

      setState(() {
        i_Catalogue.ImageC i = i_Catalogue.ImageC();
        i.id = result["id"];
        i.status = result["status"];
        i.messages = result["messages"];
        i.imageUrl = result["imageUrl"];
        i.imageText = result["imageText"];
        List<i_Catalogue.ImageC> list = [i];

        sku.images = list;

        imageUrlList.add(i.imageUrl.toString());
      });
    } else {
      Fluttertoast.showToast(
          msg: "SomeThing Wrong.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => ImageScreen(_imageList)),
    // );
  }

  Future<File?> cropSquareImage(File imageFile) async {
    return await ImageCropper.cropImage(
        sourcePath: imageFile.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1));
  }

  _imagePreview() {
    return Stack(
      children: [
        imageSlider(),
        Positioned(
            bottom: 5,
            right: 0,
            child: InkWell(
              onTap: () => btnImage(),
              child: Icon(
                Icons.camera_alt_rounded,
                color: kSecondayTextcolor,
                size: 50,
              ),
            ))
      ],
    );
  }

  i_Category.Category? category;

  Future<List<String>> getCategorySuggestion(String query) async {
    List<String> sku = category!.skuTypes.where((element) {
      final elementLower = element.toLowerCase();
      final queryLower = query.toLowerCase();
      return elementLower.contains(queryLower);
    }).toList();
    return sku;
  }

  // Future<List<i_Catalogue.Unit>> getUnitSuggestion(String query) async {
  //   List<i_Catalogue.Unit> sku = unitModel!.units.where((element) {
  //     final elementLower = element.name.toLowerCase();
  //     final queryLower = query.toLowerCase();
  //     return elementLower.contains(queryLower);
  //   }).toList();
  //   return sku;
  // }

  _formFields() {
    return Column(
      children: [
        TextFormField(
          controller: brandController,
          keyboardType: TextInputType.name,
          maxLength: 200,
          decoration:
              InputDecoration(hintText: "Enter Brand", labelText: "Brand"),
        ),
        TextFormField(
          controller: titleController,
          keyboardType: TextInputType.name,
          maxLength: 200,
          decoration:
              InputDecoration(hintText: "Enter Title", labelText: "Title"),
        ),
        TypeAheadField<String>(
          textFieldConfiguration: TextFieldConfiguration(
              controller: categoryController,
              decoration: InputDecoration(labelText: 'Catagory')),
          suggestionsCallback: (pattern) async =>
              await getCategorySuggestion(pattern),
          itemBuilder: (BuildContext context, itemData) {
            return ListTile(
              title: Text(itemData),
            );
          },
          onSuggestionSelected: (Object? suggestion) {
            categoryController.text = suggestion.toString();
          },
        ),

        // DropdownButton<Unit>(
        //   value: selectedUnit,
        //   onChanged: (Unit? newValue) {
        //     setState(() {
        //       selectedUnit = newValue!;
        //       sku.unit = selectedUnit;
        //     });
        //   },
        //   items: units!.map((Unit unit) {
        //     return DropdownMenuItem<Unit>(
        //       value: unit,
        //       child: Text(
        //         unit.name,
        //         style: TextStyle(color: Colors.black),
        //       ),
        //     );
        //   }).toList(),
        // ),

        // TypeAheadField<String>(
        //   textFieldConfiguration: TextFieldConfiguration(
        //       controller: unitController,
        //       decoration: InputDecoration(labelText: 'Unit')),
        //   suggestionsCallback: (pattern) async =>
        //       await getUnitSuggestion(pattern),
        //   itemBuilder: (BuildContext context, itemData) {
        //     return ListTile(
        //       title: Text(itemData),
        //     );
        //   },
        //   onSuggestionSelected: (Object? suggestion) {
        //     unitController.text = suggestion.toString();
        //   },
        // ),
        TextFormField(
          controller: mrpController,
          keyboardType: TextInputType.number,
          maxLength: 10,
          decoration: InputDecoration(
              hintText: "Enter MRP Price", labelText: "MRP Price"),
        ),
        TextFormField(
          controller: sellingPriceController,
          keyboardType: TextInputType.number,
          maxLength: 10,
          decoration: InputDecoration(
              hintText: "Enter Selling Price", labelText: "Selling Price"),
        ),
        TextFormField(
          controller: measurementController,
          keyboardType: TextInputType.number,
          maxLength: 50,
          decoration: InputDecoration(
              hintText: "Enter Measurement", labelText: "Measurement"),
        ),
        TextFormField(
          controller: descriptionController,
          keyboardType: TextInputType.name,
          maxLength: 500,
          decoration: InputDecoration(
              hintText: "Enter Description", labelText: "Description"),
        ),
        SizedBox(height: 50),
      ],
    );
  }

  _saveButton() {
    return ElevatedButton(
        style: ButtonStyle(fixedSize: MaterialStateProperty.all(Size(250, 40))),
        onPressed: () async {
          sku.brand = brandController.text;
          sku.displayName = titleController.text;
          sku.mrp = double.parse(mrpController.text);
          sku.sellingPrice = double.parse(sellingPriceController.text);
          //sku.unit = unitController.text;
          sku.unit = sku.unit ?? Unit(id: 9, name: "No");
          sku.measurement = measurementController.text == ""
              ? "1"
              : measurementController.text;
          sku.description = descriptionController.text;
          sku.type = categoryController.text;

          bool result =
              await SnapPeNetworks().saveItem(context, sku, isNewItem);
          if (!result) {
            return;
          }
          Navigator.pop(context);
          if (isNewItem) {
            Navigator.pop(context);
          }
          Navigator.pushNamed(context, SnapPeRoutes.homeRoute);
        },
        child: Text(
          "Save",
          style:
              TextStyle(fontWeight: FontWeight.bold, color: kPrimaryTextColor),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SnapPeUI()
            .nAppBar(isNewItem == true ? "New Product" : "Edit Product"),
        body: Container(
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 50.0),
            child: Column(
              children: [_imagePreview(), _formFields(), _saveButton()],
            ),
          ),
        ));
  }
}
