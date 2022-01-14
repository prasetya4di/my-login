import 'package:get/get.dart';

abstract class LoginRepository extends GetConnect {
  Future<Response> login({required String username, required String password});
}
