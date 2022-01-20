import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_login/login/controller/login_controller.dart';
import 'package:my_login/login/domain/impl/login_use_case_impl.dart';
import 'package:my_login/login/domain/login_use_case.dart';
import 'package:my_login/login/repository/impl/login_repository_impl.dart';
import 'package:my_login/login/repository/login_repository.dart';
import 'package:my_login/login/view/login_view.dart';

void main() async {
  Get.lazyPut(() => GetConnect()..baseUrl = "https://reqres.in/api");
  Get.lazyPut<LoginRepository>(() => LoginRepositoryImpl(Get.find()));
  Get.lazyPut<LoginUseCase>(() => LoginUseCaseImpl(Get.find()));
  Get.lazyPut(() => LoginController(Get.find()));
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: LoginView(),
    );
  }
}
