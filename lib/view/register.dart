// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:yasam_beklen/core/widgets.dart/customtextform.dart';
import 'package:yasam_beklen/models/user_model.dart';
import 'package:yasam_beklen/view/login.dart';

class Register extends StatelessWidget {
  Register({super.key});

  TextEditingController userName = TextEditingController();
  TextEditingController userPassword = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 40,
        foregroundColor: Colors.white,
        leading: Icon(Icons.home),
        title: Text(
          "Kayıt Sayfası",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [Colors.teal, Colors.purple],
          ),
        ),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                labelText: "kullanıcı adı",
                controller: userName,
                validator: (e) {
                  if (e == null || e.trim().isEmpty) {
                    return ("lütfen kullanıcı adınızı giriniz");
                  }
                  return null;
                },
              ),
              CustomTextField(
                labelText: "kullanıcı şifresi",
                controller: userPassword,
                obscureText: true,
                validator: (e) {
                  if (e == null || e.trim().isEmpty) {
                    return ("lütfen şifrenizi giriniz");
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(
                            userModel: UserModel(
                                userName: userName.text,
                                userPassword: userPassword.text),
                          ),
                        ),
                      );
                    }
                  },
                  child: Text("Kayıt Ol"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
