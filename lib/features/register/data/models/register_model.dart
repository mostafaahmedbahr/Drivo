
class RegisterModel {
  int? renterId;
  String? name;
  String? idType;
  String? nationality;
  String? idNumber;
  String? phoneNumber;
  String? birthDate;
  String? birthDateHijri;
  bool? isCompanyRenter;
  dynamic companyName;

  RegisterModel({this.renterId, this.name, this.idType, this.nationality, this.idNumber, this.phoneNumber, this.birthDate, this.birthDateHijri, this.isCompanyRenter, this.companyName});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    renterId = json["renterId"];
    name = json["name"];
    idType = json["idType"];
    nationality = json["nationality"];
    idNumber = json["idNumber"];
    phoneNumber = json["phoneNumber"];
    birthDate = json["birthDate"];
    birthDateHijri = json["birthDateHijri"];
    isCompanyRenter = json["isCompanyRenter"];
    companyName = json["companyName"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["renterId"] = renterId;
    _data["name"] = name;
    _data["idType"] = idType;
    _data["nationality"] = nationality;
    _data["idNumber"] = idNumber;
    _data["phoneNumber"] = phoneNumber;
    _data["birthDate"] = birthDate;
    _data["birthDateHijri"] = birthDateHijri;
    _data["isCompanyRenter"] = isCompanyRenter;
    _data["companyName"] = companyName;
    return _data;
  }
}