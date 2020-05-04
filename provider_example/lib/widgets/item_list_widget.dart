import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:providerexample/models/Item_model.dart';

class ItemListWidget extends StatelessWidget {
  final ItemModel itemModel;
  final Function onTap;
  final bool isInCartList;

  const ItemListWidget(
      {Key key,
        @required this.itemModel,
        @required this.onTap,
        @required this.isInCartList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          Icons.shop,
          size: 72.0,
        ),
        title: Text(
          itemModel.name,
          style: TextStyle(fontSize: 20.0),
        ),
        subtitle: Text(
          "${itemModel.price}",
          style: TextStyle(
              fontSize: 16.0, color: Colors.blue, fontWeight: FontWeight.w700),
        ),
        trailing: OutlineButton(
          child: Text(
            !isInCartList ? "Add to card" : "Remove",
            style: TextStyle(fontSize: 14.0, color: Colors.blue),
          ),
          onPressed: onTap,
        ),
        isThreeLine: true,
      ),
    );
  }
}