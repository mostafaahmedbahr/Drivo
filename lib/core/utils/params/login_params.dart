class LoginParams{
  final String idNumber;
  final String passcode;
  LoginParams({required this.idNumber, required this.passcode});
}


class LoginWithPasswordParams {
  final String password;
  final String number;

  LoginWithPasswordParams({
    required this.password,
    required this.number,
  });

  Map<String, dynamic> toJson() {
    return {
      "password": password,
      "idNumber": number,
    };
  }
}
