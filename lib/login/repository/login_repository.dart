import 'package:my_login/login/model/login_data.dart';

abstract class LoginRepository {
  Future<LoginData> login(String username, String password);
}
