validateEmail(String? value) {
  String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+.@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = RegExp(pattern);
  if (value == null ||
      value.isEmpty ||
      value.length < 5 ||
      !regex.hasMatch(value)) {
    // return 'Enter Valid Email Address';
    return true;
  } else {
    return false;
  }
}

bool validateStructureEmail(String value) {
  String pattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  RegExp regExp = RegExp(pattern);
  // DebugHelper.printAll(regExp.hasMatch(value));
  return regExp.hasMatch(value);
}

validatePhoneNumberField(String? value) {
  // String pattern =
  //     r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+.@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
  //     r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
  //     r"{0,253}[a-zA-Z0-9])?)*$";
  // RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty || value.length < 10) {
    return true;
  } else {
    return false;
  }
}
