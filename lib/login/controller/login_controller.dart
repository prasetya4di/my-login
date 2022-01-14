import 'package:either_dart/either.dart';
import 'package:get/get.dart';
import 'package:my_login/login/domain/login_use_case.dart';
import 'package:my_login/login/model/login_failed.dart';
import 'package:my_login/login/model/login_success.dart';

class LoginController extends GetxController {
  final LoginUseCase _loginUseCase = Get.find();
  bool isLoading = false;
  String errorMessage = "";

  void doLogin(String username, String password) async {
    isLoading = true;
    Either<LoginFailed, LoginSuccess> result =
        await _loginUseCase.execute(username, password);
    result.either((failed) => errorMessage = failed.error,
        (success) => print(success.token));
    isLoading = false;
  }
}
