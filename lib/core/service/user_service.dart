import 'dart:convert';

import 'package:yasam_beklen/core/service/main_service.dart';
import 'package:yasam_beklen/models/user_model.dart';

class UserService {
  MainService mainService = MainService.instance;

  Future<UserModel> login(UserModel userModel) async {
    final response = await mainService.post(endpoint: "login", body: userModel.toJson());
    try {
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return UserModel.fromJson(data);
      } else {
        throw Exception("Login failed with status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error during login: $e");
    }
  }

  Future<UserModel> register(UserModel userModel) async {
    final response = await mainService.post(endpoint: "register", body: userModel.toRegisterJson());
    try {
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return UserModel.fromJson(data);
      } else {
        throw Exception("Registration failed with status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error during registration: $e");
    }
  }
}
