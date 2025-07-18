import 'package:flutter/material.dart';
import 'package:yasam_beklen/models/user_model.dart';

class LoginViewModel {
  TextEditingController userNameController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final UserModel userModel;

  LoginViewModel({required this.userModel});

  String? passwordValidator(String? e) {
    if (e != userPasswordController.text) {
      return " kullanıcı şifresi yanlış";
    }
    return null;
  }

  String? userNameValidator(String? e) {
    if (e != userNameController.text) {
      return "kullanıcı adı yanlış";
    }
    return null;
  }

  void logincontroller() {
    final String girilenAd = userNameController.text;
    final String girilenSifre = userPasswordController.text;

    if (girilenAd == userModel.email && girilenSifre == userModel.password) {
      SnackBar(
        content: AboutDialog(
          children: [Text("giriş başarılı")],
        ),
      );
    } else {
      SnackBar(
        content: AlertDialog(
          actions: [Text("Girilen bilgiler hatalı")],
        ),
      );
    }
  }
}
