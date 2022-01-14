/// token : "QpwL5tke4Pnpja7X4"

class LoginSuccess {
  late String token;

  LoginSuccess({required this.token});

  LoginSuccess.fromJson(dynamic json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    return map;
  }
}
