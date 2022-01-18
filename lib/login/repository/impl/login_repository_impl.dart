import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:my_login/login/model/login_data.dart';
import 'package:my_login/login/repository/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  @override
  Future<LoginData> login(String username, String password) async {
    try {
      Response response = await GetConnect().post("https://reqres.in/api/login",
          {"username": username, "password": password});
      if (response.statusCode != HttpStatus.ok) {
        throw Fail("Username atau password salah");
      }
      return LoginData.fromJson(response.body);
    } on SocketException {
      throw Fail('No Internet connection 😑');
    } on FormatException {
      throw Fail("Bad response format 👎");
    } on Exception {
      throw Fail("Username atau password salah");
    }
  }
}
