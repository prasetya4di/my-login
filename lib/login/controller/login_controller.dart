import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:my_login/login/domain/login_use_case.dart';
import 'package:my_login/login/state/login_view_state.dart';
import 'package:my_login/util/either_extension.dart';

class LoginController extends GetxController {
  final LoginUseCase _loginUseCase;
  RxObjectMixin<LoginViewState> viewState = LoginViewState().obs;
  String _username = "";
  String _password = "";

  LoginController(this._loginUseCase);

  doLogin() {
    viewState.value.showLoading();
    Task(() => _loginUseCase.execute(_username, _password))
        .attempt()
        .mapLeftToFailure()
        .run()
        .then((value) => value.fold(
            (l) => viewState.value.message = l.failure.toString(),
            (r) => viewState.value.message = r.token))
        .then((_) => viewState.refresh())
        .whenComplete(() => viewState.value.hideLoading());
  }

  set password(String value) {
    _password = value;
  }

  set username(String value) {
    _username = value;
  }
}
