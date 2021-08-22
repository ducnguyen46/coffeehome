import 'dart:convert';
import 'dart:io';
import 'package:coffeehome/constant/api_path.dart';
import 'package:http/http.dart' as http;

import 'package:coffeehome/core/storage_key.dart';
import 'package:coffeehome/ui/authenticate/model/validation_field.dart';
import 'package:flutter/material.dart';

class ChangePasswordProvider with ChangeNotifier {
  var _username = ValidationField(error: null, data: null);
  var _oldPassword = ValidationField(error: null, data: null);
  var _newPassword = ValidationField(error: null, data: null);
  var _newPasswordAgain = ValidationField(error: null, data: null);

  ValidationField get username => _username;
  ValidationField get oldPassword => _oldPassword;
  ValidationField get newPassword => _newPassword;
  String? error;
  Map<String, dynamic>? result;

  bool showOldPassword = false;
  bool showNewPassword = false;
  bool showNewPasswordAgain = false;

  Future changePassword() async {
    final keyStorage = UserStorageInfo();
    String? token = await keyStorage.getToken();

    Map<String, dynamic> dataBody = {
      "username": _username.data,
      "oldPassword": _oldPassword.data,
      "newPassword": _newPassword.data,
    };

    final response = await http.put(
      Uri.parse(Api.changePassword),
      headers: {
        HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
        HttpHeaders.authorizationHeader: "Bearer $token",
      },
      body: jsonEncode(dataBody),
    );
    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body).cast<Map<String, dynamic>>();
      result = responseBody;
      if (responseBody["status"] == "OK") {
        final userStorage = UserStorageInfo();
        await userStorage.saveUsernamePassword(
            username.data!, newPassword.data!);
      }
    } else {
      result = {"status": "ERROR", "data": "Our fault, not yours 😭 "};
    }
    notifyListeners();
  }

  void setUsername(String data) {
    RegExp regExp =
        RegExp(r"^(?=.*[a-zA-Z]{1,})(?=.*[\d]{0,})[a-zA-Z0-9]{1,}$");
    if (regExp.hasMatch(data)) {
      _username.data = data;
      _username.error = null;
    } else {
      _username.error = "Invalid username. Least 1 character";
      _username.data = null;
    }
    error = _username.error;
    notifyListeners();
  }

  void setOldPassword(String data) {
    RegExp regExp = RegExp(r"^((?=.*[0-9])(?=.*\w)).{6,12}$");
    if (regExp.hasMatch(data)) {
      _oldPassword.data = data;
      _oldPassword.error = null;
    } else {
      _oldPassword.error =
          "Password with 6-12 character, least 1 number, 1 character";
      _oldPassword.data = null;
    }
    error = _oldPassword.error;
    notifyListeners();
  }

  void setNewPassword(String data) {
    RegExp regExp = RegExp(r"^((?=.*[0-9])(?=.*\w)).{6,12}$");
    if (regExp.hasMatch(data)) {
      _newPassword.data = data;
      _newPassword.error = null;
    } else {
      _newPassword.error =
          "Password with 6-12 character, least 1 number, 1 character";
      _newPassword.data = null;
    }
    error = _newPassword.error;
    notifyListeners();
  }

  void setNewPasswordAgain(String data) {
    RegExp regExp = RegExp(r"^((?=.*[0-9])(?=.*\w)).{6,12}$");
    if (regExp.hasMatch(data)) {
      _newPasswordAgain.data = data;
      _newPasswordAgain.error = null;
      if (_newPassword.data == data) {
        _newPasswordAgain.error = null;
        _newPasswordAgain.data = data;
      } else {
        _newPasswordAgain.error = "Not equal new password!";
        _newPasswordAgain.data = null;
      }
    } else {
      _newPasswordAgain.error =
          "Password with 6-12 character, least 1 number, 1 character";
      _newPasswordAgain.data = null;
    }
    error = _newPasswordAgain.error;
    notifyListeners();
  }

  void checkError() {
    List<ValidationField> listValidate = [
      _username,
      _oldPassword,
      _newPassword,
      _newPasswordAgain
    ];
    for (ValidationField validationField in listValidate) {
      if (validationField.error != null) {
        error = validationField.error;
      }
    }
    notifyListeners();
  }

  void setShowOldPassword() {
    showOldPassword = !showOldPassword;
    notifyListeners();
  }

  void setShowNewPassword() {
    showNewPassword = !showNewPassword;
    notifyListeners();
  }

  void setShowNewPasswordAgain() {
    showNewPasswordAgain = !showNewPasswordAgain;
    notifyListeners();
  }
}
