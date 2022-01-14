import 'package:either_dart/either.dart';
import 'package:my_login/login/model/login_failed.dart';
import 'package:my_login/login/model/login_success.dart';

abstract class LoginUseCase {
  Future<Either<LoginFailed, LoginSuccess>> execute(
      String username, String password);
}
