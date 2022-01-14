import 'package:get/get.dart';
import 'package:my_login/login/repository/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  @override
  Future<Response> login({required String username, required String password}) {
    return post("login", {"username": username, "password": password});
  }
}
