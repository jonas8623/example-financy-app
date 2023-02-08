
import 'dart:developer';

mixin Validator {

  String? validatorName(String? value) {
    if(value != null && value.isEmpty) {
      return "O campo não pode ser nulo";
    }
    return null;
  }

  String? validatorEmail(String? value) {
    final conditionRegExp = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    if(value != null && value.isEmpty) {
      return "O campo não pode ser nulo";

    } else if(value != null && !conditionRegExp.hasMatch(value)) {
      return "O campo está incorreto";

    }
    return null;
  }

  String? validatorPassword(String? value) {

    if(value != null && value.isEmpty) {
      return "O campo não pode ser nulo";

    } else if(value != null && value.length <= 4) {
      return "O campo está incorreto";

    }
    return null;
  }

  String? validatorConfirmPassword(String? value1, String? value2) {

    if(value1 != value2) {
      return "As senhas são diferentes. Por favor corrija";
    }


    return null;
  }

}