import 'dart:convert';
import 'dart:io';

import 'package:coffeehome/constant/api_path.dart';
import 'package:coffeehome/core/storage_key.dart';
import 'package:coffeehome/model/bill.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BillOrderProvider with ChangeNotifier {
  List<Bill> _billOnGoing = [];
  List<Bill> _billComplete = [];

  List<Bill> get billOnGoing => _billOnGoing;
  List<Bill> get billComplete => _billComplete;

  Future getOrderOnGoing() async {
    var storageKey = UserStorageInfo();
    String? token = await storageKey.getToken();

    final response = await http.get(
      Uri.parse(Api.bill_ongoing),
      headers: {
        HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
        HttpHeaders.authorizationHeader: "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      _billOnGoing = await compute(_parseBill, response.body);
    }

    notifyListeners();
  }

  Future getOrderComplete() async {
    var storageKey = UserStorageInfo();
    String? token = await storageKey.getToken();

    final response = await http.get(
      Uri.parse(Api.bill_complete),
      headers: {
        HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
        HttpHeaders.authorizationHeader: "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      _billComplete = await compute(_parseBill, response.body);
    }

    notifyListeners();
  }

  static List<Bill> _parseBill(String responseBody) {
    var billRes = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return billRes.map<Bill>((json) => Bill.fromJson(json)).toList();
  }

  Future<bool> receivedOrder(Bill bill) async {
    var storageKey = UserStorageInfo();
    String? token = await storageKey.getToken();

    final response = await http.put(
      Uri.parse("${Api.orderReceived}/${bill.order.id}"),
      headers: {
        HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
        HttpHeaders.authorizationHeader: "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      var dataRes = jsonDecode(response.body);
      if (dataRes["status"] == "OK") {
        await getOrderOnGoing();
        await getOrderComplete();
        return true;
      }
    }
    return false;
  }
}
