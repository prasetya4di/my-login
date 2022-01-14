/// error : "missing password"

class LoginFailed {
  late String error;

  LoginFailed({required this.error});

  LoginFailed.fromJson(dynamic json) {
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = error;
    return map;
  }
}
