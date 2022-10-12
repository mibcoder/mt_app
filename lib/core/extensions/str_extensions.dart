extension extString on String {

  /*

  ^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$


  This regex will enforce these rules:

  At least one upper case English letter, (?=.*?[A-Z])
  At least one lower case English letter, (?=.*?[a-z])
  At least one digit, (?=.*?[0-9])
  At least one special character, (?=.*?[#?!@$%^&*-])
  Minimum eight in length .{8,} (with the anchors)

   */
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName{
    //r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$"
    final nameRegExp = RegExp(r'^(?=.*?[a-zA-Z]).{3,}$');
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassport{
    final passwordRegExp = RegExp(r'^(?!^0+$)[a-zA-Z0-9]{3,20}$');
    return passwordRegExp.hasMatch(this);
  }
  bool get isValidEMEI{
    final phoneRegExp = RegExp(r"^\d{15,17}$");
    return phoneRegExp.hasMatch(this);
  }

}