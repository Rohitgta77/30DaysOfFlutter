import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:snap_pe_merchant/models/model_catalogue.dart';
import 'package:snap_pe_merchant/models/model_order_summary.dart';
import 'package:snap_pe_merchant/models/model_delivery_schedule.dart';
import 'package:snap_pe_merchant/utils/snapPeNetworks.dart';
import 'package:snap_pe_merchant/utils/snapPeUI.dart';

class CartScreen extends StatefulWidget {
  final OrderSummaryModel order;
  const CartScreen({Key? key, required this.order})
      : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Sku> skuList = [];

  @override
  void initState() {
    super.initState();
    fetchDelivery();
    setValue();
  }

  setValue() {
    widget.order.orderStatus = "SUBMITTED";
    widget.order.amountPaid = 0;
    widget.order.orderAmount = 0;
    widget.order.originalAmount = 0;
    widget.order.paymentStatus = "PENDING";
    widget.order.deliveryCharges = 0;
  }

  fetchDelivery() async {
    if(widget.order.community==null){
      SnapPeUI()
          .toastError(errorMessage: "SomeThing Wrong. (Selected customer's Community null)");
      return ;
    }
    var result =
        await SnapPeNetworks().getDeliveryTime(widget.order.community!);
    print(result);
    if (result == "") {
      return;
    }
    DeliveryModel deliveryModel = deliveryModelFromJson(result);

    widget.order.selectedDeliveryBucketId =
        deliveryModel.deliveryOptions![0].id;
    widget.order.deliveryTime =
        deliveryModel.deliveryOptions![0].deliveryOption;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: _buildBodyContent(),
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      toolbarHeight: 80,
      title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SnapPeUI().appBarText("Create New Order", 22),
        SnapPeUI()
            .appBarSubText("For : +91 ${widget.order.customerNumber}", 15),
      ]),
    );
  }

  _buildBodyContent() {
    final serachController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          _searchItemsWidget(serachController),
          _buildItemsListVIew(),
        ],
      ),
    );
  }

  _searchItemsWidget(TextEditingController serachController) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "Search Items",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Divider(),
            TypeAheadField(
              textFieldConfiguration: TextFieldConfiguration(
                  controller: serachController,
                  decoration: InputDecoration(labelText: "Search Items")),
              suggestionsCallback: (pattern) async =>
                  await SnapPeNetworks().itemsSuggestionsCallback(pattern),
              itemBuilder: (context, Sku itemData) {
                return ListTile(
                  leading: SizedBox(
                    width: 50,
                    child: Image.network("${itemData.images![0].imageUrl!}"),
                  ),
                  title: Text("${itemData.displayName}"),
                  trailing: TextButton(
                    child: Text("Add to cart"),
                    onPressed: () {
                      print("selected Product - ${itemData.id} ");

                      widget.order.orderAmount =
                          widget.order.orderAmount! + itemData.sellingPrice!;
                      widget.order.originalAmount =
                          widget.order.originalAmount! + itemData.sellingPrice!;
                      bool alreadyAdded = false;

                      for (int i = 0; i < skuList.length; i++) {
                        print("checking ${skuList[i].id}   -  ${itemData.id}");
                        if (skuList[i].id == itemData.id) {
                          alreadyAdded = true;
                        }
                      }

                      if (alreadyAdded) {
                        Fluttertoast.showToast(
                            msg: "Already Added.",
                            gravity: ToastGravity.CENTER,
                            backgroundColor: Colors.red);
                        return;
                      }
                      print(alreadyAdded);
                      setState(() {
                        itemData.quantity = 1;
                        print(
                            "sell price - ${itemData.sellingPrice}  totalAmount - ${itemData.totalAmount}");
                        itemData.totalAmount = itemData.sellingPrice;
                        itemData.size = "0";
                        itemData.skuId = itemData.id;
                        itemData.gst = 0;

                        skuList.add(itemData);
                      });
                    },
                  ),
                );
              },
              onSuggestionSelected: (suggestion) {
                print(suggestion);
              },
            ),
          ],
        ),
      ),
    );
  }

  _buildItemsListVIew() {
    if (skuList.length == 0 || skuList.isEmpty) {
      return Card(
        child: Center(
          child: Text("No Items Added."),
        ),
      );
    }
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(4),
          color: Colors.white,
          height: 400,
          child: ListView.builder(
            itemCount: skuList.length,
            itemBuilder: (context, index) {
              return _item(skuList[index]);
            },
          ),
        ),
        Container(
          margin: EdgeInsets.all(4),
          padding: EdgeInsets.all(16),
          alignment: Alignment.centerLeft,
          decoration:
              BoxDecoration(color: Colors.white, shape: BoxShape.rectangle),
          child: Column(
            children: [
              Text(
                "Delivery Schedule : ${widget.order.deliveryTime}",
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(4),
          padding: EdgeInsets.all(16),
          alignment: Alignment.center,
          decoration:
              BoxDecoration(color: Colors.white, shape: BoxShape.rectangle),
          child: Column(
            children: [
              Text(
                "Total Amount : ₹${widget.order.orderAmount}",
                style: TextStyle(fontSize: 20),
              ),
              ElevatedButton(
                  onPressed: () {
                    widget.order.orderDetails = skuList;
                    // widget.order.applicationName = "DivigoRetail";
                    // widget.order.applicationNo = "919953423108";
                    //widget.order.pinCode = 502032;
                    widget.order.status ="OK";


                    SnapPeNetworks().createNewOrder(widget.order);
                  },
                  child: Text(
                    "Place Order",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        )
      ],
    );
  }

  _item(Sku sku) {
    return ListTile(
      leading: SizedBox(
          width: 50, child: Image.network("${sku.images![0].imageUrl}")),
      title: Text("${sku.displayName!}"),
      subtitle: Text(
        "Price : ₹${sku.sellingPrice!}",
        style: TextStyle(color: Colors.lightGreen),
      ),
      trailing: SizedBox(
        width: 106,
        child: Row(
          children: <Widget>[
            sku.quantity != 0
                ? sku.quantity == 1
                    ? new IconButton(
                        icon: new Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () => setState(() {
                          widget.order.orderAmount =
                              widget.order.orderAmount! - sku.sellingPrice!;

                          widget.order.originalAmount =
                              widget.order.originalAmount! - sku.sellingPrice!;
                          skuList.remove(sku);
                        }),
                      )
                    : new IconButton(
                        icon: new Icon(Icons.remove),
                        onPressed: () => setState(() {
                          sku.totalAmount =
                              sku.totalAmount! - sku.sellingPrice!;
                          widget.order.orderAmount =
                              widget.order.orderAmount! - sku.sellingPrice!;
                          widget.order.originalAmount =
                              widget.order.originalAmount! - sku.sellingPrice!;
                          sku.quantity = sku.quantity! - 1;
                        }),
                      )
                : new Container(),
            new Text(sku.quantity.toString()),
            new IconButton(
                icon: new Icon(Icons.add),
                onPressed: () => setState(() {
                      sku.totalAmount = sku.totalAmount! + sku.sellingPrice!;
                      widget.order.orderAmount =
                          widget.order.orderAmount! + sku.sellingPrice!;
                      widget.order.originalAmount =
                          widget.order.originalAmount! + sku.sellingPrice!;
                      sku.quantity = sku.quantity! + 1;
                    }))
          ],
        ),
      ),
    );
  }
}
