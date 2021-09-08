import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snap_pe_merchant/models/model_catalogue.dart' ;

import 'itemDetailsScreen.dart';

class ItemWidget extends StatefulWidget {
  final Sku item;
  const ItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  _ItemWidgetState createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  String subTitle = "";
  @override
  void initState() {
    super.initState();
    subTitle =
        "₹${widget.item.sellingPrice} per ${widget.item.measurement} ${widget.item.unit!.name}";
  }

  @override
  Widget build(BuildContext context) {
    bool? _switch = widget.item.availability;
    return Card(
      elevation: 8,
      shape: StadiumBorder(),
      child: ListTile(
        leading: SizedBox(
          width: 50,
          height: 50,
          child: widget.item.images!.length == 0
              ? Image.asset("assets/images/noImage.png")
              : Image.network(widget.item.images![0].imageUrl ?? ""),
        ),
        title: Text(widget.item.displayName!),
        subtitle: Text(subTitle),
        trailing: FittedBox(
          fit: BoxFit.fill,
          child: Row(
            children: <Widget>[
              Text(
                "",
                style: TextStyle(fontSize: 10),
              ),
              Switch(
                value: _switch == null ? true : _switch,
                onChanged: (value) {
                  setState(() {
                    _switch = value;
                  });
                },
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ItemDetailsScreen(skuItem: widget.item)));
          print(widget.item.id);
        },
      ),
    );
  }
}
