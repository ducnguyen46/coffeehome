import 'dart:convert';
import 'dart:io';

import 'package:coffeehome/constant/api_path.dart';
import 'package:coffeehome/core/storage_key.dart';
import 'package:coffeehome/model/delivery_info.dart';
import 'package:coffeehome/ui/authenticate/model/validation_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DeliveryInfoProvider with ChangeNotifier {
  var _name = ValidationField(error: null, data: null);
  var _phoneNumber = ValidationField(error: null, data: null);
  var _address = ValidationField(error: null, data: null);
  var _note = "";
  var _countryCode = "+84";

  String? error;
  Map<String, dynamic>? log;

  List<DeliveryInfo> _deliveryInfos = [];

  ValidationField get name => _name;
  ValidationField get phoneNumber => _phoneNumber;
  ValidationField get address => _address;
  String get note => _note;
  String get countryCode => _countryCode;

  List<DeliveryInfo> get deliveryInfos => _deliveryInfos;

  void init() {
    _name = ValidationField(error: null, data: null);
    _phoneNumber = ValidationField(error: null, data: null);
    _address = ValidationField(error: null, data: null);
    _note = "";
    _countryCode = "+84";

    error = null;
    log = null;
    notifyListeners();
  }

  void setCountryCode(String code) {
    _countryCode = code;
    notifyListeners();
  }

  void setName(String name) {
    RegExp regExp = RegExp(r"^[a-zA-Z]{2,}(?: [a-zA-Z]+){0,2}$");
    if (regExp.hasMatch(name)) {
      _name = ValidationField(error: null, data: name);
    } else {
      _name = ValidationField(error: "Wrong name!", data: null);
    }
    error = _name.error;
    notifyListeners();
  }

  void setPhoneNumber(String num) {
    RegExp regExp = RegExp(r"^[1-9]{1}[0-9]{8}$");
    if (regExp.hasMatch(num)) {
      _phoneNumber = ValidationField(error: null, data: num);
    } else {
      _phoneNumber =
          ValidationField(error: "Phone number has 9 numbers", data: null);
    }
    error = _phoneNumber.error;
    notifyListeners();
  }

  void setAddress(String address) {
    RegExp regExp = RegExp(r"^[a-zA-Z0-9'\.\-\s\,]{1,}$");
    if (regExp.hasMatch(address)) {
      _address = ValidationField(error: null, data: address);
    } else {
      _address = ValidationField(error: "Address is required", data: null);
    }
    error = _address.error;
    notifyListeners();
  }

  void setNote(String note) {
    _note = note;
    notifyListeners();
  }

  Future addNewDeliveryInfo(DeliveryInfo deliveryInfo) async {
    final keyStorage = UserStorageInfo();
    String? token = await keyStorage.getToken();
    final response = await http.post(
      Uri.parse(Api.deliveryInfo),
      headers: {
        HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
        HttpHeaders.authorizationHeader: "Bearer $token",
      },
      body: jsonEncode(deliveryInfo.toJson()),
    );
    if (response.statusCode == 200) {
      log = jsonDecode(response.body) as Map<String, dynamic>;
      if (log!["status"] == "OK") {
        getAllDeliveryInfo();
      }
    }
  }

  Future getAllDeliveryInfo() async {
    final keyStorage = UserStorageInfo();
    String? token = await keyStorage.getToken();
    final response = await http.get(
      Uri.parse(Api.deliveryInfo),
      headers: {
        HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
        HttpHeaders.authorizationHeader: "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      _deliveryInfos = await compute(_parseDeliveryInfos, response.body);
      notifyListeners();
    }
  }

  static List<DeliveryInfo> _parseDeliveryInfos(String responseBody) {
    final deliveryInfoRes =
        jsonDecode(responseBody).cast<Map<String, dynamic>>();
    final deliveryInfos = deliveryInfoRes
        .map<DeliveryInfo>((json) => DeliveryInfo.fromJson(json))
        .toList();
    return deliveryInfos;
  }
}
