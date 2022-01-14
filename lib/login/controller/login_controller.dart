import 'package:either_dart/either.dart';
import 'package:get/get.dart';
import 'package:my_login/login/domain/login_use_case.dart';

class LoginController extends GetxController {
  final LoginUseCase _loginUseCase = Get.find();
  RxBool isLoading = false.obs;
  RxString errorMessage = "".obs;
  String _username = "";
  String _password = "";

  void doLogin() async {
    isLoading.value = true;
    _loginUseCase
        .execute(_username, _password)
        .either((failed) => errorMessage.value = failed.error,
            (success) => errorMessage.value = success.token)
        .catchError((value) {
      errorMessage.value = "Failed when get data from API";
    }).whenComplete(() => isLoading.value = false);
  }

  set password(String value) {
    _password = value;
  }

  set username(String value) {
    _username = value;
  }
}
