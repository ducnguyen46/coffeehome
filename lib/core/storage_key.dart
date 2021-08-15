import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserStorageInfo {
  static const String USER_TOKEN = "user_token";
  static const String USER_NAME = "username";
  static const String USER_PASSWORD = "user_password";

  Future<void> saveToken(String token) async {
    final storage = new FlutterSecureStorage();
    await storage.write(key: USER_TOKEN, value: token);
  }

  Future<String?> getToken() async {
    final storage = new FlutterSecureStorage();
    String? token = await storage.read(key: USER_TOKEN);
    return token;
  }

  Future<void> saveUsernamePassword(String username, String password) async {
    final storage = new FlutterSecureStorage();
    await storage.write(key: USER_NAME, value: username);
    await storage.write(key: USER_PASSWORD, value: password);
  }

  Future<Map<String, dynamic>> getUsernamePassword() async {
    final storage = new FlutterSecureStorage();
    String? username = await storage.read(key: USER_NAME);
    String? password = await storage.read(key: USER_PASSWORD);

    return <String, dynamic>{
      "username": username ?? null,
      "password": password ?? null
    };
  }

  Future<void> delete() async {
    final storage = new FlutterSecureStorage();
    await storage.deleteAll();
  }
}
