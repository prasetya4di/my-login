import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_login/login/controller/login_controller.dart';

class LoginView extends StatelessWidget {
  final LoginController _loginController = Get.find();

  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Coba Login"),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Obx(() => Column(
              children: [
                TextField(
                  onChanged: (value) => _loginController.username = value,
                ),
                TextField(
                  onChanged: (value) => _loginController.password = value,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                ),
                IgnorePointer(
                  ignoring: _loginController.viewState.value.isLoading,
                  child: TextButton(
                    onPressed: () {
                      _loginController.doLogin();
                    },
                    child: const Text("Login"),
                  ),
                ),
                Text(_loginController.viewState.value.message)
              ],
            )),
      ),
    );
  }
}
