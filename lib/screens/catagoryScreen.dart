import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/category.dart';
import 'package:flutter_catalog/utils/snapPeNetworks.dart';
import 'package:flutter_catalog/utils/snapPeUI.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class CatagoryScreen extends StatefulWidget {
  const CatagoryScreen({Key? key}) : super(key: key);

  @override
  _CatagoryScreenState createState() => _CatagoryScreenState();
}

class _CatagoryScreenState extends State<CatagoryScreen> {
  Category? category;
  @override
  void initState() {
    super.initState();
    _loaddata();
  }

  _loaddata() async {
    final resData = await SnapPeNetworks().getCategory(context);
    if (resData == "") {
      return;
    }
    category = categoryFromJson(resData);
  }

  Future<List<String>> getCategorySuggestion(String query) async {
    List<String> sku = category!.skuTypes.where((element) {
      final elementLower = element.toLowerCase();
      final queryLower = element.toLowerCase();
      return elementLower.contains(queryLower);
    }).toList();
    return sku;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SnapPeUI().nAppBar("Select Category"),
      body: TypeAheadField<String>(
        suggestionsCallback: (pattern) async =>
            await getCategorySuggestion(pattern),
        itemBuilder: (BuildContext context, itemData) {
          return ListTile(
            title: Text(itemData),
          );
        },
        onSuggestionSelected: (Object? suggestion) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Text("")));
        },
      ),
    );
  }
}
