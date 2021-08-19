import 'dart:convert';
import 'dart:io';

import 'package:coffeehome/constant/api_path.dart';
import 'package:coffeehome/core/storage_key.dart';
import 'package:coffeehome/model/item.dart';
import 'package:coffeehome/model/order_dto.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

  Future<bool> createOrder(OrderDto orderDto) async {
    final keyStorage = UserStorageInfo();
    String? token = await keyStorage.getToken();
    final response = await http.post(
      Uri.parse(Api.order),
      headers: {
        HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
        HttpHeaders.authorizationHeader: "Bearer $token",
      },
      body: jsonEncode(orderDto.toJson()),
    );

    if (response.statusCode == 200) {
      _items = [];
      _totalPrice = getTotalPrice();
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }
}
