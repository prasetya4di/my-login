import 'package:my_login/login/domain/login_use_case.dart';
import 'package:my_login/login/model/login_data.dart';
import 'package:my_login/login/repository/login_repository.dart';

class LoginUseCaseImpl implements LoginUseCase {
  LoginRepository loginRepository;

  LoginUseCaseImpl(this.loginRepository);

  @override
  Future<LoginData> execute(String username, String password) async {
    return await loginRepository.login(username, password);
  }
}
