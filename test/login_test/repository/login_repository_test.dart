import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_connect.dart';
import 'package:my_login/login/model/login_data.dart';
import 'package:my_login/login/repository/impl/login_repository_impl.dart';
import 'package:my_login/login/repository/login_repository.dart';

import '../../mock/mock_get_connect.dart';

void main() {
  group("Test Login", () {
    test("Return Login data model when success", () async {
      const String expectedToken = "QpwL5tke4Pnpja7X4";
      GetConnect connect = MockGetConnect()
        ..mockResponse =
            const Response(statusCode: 200, body: {"token": expectedToken});
      LoginRepository loginRepository = LoginRepositoryImpl(connect);
      LoginData result = await loginRepository.login("pras", "password");
      expect(result, isA<LoginData>());
      expect(result.token, expectedToken);
    });
    test("Throw Fail when an error happen", () async {
      Fail expectedFail = Fail("error from server");
      GetConnect connect = MockGetConnect()..mockFail = expectedFail;
      LoginRepository loginRepository = LoginRepositoryImpl(connect);
      expect(() => loginRepository.login("pras", "password"),
          throwsA(expectedFail));
    });
  });
}
