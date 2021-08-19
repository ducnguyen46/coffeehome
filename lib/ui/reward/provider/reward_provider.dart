import 'dart:convert';
import 'dart:io';

import 'package:coffeehome/constant/api_path.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:coffeehome/core/storage_key.dart';
import 'package:coffeehome/model/item.dart';
import 'package:flutter/material.dart';

class RewardProvider with ChangeNotifier {
  List<Item> _items = [];
  String? errorLog;

  List<Item> get items => _items;

  Future getAllItemsUser() async {
    var storageKey = UserStorageInfo();
    String? token = await storageKey.getToken();

    final response = await http.get(
      Uri.parse(Api.items),
      headers: {
        HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
        HttpHeaders.authorizationHeader: "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      _items = await compute(_parseItems, response.body);
      errorLog = null;
    } else {
      errorLog = "Hmmmm, some mistake from us 😰";
      _items = [];
    }
    notifyListeners();
  }

  static List<Item> _parseItems(String responseBody) {
    var itemsRes = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return itemsRes.map<Item>((json) => Item.fromJson(json)).toList();
  }
}
