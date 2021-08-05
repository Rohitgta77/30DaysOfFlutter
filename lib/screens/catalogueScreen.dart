import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/models/catalogueModel.dart';
import 'package:flutter_catalog/utils/snapPeNetworks.dart';
import 'package:flutter_catalog/widgets/itemWidget.dart';

class CatalogueScreen extends StatefulWidget {
  const CatalogueScreen({Key? key}) : super(key: key);

  @override
  _CatalogueScreenState createState() => _CatalogueScreenState();
}

class _CatalogueScreenState extends State<CatalogueScreen> {
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    final resData = await SnapPeNetworks().getItemList(context);
    if (resData == "") {
      return;
    }
    //final itemListJson = await rootBundle.loadString("assets/itemList.json");
    final decodedData = jsonDecode(resData);
    var skuList = decodedData["skuList"];
    print(skuList);
    CatalogueModel.items =
        List.from(skuList).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //final dummy = List.generate(15, (index) => CatalogueModel.items[0]);
    return ListView.builder(
        itemCount: CatalogueModel.items.length,
        itemBuilder: (context, index) {
          return ItemWidget(item: CatalogueModel.items[index]);
        });
  }
}
