import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:providerexample/models/Item_model.dart';

class CartModel extends ChangeNotifier{
  List<ItemModel> _listItem = [];

  UnmodifiableListView<ItemModel> get listView => UnmodifiableListView(_listItem);

  double getTotalPrice(){
    double total = 0.0;
    for(int i = 0; i < _listItem.length; i++){
      total = total + _listItem[i].price;
    }
    return total;
  }

  void add(ItemModel itemModel) {
    _listItem.add(itemModel);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  void removeItem(int index){
    _listItem.removeAt(index);
    notifyListeners();
  }

  /// Removes all items from the cart.
  void removeAll() {
    _listItem.clear();
    notifyListeners();
  }

}