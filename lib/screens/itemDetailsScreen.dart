import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/constants/colorsConstants.dart';
import 'package:flutter_catalog/models/catalogueModel.dart';
import 'package:flutter_catalog/screens/demo.dart';
import 'package:flutter_catalog/utils/snapPeRoutes.dart';
import 'package:flutter_catalog/utils/snapPeUI.dart';

class ItemDetailsScreen extends StatefulWidget {
  final Item item;
  const ItemDetailsScreen({Key? key, required this.item}) : super(key: key);

  @override
  _ItemDetailsScreenState createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    int a = widget.item.images.length;
    // CatalogueModel.items =
    //     List.from(skuList).map<Item>((item) => Item.fromMap(item)).toList();
    
    itemImages() {
      return Stack(
        children: [
          CircleAvatar(
            radius: 80,
            backgroundImage: NetworkImage(widget.item.images[0].imageUrl),
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
        appBar: SnapPeUI().nAppBar("Edit Product"),
        body: Container(
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 50.0),
            child: Column(
              children: [
                itemImages(),
                TextFormField(
                  initialValue: widget.item.displayName,
                  keyboardType: TextInputType.name,
                  maxLength: 200,
                  decoration: InputDecoration(
                    hintText: "Enter Title",
                    labelText: "Title"
                  ),
                ),
                TextFormField(
                  initialValue: widget.item.sellingPrice.toString(),
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  decoration: InputDecoration(
                      hintText: "Enter MRP Price", labelText: "MRP Price"),
                ),
                TextFormField(
                  initialValue: widget.item.discountPercent.toString(),
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  decoration: InputDecoration(
                      hintText: "Enter Discounted Price",
                      labelText: "Discounted Price"),
                ),
                TextFormField(
                  initialValue: widget.item.unit.name,
                  keyboardType: TextInputType.name,
                  maxLength: 100,
                  decoration: InputDecoration(
                      hintText: "Enter Unit", labelText: "Unit"),
                ),
                TextFormField(
                  initialValue: widget.item.measurement,
                  keyboardType: TextInputType.number,
                  maxLength: 50,
                  decoration: InputDecoration(
                      hintText: "Enter Measurement", labelText: "Measurement"),
                ),
                TextFormField(
                  initialValue: widget.item.description,
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
                      Navigator.pushNamed(context, SnapPeRoutes.homeRoute);
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
