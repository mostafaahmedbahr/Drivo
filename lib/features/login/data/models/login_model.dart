
class LoginModel {
  String? code;
  String? role;
  String? token;

  LoginModel({this.code, this.role, this.token});

  LoginModel.fromJson(Map<String, dynamic> json) {
    code = json["code"];
    role = json["role"];
    token = json["token"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    _data["role"] = role;
    _data["token"] = token;
    return _data;
  }
}