import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:my_login/login/domain/login_use_case.dart';
import 'package:my_login/util/either_extension.dart';

class LoginController extends GetxController {
  final LoginUseCase _loginUseCase;
  RxBool isLoading = false.obs;
  RxString errorMessage = "".obs;
  String _username = "";
  String _password = "";

  LoginController(this._loginUseCase);

  void doLogin() {
    isLoading.value = true;
    Task(() => _loginUseCase.execute(_username, _password))
        .attempt()
        .mapLeftToFailure()
        .run()
        .then((value) => value.fold(
            (l) => errorMessage.value = l.failure.toString(),
            (r) => errorMessage.value = r.token))
        .whenComplete(() => isLoading.value = false);
  }

  set password(String value) {
    _password = value;
  }

  set username(String value) {
    _username = value;
  }
}
