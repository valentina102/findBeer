bool emailValidation(String? text) {
  const p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  final regExp = RegExp(p);
  return regExp.hasMatch(text ?? "");
}

bool passwordValidation(String? text) {
  const p = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W\_])[A-Za-z\d\W\_]{8,}$';
  final regExp = RegExp(p);
  return regExp.hasMatch(text ?? "");
}

  bool isPhoneValid(String text) {
    const p = r'^[0-9]{1,}$';
    final regExp = RegExp(p);
    return regExp.hasMatch(text);
  }
  bool isNotNull(String? text) {
    return text != null;
  }

  bool isNameValid(String text) {
    const p = r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$";
    final regExp = RegExp(p);
    return regExp.hasMatch(p);
  }

  bool arePasswordsMatching({
    required String password,
    required String repPassword,
  }) {
    return password == repPassword;
  }

