import 'package:flutter/material.dart';

class RegisterViewModel {
  TextEditingController userMail = TextEditingController();
  TextEditingController userPassword = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? usernameValidator(String? e) {
    if (e == null || e.trim().isEmpty) {
      return ("lütfen kullanıcı adınızı giriniz");
    }
    return null;
  }

  String? passwordValidator(String? e) {
    if (e == null || e.trim().isEmpty) {
      return ("lütfen şifrenizi giriniz");
    }
    return null;
  }
}
