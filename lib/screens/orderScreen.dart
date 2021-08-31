import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snap_pe_merchant/models/model_orders.dart';
import 'package:snap_pe_merchant/utils/snapPeNetworks.dart';
import 'package:snap_pe_merchant/widgets/orderWidget.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  List<Order>? orders;
  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(margin: EdgeInsets.all(16), child: buildOrderView());
  }

  buildOrderView() {
    if (orders == null) {
      return Center(child: CupertinoActivityIndicator(radius: 20));
    } else if (orders!.length == 0) {
      return Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/noOrders.png"),
          Text("No Orders")
        ],
      ));
    } else {
      return ListView.builder(
          itemCount: orders!.length,
          itemBuilder: (context, index) {
            return OrderWidget(order: orders![index]);
          });
    }
  }

  void loadData() async {
    int toTimestamp = (DateTime.now().millisecondsSinceEpoch / 1000).round();
    int fromTimestamp = toTimestamp - 604800;

    var response =
        await SnapPeNetworks().getOrderList(fromTimestamp, toTimestamp, 0, 20);

    setState(() {
      orders = orderModelFromJson(response).orders;
    });
  }
}
