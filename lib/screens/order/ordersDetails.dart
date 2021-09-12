import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:snap_pe_merchant/models/model_orders.dart';
import 'package:snap_pe_merchant/utils/snapPeNetworks.dart';
import 'package:snap_pe_merchant/utils/snapPeUI.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderDetailsScreen extends StatefulWidget {
  final int? orderId;
  const OrderDetailsScreen({Key? key, required this.orderId}) : super(key: key);

  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  Order? order;
  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Colors.grey[200],
      body: buildBodyContent(),
    );
  }

  void loadData() async {
    var response = await SnapPeNetworks().getOrderDetail(widget.orderId ?? 0);
    setState(() {
      order = orderFromJson(response);
    });
  }

  buildBodyContent() {
    if (order == null) {
      return Center(
        child: CupertinoActivityIndicator(radius: 20),
      );
    }
    return ListView(children: <Widget>[
      // Center(
      //     child: Text(
      //   'Order Details',
      //   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      // )),
      ordersDetailsTable(),

      customerDetailsCard()
    ]);
  }

  customerDetailsCard() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Customer Details',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
              child: Row(
                children: [
                  Text(
                    'Name : ${order!.customerName}',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
              child: Row(
                children: [
                  Text(
                    'Address : ${order!.flatNo}',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
              child: Row(
                children: [
                  Text(
                    'City & Pincode : ${order!.city} | ${order!.pinCode}',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  buildAppBar() {
    var id = "";
    var orderDate = "";
    if (order != null) {
      id = "${order!.id}";

      DateTime tempDate = DateTime.parse("${order!.createdOn}");
      orderDate = DateFormat().format(tempDate);
    }
    return AppBar(
      toolbarHeight: 80,
      actions: [
        IconButton(
            onPressed: () async {
              var url = "tel:${order!.customerNumber!}";
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
            icon: Image.asset("assets/icon/callIcon.png")),
        IconButton(
            onPressed: () async {
              var url =
                  "https://wa.me/${order!.customerNumber!}?text=Hello ${order!.customerName!}";
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
            icon: Image.asset("assets/icon/whatsappIcon.png"))
      ],
      title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SnapPeUI().appBarText("Order #$id", 22),
        SnapPeUI().appBarSubText("$orderDate", 15),
      ]),
    );
  }

  ordersDetailsTable() {
    List<DataRow> rowList = order!.orderDetails!
        .map(
          (e) => DataRow(cells: [
            DataCell(SizedBox(
              width: 30,
              height: 30,
              child: e.images!.isEmpty
                  ? Text("")
                  : Image.network("${e.images![0].imageUrl}"),
            )),
            DataCell(Text("${e.displayName}")),
            DataCell(
                Text("₹${e.sellingPrice} x ${e.quantity}${e.unit!.name} ")),
            DataCell(Text("₹ ${e.totalAmount}")),
          ]),
        )
        .toList();

    rowList.add(DataRow(cells: [
      DataCell(Text("")),
      DataCell(Text("(+) Delivery Charges")),
      DataCell(Text("")),
      DataCell(Text("₹${order!.deliveryCharges}")),
    ]));

    rowList.add(DataRow(cells: [
      DataCell(Text("")),
      DataCell(
          Text("Total Amount", style: TextStyle(fontWeight: FontWeight.bold))),
      DataCell(Text("")),
      DataCell(Text(
        "₹${order!.orderAmount}",
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
    ]));

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        child: DataTable(
          dataRowHeight: 70,
          columnSpacing: 20,
          columns: [
            DataColumn(label: Text("#")),
            DataColumn(
                label: Text('Items',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Rate',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Price',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
          ],
          rows: rowList,
        ),
      ),
    );
  }
}

//  Column(
//             children: [
//               Row(
//                 children: [
//                   Text(
//                     //"${order!.orderDetails![0].brand}",
//                     "Orders Details",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20,
//                     ),
//                   ),
//                 ],
//               ),
//               Divider(
//                 color: Colors.grey,
//               ),

//               Divider(
//                 color: Colors.grey,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Expanded(
//                     flex: 1,
//                     child: Text(
//                       //"${order!.orderDetails![0].brand}",
//                       "Total",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 15,
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 3,
//                     child: Text(
//                       //"${order!.orderDetails![0].brand}",
//                       "₹ ${order!.orderDetails![0].totalAmount}",
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 15,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Divider(
//                 color: Colors.grey,
//               ),
//             ],
//           ),



// buildBody() {
//     if (order == null) {
//       return Center(
//         child: CupertinoActivityIndicator(radius: 20),
//       );
//     }
//     return ListView.separated(
//         separatorBuilder: (context, index) => Divider(),
//         itemCount: order!.orderDetails!.length,
//         itemBuilder: (context, index) {
//           return Column(
//             children: [
//               Text("data"),
//               _orderItemWidget(order!.orderDetails![index])
//             ],
//           );
//         });
//   }



//  _orderItemWidget(OrderDetail orderDetail) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         Expanded(
//           flex: 1,
//           child: Image.network(orderDetail.images![0].imageUrl!),
//         ),
//         Expanded(
//           flex: 2,
//           child: Text(
//             "  ${orderDetail.displayName}   ",
//             overflow: TextOverflow.ellipsis,
//             style: TextStyle(
//               fontSize: 15,
//             ),
//           ),
//         ),
//         Expanded(
//           flex: 2,
//           child: Text(
//             "₹${orderDetail.sellingPrice} x ${orderDetail.quantity} ${orderDetail.unit!.name} ",
//             overflow: TextOverflow.ellipsis,
//             style: TextStyle(
//               fontSize: 15,
//             ),
//           ),
//         ),
//         Expanded(
//           flex: 2,
//           child: Text(
//             "₹ ${orderDetail.totalAmount}",
//             overflow: TextOverflow.ellipsis,
//             style: TextStyle(
//               fontSize: 15,
//             ),
//           ),
//         )
//       ],
//     );
//   }