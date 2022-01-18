import 'package:my_login/login/model/login_data.dart';

abstract class LoginUseCase {
  Future<LoginData> execute(String username, String password);
}
