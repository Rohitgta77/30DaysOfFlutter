import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snap_pe_merchant/models/model_catalogue.dart';
import 'package:snap_pe_merchant/screens/itemDetailsScreen.dart';
import 'package:snap_pe_merchant/utils/snapPeNetworks.dart';
import 'package:snap_pe_merchant/widgets/itemWidget.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CatalogueScreen extends StatefulWidget {
  const CatalogueScreen({Key? key}) : super(key: key);

  @override
  _CatalogueScreenState createState() => _CatalogueScreenState();
}

class _CatalogueScreenState extends State<CatalogueScreen> {
  int page = 0, size = 15, totalRecords = 0, pages = 0;
  List<Sku>? itemsList;
  List<Sku>? newItemsList;
  List<Sku>? skuList;
  List itemsArray = [];
  final scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    scrollController.addListener(listenSrolling);
    _loadData();
    //_loadItems();
  }

  void listenSrolling() async {
    if (scrollController.position.maxScrollExtent - scrollController.offset ==
        0.0) {
      print("end");
      if (page != totalRecords) {
        page = page + 1;
        _loadData();
      } else {
        Fluttertoast.showToast(
            msg: "There no data.",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }

  void scrollDown() {
    final double end = scrollController.position.maxScrollExtent;
    print(end);
  }

  // _loadItems() async {
  //   final resData = await SnapPeNetworks().getItemList(context, page, size);
  //   if (resData == "") {
  //     return;
  //   }
  //   final decodedData = jsonDecode(resData);
  //   Catalogue catalogue = Catalogue.fromJson(decodedData);
  //   totalRecords = catalogue.totalRecords;
  //   pages = catalogue.pages;
  //   //var newitemsArray = decodedData["skuList"];

  //   // itemsArray.addAll(newitemsArray);
  //   // print(newitemsArray);
  //   // CatalogueModel.items =
  //   //     List.from(itemsArray).map<Item>((item) => Item.fromMap(item)).toList();
  //   // setState(() {});
  // }

  _loadData() async {
    final resData = await SnapPeNetworks().getItemList(context, page, size);
    if (resData == "") {
      return;
    }
    //final itemListJson = await rootBundle.loadString("assets/itemList.json");
    final decodedData = jsonDecode(resData);
    var newitemsArray = decodedData["skuList"];
    itemsArray.addAll(newitemsArray);
    //CatalogueModel.items
    skuList =
        List.from(itemsArray).map<Sku>((item) => Sku.fromJson(item)).toList();
    print(skuList!.length);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //final dummy = List.generate(15, (index) => CatalogueModel.items[0]);
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () {
          return Future.delayed(
            Duration(seconds: 1),
            () {
              page = 0;
              itemsArray.clear();
              _loadData();
              setState(() {});
            },
          );
        },
        child: buildCatalogueView(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ItemDetailsScreen(skuItem: Sku())));
        },
      ),
    );
  }

  buildCatalogueView() {
    if (skuList == null) {
      return Center(
        child: CupertinoActivityIndicator(radius: 20),
      );
    } else if (skuList!.length == 0) {
      return Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/noCatalogue.png"),
          Text("No Catalogue")
        ],
      ));
    }
    return ListView.builder(
        controller: scrollController,
        itemCount: skuList!.length,
        itemBuilder: (context, index) {
          return ItemWidget(item: skuList![index]);
        });
  }
}
