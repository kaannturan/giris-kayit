// ignore_for_file: must_be_immutable, unused_local_variable
import 'package:flutter/material.dart';
import 'package:yasam_beklen/core/components/customtextform.dart';
import 'package:yasam_beklen/core/service/user_service.dart';
import 'package:yasam_beklen/models/user_model.dart';
import 'package:yasam_beklen/view/login/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key, required this.viewModel});

  final LoginViewModel viewModel;

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 40,
        title: Text(
          "Giriş Sayfası",
          style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.teal, Colors.purpleAccent], begin: Alignment.topRight, end: Alignment.bottomRight),
        ),
        child: Form(
          key: widget.viewModel.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                labelText: "kullanıcı adı",
                controller: widget.viewModel.userNameController,
                validator: (e) => widget.viewModel.userNameValidator(e),
              ),
              CustomTextField(
                labelText: "kullanıcı şifresi",
                controller: widget.viewModel.userPasswordController,
                validator: (e) => widget.viewModel.passwordValidator(e),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                    onPressed: () async {
                      if (widget.viewModel.formKey.currentState!.validate()) {
                        // widget.viewModel.logincontroller();
                        UserService userService = UserService();
                        UserModel userModel = UserModel(
                          email: widget.viewModel.userNameController.text,
                          password: widget.viewModel.userPasswordController.text,
                        );
                        final result = await userService.login(userModel);
                      }
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
