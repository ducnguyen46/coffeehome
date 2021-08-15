import 'package:coffeehome/ui/authenticate/model/validation_field.dart';
import 'package:flutter/material.dart';

class SignInValidate with ChangeNotifier {
  var _fullname = ValidationField(error: null, data: null);
  var _username = ValidationField(error: null, data: null);
  var _email = ValidationField(error: null, data: null);
  var _password = ValidationField(error: null, data: null);

  var _isObscureText = true;
  String? _dateBirth;
  String? _error;

  init() {
    _fullname = ValidationField(error: null, data: null);
    _username = ValidationField(error: null, data: null);
    _email = ValidationField(error: null, data: null);
    _password = ValidationField(error: null, data: null);

    _isObscureText = true;
    _dateBirth = null;
    _error = null;
    notifyListeners();
  }

  ValidationField get fullname => _fullname;
  ValidationField get username => _username;
  ValidationField get email => _email;
  ValidationField get password => _password;
  bool get isObscureText => _isObscureText;
  String? get error => _error;
  String? get dateBirth => _dateBirth;

  String regexFullname = r"^[a-zA-Z ]+$";
  String regexUsername = r"^(?=.*[a-zA-Z]{1,})(?=.*[\d]{0,})[a-zA-Z0-9]{1,}$";
  String regexEmail = r"^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$";
  String regexPhone = r"^([1-9]){1}([0-9]){8}$";
  String regexPass = r"^((?=.*[0-9])(?=.*\w)).{6,12}$";

  void setFullname(String data) {
    RegExp regExp = RegExp(regexFullname);
    if (regExp.hasMatch(data)) {
      _fullname.data = data;
      _fullname.error = null;
    } else {
      _fullname.error = "Invalid full name";
      _fullname.data = null;
    }
    _error = _fullname.error;
    notifyListeners();
  }

  void setUsername(String data) {
    RegExp regExp = RegExp(regexUsername);
    if (regExp.hasMatch(data)) {
      _username.data = data;
      _username.error = null;
    } else {
      _username.error = "Invalid username. Least 1 character";
      _username.data = null;
    }
    _error = _username.error;
    notifyListeners();
  }

  void setEmail(String data) {
    RegExp regExp = RegExp(regexEmail);
    if (regExp.hasMatch(data)) {
      _email.data = data;
      _email.error = null;
    } else {
      _email.error = "Invalid email. Ex: abc@example.com";
      _email.data = null;
    }
    _error = _email.error;
    notifyListeners();
  }

  void setPassword(String data) {
    RegExp regExp = RegExp(regexPass);
    if (regExp.hasMatch(data)) {
      _password.data = data;
      _password.error = null;
    } else {
      _password.error =
          "Password with 6-12 character, least 1 number, 1 character";
      _password.data = null;
    }
    _error = _password.error;
    notifyListeners();
  }

  void setDateBirth(String data) {
    _dateBirth = data;
    notifyListeners();
  }

  void setOnShowPassword() {
    _isObscureText = !_isObscureText;
    notifyListeners();
  }

  bool isValidLogin() {
    if (_username.data == null || _password.data == null) {
      return false;
    }
    return true;
  }

  bool isValidSignUp() {
    if (_fullname.data == null ||
        _username.data == null ||
        _password.data == null ||
        _email.data == null ||
        _dateBirth == null) {
      return false;
    }
    return true;
  }
}
