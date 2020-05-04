import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:providerexample/models/Item_model.dart';
import 'package:providerexample/models/cart_model.dart';
import 'package:providerexample/widgets/item_list_widget.dart';

import 'my_cart_screen.dart';

class ShopScreen extends StatefulWidget {
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  List<ItemModel> _items = [
    new ItemModel(name: "item 1", price: 15.0),
    new ItemModel(name: "item 2", price: 20.0),
    new ItemModel(name: "item 3", price: 25.0),
    new ItemModel(name: "item 4", price: 30.0),
    new ItemModel(name: "item 5", price: 35.0),
    new ItemModel(name: "item 6", price: 40.0),
    new ItemModel(name: "item 7", price: 45.0),
    new ItemModel(name: "item 8", price: 50.0),
    new ItemModel(name: "item 9", price: 55.0),
    new ItemModel(name: "item 10", price: 60.0),
    new ItemModel(name: "item 11", price: 65.0),
    new ItemModel(name: "item 12", price: 70.0),
    new ItemModel(name: "item 13", price: 75.0),
    new ItemModel(name: "item 14", price: 80.0),
    new ItemModel(name: "item 15", price: 85.0),
    new ItemModel(name: "item 16", price: 90.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
      builder: (context, cart, child){
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Shop",
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyCardScreen()),
                  );
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                      size: 24.0,
                    ),
                    Text('${cart.listView.length}', style: TextStyle(color: Colors.white),)
                  ],
                ),
              ),
            ],
          ),
          body:Container(
            child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (BuildContext context, int index) {
                return ItemListWidget(
                  itemModel: _items[index],
                  onTap: () {
                    cart.add(_items[index]);
                  },
                  isInCartList: false,
                );
              },
            ),
          ),
        );
      },
    );
  }
}


