class RegisterParams {
  final String name;
  final String idType;
  final String nationality;
  final String idNumber;
  final String phoneNumber;
  final String email;
  final String address;
  final String prefixPhoneNumber;
  final String birthDateHijri;
  final String birthDate;
  final bool hasMobileApp;
  final String password;
  final bool isCompanyRenter;
  final String company;

  RegisterParams({
    required this.name,
    required this.idType,
    required this.nationality,
    required this.idNumber,
    required this.phoneNumber,
    required this.email,
    required this.address,
    required this.prefixPhoneNumber,
    required this.birthDateHijri,
    required this.birthDate,
    required this.hasMobileApp,
    required this.password,
    required this.isCompanyRenter,
    required this.company,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "idType": idType,
      "nationality": nationality,
      "idNumber": idNumber,
      "phoneNumber": phoneNumber,
      "email": email,
      "address": address,
      "prefixPhoneNumber": prefixPhoneNumber,
      "birthDateHijri": birthDateHijri,
      "birthDate": birthDate,
      "hasMobileApp": hasMobileApp,
      "password": password,
      "isCompanyRenter": isCompanyRenter,
      "company": company,
    };
  }
}
