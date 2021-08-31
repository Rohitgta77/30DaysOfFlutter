import 'package:flutter/material.dart';
import 'package:snap_pe_merchant/models/model_orders.dart';
import 'package:snap_pe_merchant/screens/ordersDetails.dart';

class OrderWidget extends StatelessWidget {
  final Order order;
  const OrderWidget({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(order.id);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OrderDetailsScreen(orderId: order.id)));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  orderIndication(),
                  Flexible(
                    flex: 5,
                    child: Text(
                      "${order.flatNo}",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${order.id}  |  ${order.customerNumber}  "),
                  Text("${order.deliveryTime}")
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconText(Icon iconWidget, Text textWidget) {
    return Row(
      children: [iconWidget, SizedBox(width: 5), textWidget],
    );
  }

  orderIndication() {
    MaterialColor orderStatusColor;
    switch (order.orderStatus) {
      case "DELIVERED":
        {
          orderStatusColor = Colors.green;
        }
        break;
      case "CONFIRMED":
        {
          orderStatusColor = Colors.yellow;
        }
        break;
      case "CANCELLED":
        {
          orderStatusColor = Colors.red;
        }
        break;
      default:
        {
          orderStatusColor = Colors.blue;
        }
        break;
    }

    return Flexible(
      child: Container(
          width: 10,
          height: 10,
          margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
          decoration:
              BoxDecoration(color: orderStatusColor, shape: BoxShape.circle)),
    );
  }
}
