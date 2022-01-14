import 'package:either_dart/either.dart';
import 'package:my_login/login/model/login_failed.dart';
import 'package:my_login/login/model/login_success.dart';

abstract class LoginRepository {
  Future<Either<LoginFailed, LoginSuccess>> login(
      String username, String password);
}
