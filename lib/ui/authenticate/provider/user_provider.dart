import 'dart:convert';
import 'dart:io';

import 'package:coffeehome/constant/api_path.dart';
import 'package:coffeehome/core/storage_key.dart';
import 'package:coffeehome/model/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserProvider with ChangeNotifier {
  User? _user;

  User? get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  Future getUserInfo() async {
    UserStorageInfo userStorageInfo = UserStorageInfo();
    String? token = await userStorageInfo.getToken();

    var response = await http.get(Uri.parse(Api.userInfo), headers: {
      HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
      HttpHeaders.authorizationHeader: "Bearer $token"
    });

    if (response.statusCode == 200) {
      var userRes = jsonDecode(response.body);
      _user = User.fromJson(userRes);
      notifyListeners();
    }
  }
}
