import 'dart:convert';
import 'dart:io';

import 'package:coffeehome/constant/api_path.dart';
import 'package:coffeehome/core/storage_key.dart';
import 'package:coffeehome/model/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

enum Status {
  NotLoggedIn,
  NotRegistered,
  LoggedIn,
  Registered,
  Authenticating,
  Registering,
  LoggedOut
}

class AuthProvider with ChangeNotifier {
  var _loginStatus = Status.NotLoggedIn;
  var _registerStatus = Status.NotRegistered;
  String? _log;

  Status get loginStatus => _loginStatus;
  Status get registerStatus => _registerStatus;
  String? get log => _log;

  void init() {
    _loginStatus = Status.NotLoggedIn;
    _registerStatus = Status.NotRegistered;
    _log = null;
  }

  void setLog(String log) {
    _log = log;
    notifyListeners();
  }

  void setLoginStatus(Status login) {
    _loginStatus = login;
    notifyListeners();
  }

  void setRegisterStatus(Status register) {
    _registerStatus = register;
    notifyListeners();
  }

  Stream<Status> login(
      BuildContext context, String username, String password) async* {
    final Map<String, String> loginData = {
      "username": username,
      "password": password
    };

    _loginStatus = Status.Authenticating;
    yield _loginStatus;

    final response = await http.post(Uri.parse(Api.login),
        headers: <String, String>{
          HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
        },
        body: jsonEncode(loginData));

    if (response.statusCode == 200) {
      final responseJson = jsonDecode(response.body);

      final keyStorage = UserStorageInfo();
      await keyStorage.saveToken(responseJson["data"]);
      await keyStorage.saveUsernamePassword(username, password);

      _loginStatus = Status.LoggedIn;
      yield _loginStatus;
    } else {
      setLog("Sorry, wrong username or password!");
      _loginStatus = Status.NotLoggedIn;
      yield _loginStatus;
    }
  }

  Stream<Status> register(User user, String password) async* {
    Map<String, dynamic> register = user.toJson();
    Map<String, dynamic> registerUser = {"password": password, ...register};

    final response = await http.post(
      Uri.parse(Api.register),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
      body: jsonEncode(registerUser),
    );

    if (response.statusCode == 200) {
      final responseJson = jsonDecode(response.body);
      switch (responseJson["status"]) {
        case "ERROR":
          setLog(responseJson["data"]);
          _registerStatus = Status.NotRegistered;
          break;
        default:
          setLog(responseJson["data"]);
          _registerStatus = Status.Registered;
          break;
      }
      yield _registerStatus;
    } else {
      setLog("Can't register");
      _registerStatus = Status.NotRegistered;
      yield _registerStatus;
    }
  }
}
