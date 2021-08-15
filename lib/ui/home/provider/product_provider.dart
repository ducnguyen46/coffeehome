import 'dart:convert';
import 'dart:io';

import 'package:coffeehome/core/storage_key.dart';
import 'package:coffeehome/model/product.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:coffeehome/constant/api_path.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  Future fetchProduct() async {
    final keyStorage = UserStorageInfo();
    String? token = await keyStorage.getToken();

    final response = await http.get(
      Uri.parse(Api.getAllProducts),
      headers: {
        HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
        HttpHeaders.authorizationHeader: "Bearer $token",
      },
    );
    if (response.statusCode == 200) {
      final products = await compute(_parseProducts, response.body);
      _products = products;
      notifyListeners();
    }
  }

  static List<Product> _parseProducts(String responseBody) {
    final productRes = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    final products =
        productRes.map<Product>((json) => Product.fromJson(json)).toList();
    return products;
  }
}
