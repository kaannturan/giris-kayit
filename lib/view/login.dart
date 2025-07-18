// ignore_for_file: must_be_immutable, unused_local_variable
import 'package:flutter/material.dart';
import 'package:yasam_beklen/core/widgets.dart/customtextform.dart';
import 'package:yasam_beklen/models/user_model.dart';

class Login extends StatefulWidget {
  const Login({super.key, required this.userModel});

  final UserModel userModel;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void logincontroller() {
    final String girilenAd = userNameController.text;
    final String girilenSifre = userPasswordController.text;

    if (girilenAd == widget.userModel.userName &&
        girilenSifre == widget.userModel.userPassword) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 40,
        title: Text(
          "Giriş Sayfası",
          style: TextStyle(
              fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.teal, Colors.purpleAccent],
              begin: Alignment.topRight,
              end: Alignment.bottomRight),
        ),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                labelText: "kullanıcı adı",
                controller: userNameController,
                validator: (e) {
                  if (e != userNameController.text) {
                    return "kullanıcı adı yanlış";
                  }
                  return null;
                },
              ),
              CustomTextField(
                labelText: "kullanıcı şifresi",
                controller: userPasswordController,
                validator: (e) {
                  if (e != userPasswordController.text) {
                    return " kullanıcı şifresi yanlış";
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {}
                    },
                    child: Text("giriş yap")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
