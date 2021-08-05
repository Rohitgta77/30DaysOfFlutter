import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalogueModel.dart' as catalogueModel;
import 'package:flutter_catalog/screens/itemDetailsScreen.dart';

class ItemWidget extends StatefulWidget {
  final catalogueModel.Item item;
  const ItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  _ItemWidgetState createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  @override
  Widget build(BuildContext context) {
    bool _switch = widget.item.availability;
    return Card(
      elevation: 8,
      shape: StadiumBorder(),
      child: ListTile(
        leading: SizedBox(
          width: 50,
          height: 50,
          child: Image.network(
            widget.item.images[0].imageUrl,
          ),
        ),
        title: Text(widget.item.displayName),
        subtitle: Text(widget.item.subTitle),
        trailing: FittedBox(
          fit: BoxFit.fill,
          child: Row(
            children: <Widget>[
              Text(
                "",
                style: TextStyle(fontSize: 10),
              ),
              Switch(
                value: _switch,
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
                  builder: (context) => ItemDetailsScreen(item: widget.item)));
          print(widget.item.id);
        },
      ),
    );
  }
}
