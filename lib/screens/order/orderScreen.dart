import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:snap_pe_merchant/models/model_Consumer.dart';
import 'package:snap_pe_merchant/models/model_create_order.dart';
import 'package:snap_pe_merchant/models/model_orders.dart';
import 'package:snap_pe_merchant/utils/snapPeNetworks.dart';
import 'package:snap_pe_merchant/screens/order/orderWidget.dart';

import 'cart/screen_cart.dart';

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
    return Scaffold(
      body: Container(margin: EdgeInsets.all(16), child: buildOrderView()),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.article,
          color: Colors.white,
        ),
        onPressed: () {
          createAlertDialog();
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => Order(skuItem: Sku())));
        },
      ),
    );
  }

  createAlertDialog() {
    final phoneController = TextEditingController();
    phoneController.text = "9026744092"; //test
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Enter Customer Mobile / Whatsapp Number"),
          content: TextField(
            controller: phoneController,
            autofocus: true,
            keyboardType: TextInputType.phone,
            maxLength: 10,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefix: Text("+91 "),
                labelText: 'Mobile Number',
                hintText: 'Enter Mobile Number'),
          ),
          actions: [
            MaterialButton(
              child: Text("Next"),
              onPressed: () async {
                String phone = phoneController.text;
                if (phone.length != 10) {
                  Fluttertoast.showToast(
                      msg: "Please Enter Valid Number.",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.TOP,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                  return;
                }
                var result = await SnapPeNetworks().getConsumer(phone);
                print(result);

                ConsumerModel consumer = consumerModelFromJson(result);
                CreateOrderModel order = createOrderModelFromJson(result);

                consumer.firstName = consumer.firstName ?? "";
                consumer.middleName = consumer.middleName ?? "";
                consumer.lastName = consumer.lastName ?? "";

                order.customerName =
                    "${consumer.firstName}  ${consumer.lastName}"; //${consumer.middleName}
                order.customerNumber = consumer.phoneNo;
                order.flatNo = consumer.houseNo;

                //Order order = orderFromJson(result);

                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreen(
                        order: order,
                        consumer: consumer,
                      ),
                    ));
              },
            )
          ],
        );
      },
    );
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
    int fromTimestamp = toTimestamp - 2629743;

    var response =
        await SnapPeNetworks().getOrderList(fromTimestamp, toTimestamp, 0, 20);

    setState(() {
      orders = orderModelFromJson(response).orders;
    });
  }
}
