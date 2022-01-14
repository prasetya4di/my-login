import 'package:either_dart/either.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:my_login/login/model/login_failed.dart';
import 'package:my_login/login/model/login_success.dart';
import 'package:my_login/login/repository/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  @override
  Future<Either<LoginFailed, LoginSuccess>> login(
      String username, String password) async {
    Response response =
        await post("login", {"username": username, "password": password});
    return Either.condLazy(
        response.statusCode == HttpStatus.ok,
        () => LoginFailed.fromJson(response.body),
        () => LoginSuccess.fromJson(response.body));
  }
}
