class Validations {
  static String? emailValidation(String? value) {
    RegExp emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    if (value == null || !emailRegExp.hasMatch(value)) {
      return 'Enter a correct email address';
    } else {
      return null;
    }
  }

  static String? emtyValidation(String? value) {
    if (value == null || value.trim() == '') {
      return 'fill the feild ';
    } else {
      return null;
    }
  }
}
