class LoginViewState {
  bool _isLoading = false;
  String message = "";

  bool get isLoading => _isLoading;

  showLoading() {
    _isLoading = true;
  }

  hideLoading() {
    _isLoading = false;
  }
}
