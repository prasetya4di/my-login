/// token : "QpwL5tke4Pnpja7X4"

class LoginData {
  late String token;

  LoginData({required this.token});

  LoginData.fromJson(dynamic json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    return map;
  }
}
