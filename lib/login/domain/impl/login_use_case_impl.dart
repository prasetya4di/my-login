import 'package:either_dart/src/either.dart';
import 'package:get/get.dart';
import 'package:my_login/login/domain/login_use_case.dart';
import 'package:my_login/login/model/login_failed.dart';
import 'package:my_login/login/model/login_success.dart';
import 'package:my_login/login/repository/login_repository.dart';

class LoginUseCaseImpl implements LoginUseCase {
  LoginRepository loginRepository = Get.find();

  @override
  Future<Either<LoginFailed, LoginSuccess>> execute(
      String username, String password) {
    return loginRepository.login(username, password);
  }
}
