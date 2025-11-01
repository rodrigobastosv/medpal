const validEmailRegExp = r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+(?:\.[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+)*@[a-zA-Z0-9-]+(?:\.[a-zA-Z]{2,})+\s*$";

abstract class MPValidators {
  static bool isEmailValid(String? email) {
    if (email == null) {
      return false;
    }
    return RegExp(validEmailRegExp).firstMatch(email)?[0] == email;
  }

  static String? emailValidator(String? email, {required String errorMessage}) => isEmailValid(email) ? null : errorMessage;

  static String? matchingPasswordsValidator(String? password, String? passwordConfirmation, {required String matchingErrorMessage}) {
    if (password != passwordConfirmation) {
      return matchingErrorMessage;
    }
    return null;
  }
}
