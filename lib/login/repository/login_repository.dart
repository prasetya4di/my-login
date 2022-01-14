import 'package:either_dart/either.dart';
import 'package:get/get.dart';
import 'package:my_login/login/model/login_failed.dart';
import 'package:my_login/login/model/login_success.dart';

abstract class LoginRepository extends GetConnect {
  Future<Either<LoginFailed, LoginSuccess>> login(
      String username, String password);
}
