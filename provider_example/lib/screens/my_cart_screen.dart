import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:providerexample/models/cart_model.dart';
import 'package:providerexample/screens/shop_screen.dart';
import 'package:providerexample/widgets/item_list_widget.dart';

class MyCardScreen extends StatefulWidget {
  @override
  _MyCardScreenState createState() => _MyCardScreenState();
}

class _MyCardScreenState extends State<MyCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
      builder: (context, cart, child){
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "My Card",
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            actions: [
              FlatButton(
                onPressed: (){
                  Provider.of<CartModel>(context, listen: false).removeAll();
                },
                child: Text(
                  "Clear",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0
                  ),
                ),
              )
            ],
          ),
          body: Container(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              children: [
                Text(
                  "Total: \$${cart.getTotalPrice()}",
                  style: TextStyle(color: Colors.blue, fontSize: 24.0, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.listView.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ItemListWidget(
                        itemModel: cart.listView[index],
                        onTap: () {
                          cart.removeItem(index);
                        },
                        isInCartList: true,
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
