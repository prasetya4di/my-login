import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_login/login/controller/login_controller.dart';
import 'package:my_login/login/domain/impl/login_use_case_impl.dart';
import 'package:my_login/login/domain/login_use_case.dart';
import 'package:my_login/login/model/login_data.dart';
import 'package:my_login/login/repository/login_repository.dart';

import '../domain/login_use_case_test.mocks.dart';
import 'login_controller_test.mocks.dart';

@GenerateMocks([LoginUseCase])
void main() {
  group("Test Login Use Case", () {
    String username = "username";
    String password = "password";

    test("Login controller should set token when success get data", () async {
      LoginUseCase mockLoginUseCase = MockLoginUseCase();
      LoginController loginController = LoginController(mockLoginUseCase)
        ..username = username
        ..password = password;
      const String expectedToken = "QpwL5tke4Pnpja7X4";
      when(mockLoginUseCase.execute(username, password))
          .thenAnswer((_) async => LoginData(token: expectedToken));
      await loginController.doLogin();
      expect(loginController.viewState.value.message, expectedToken);
    });
    test("Login controller should set message with failure message", () async {
      Fail expectedFail = Fail("error from server");
      LoginRepository mockLoginRepository = MockLoginRepository();
      LoginUseCase mockLoginUseCase = LoginUseCaseImpl(mockLoginRepository);
      LoginController loginController = LoginController(mockLoginUseCase)
        ..username = username
        ..password = password;
      when(mockLoginRepository.login(username, password))
          .thenThrow(expectedFail);
      await loginController.doLogin();
      expect(loginController.viewState.value.message, expectedFail.failure);
    });
  });
}
