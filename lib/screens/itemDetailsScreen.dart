import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/constants/colorsConstants.dart';
import 'package:flutter_catalog/models/catalogueModel.dart' as catalogueModel;
import 'package:flutter_catalog/screens/demo.dart';
import 'package:flutter_catalog/utils/snapPeNetworks.dart';
import 'package:flutter_catalog/utils/snapPeRoutes.dart';
import 'package:flutter_catalog/utils/snapPeUI.dart';

class ItemDetailsScreen extends StatefulWidget {
  final catalogueModel.Item? item;
  const ItemDetailsScreen({Key? key, required this.item}) : super(key: key);

  @override
  _ItemDetailsScreenState createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  final titleController = TextEditingController();
  final mrpController = TextEditingController();
  final discountPercentController = TextEditingController();
  final unitController = TextEditingController();
  final measurementController = TextEditingController();
  final descriptionController = TextEditingController();
  ImageProvider _image = AssetImage('assets/images/noImage.png');
  String _title = "Add Product";

  @override
  void initState() {
    super.initState();
    if (widget.item == null) {
      return;
    }
    _title = "Edit Product";
    _image = widget.item!.images.length == 0
        ? AssetImage('assets/images/noImage.png') as ImageProvider
        : NetworkImage(widget.item!.images[0].imageUrl);
    titleController.text = widget.item!.displayName;
    mrpController.text = widget.item!.mrp.toString();
    discountPercentController.text = widget.item!.discountPercent.toString();
    unitController.text = widget.item!.unit.name;
    measurementController.text = widget.item!.measurement;
    descriptionController.text =
        widget.item!.description == null ? "" : widget.item!.description;
  }

  @override
  Widget build(BuildContext context) {
    itemImages() {
      return Stack(
        children: [
          CircleAvatar(
            radius: 80,
            backgroundImage: _image,
          ),
          Positioned(
              bottom: 5,
              right: 0,
              child: InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Demo()),
                ), //getImage(ImageSource.gallery),
                child: Icon(
                  Icons.camera_alt_rounded,
                  color: kSecondayTextcolor,
                  size: 50,
                ),
              ))
        ],
      );
    }

    return Scaffold(
        appBar: SnapPeUI().nAppBar(_title),
        body: Container(
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 50.0),
            child: Column(
              children: [
                itemImages(),
                TextFormField(
                  controller: titleController,
                  keyboardType: TextInputType.name,
                  maxLength: 200,
                  decoration: InputDecoration(
                      hintText: "Enter Title", labelText: "Title"),
                ),
                TextFormField(
                  controller: mrpController,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  decoration: InputDecoration(
                      hintText: "Enter MRP Price", labelText: "MRP Price"),
                ),
                TextFormField(
                  controller: discountPercentController,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  decoration: InputDecoration(
                      hintText: "Enter Discounted Price",
                      labelText: "Discounted Price"),
                ),
                TextFormField(
                  controller: unitController,
                  keyboardType: TextInputType.name,
                  maxLength: 100,
                  decoration: InputDecoration(
                      hintText: "Enter Unit", labelText: "Unit"),
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
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(250, 40))),
                    onPressed: () {
                      if (widget.item != null) {
                        widget.item!.displayName = titleController.text;
                        widget.item!.mrp = double.parse(mrpController.text);
                        widget.item!.discountPercent =
                            double.parse(discountPercentController.text);
                        widget.item!.unit.name = unitController.text;
                        widget.item!.measurement = measurementController.text;
                        widget.item!.description = descriptionController.text;

                        SnapPeNetworks().saveItem(context, widget.item!);
                        Navigator.pop(context);
                        Navigator.pushNamed(context, SnapPeRoutes.homeRoute);
                      }
                    },
                    child: Text(
                      "Save",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: kPrimaryTextColor),
                    )),
              ],
            ),
          ),
        ));
  }
}
