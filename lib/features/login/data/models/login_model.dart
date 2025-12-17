
class LoginModel {
  int? renterId;
  String? token;
  String? name;

  LoginModel({this.renterId, this.token, this.name});

  LoginModel.fromJson(Map<String, dynamic> json) {
    renterId = json["renterId"];
    token = json["token"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["renterId"] = renterId;
    _data["token"] = token;
    _data["name"] = name;
    return _data;
  }
}