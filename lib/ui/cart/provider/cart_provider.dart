import 'package:coffeehome/model/item.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  List<Item> _items = [];
  double _totalPrice = 0;

  List<Item> get items => _items;
  double get totalPrice => _totalPrice;

  void setAddItem(Item item) {
    _items.add(item);
    _totalPrice = getTotalPrice();
    notifyListeners();
  }

  void setListItems(List<Item> items) {
    _items = items;
    _totalPrice = getTotalPrice();
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    _totalPrice = getTotalPrice();
    notifyListeners();
  }

  double getTotalPrice() {
    double totalPrice = 0;
    for (Item item in items) {
      totalPrice += (item.priceIn * item.quantity);
    }
    return totalPrice;
  }
}
