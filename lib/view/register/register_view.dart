// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:yasam_beklen/core/components/customtextform.dart';
import 'package:yasam_beklen/models/user_model.dart';
import 'package:yasam_beklen/view/register/register_view_model.dart';

class Register extends StatelessWidget {
  Register({super.key});

  final RegisterViewModel viewModel = RegisterViewModel();

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
          style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
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
          key: viewModel.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                labelText: "kullanıcı adı",
                controller: viewModel.userMail,
                validator: (e) => viewModel.usernameValidator(e),
              ),
              CustomTextField(
                labelText: "kullanıcı şifresi",
                controller: viewModel.userPassword,
                obscureText: true,
                validator: (e) => viewModel.passwordValidator(e),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (viewModel.formKey.currentState!.validate()) {
                      UserModel userModel = UserModel(
                        email: viewModel.userMail.text,
                        password: viewModel.userPassword.text,
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
