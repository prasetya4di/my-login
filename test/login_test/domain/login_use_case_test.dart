import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_login/login/domain/impl/login_use_case_impl.dart';
import 'package:my_login/login/domain/login_use_case.dart';
import 'package:my_login/login/model/login_data.dart';
import 'package:my_login/login/repository/login_repository.dart';

import 'login_use_case_test.mocks.dart';

@GenerateMocks([LoginRepository])
void main() {
  group("Test Login Use Case", () {
    LoginRepository mockLoginRepository = MockLoginRepository();
    LoginUseCase loginUseCase = LoginUseCaseImpl(mockLoginRepository);
    test("Return Login data model when success", () async {
      const String expectedToken = "QpwL5tke4Pnpja7X4";
      when(mockLoginRepository.login("username", "password"))
          .thenAnswer((_) async => LoginData(token: expectedToken));
      LoginData value = await loginUseCase.execute("username", "password");
      expect(value, isA<LoginData>());
      expect(value.token, expectedToken);
    });
    test("Throw Fail when an error happen", () async {
      Fail expectedFail = Fail("error from server");
      when(mockLoginRepository.login("username", "password"))
          .thenThrow(expectedFail);
      expect(() => loginUseCase.execute("username", "password"),
          throwsA(expectedFail));
    });
  });
}
