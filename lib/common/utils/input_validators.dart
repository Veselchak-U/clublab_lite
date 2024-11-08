import 'package:clublab_lite/app/l10n/l10n.dart';

typedef ValidatorFunction = String? Function(String?);

class InputValidators {
  static String? complexValidator(String? value, List<ValidatorFunction> validators) {
    for (final validator in validators) {
      final result = validator(value);

      if (result != null) return result;
    }

    return null;
  }

  static String? emptyValidator(String? value) {
    if (value == null || value.trim().isEmpty) return l10n?.requiredFieldError;

    return null;
  }

  static String? mobilePhoneValidator(String? value) {
    if (value == null || value.isEmpty) return null;

    if (value.length < 9) return l10n?.phoneRequires;

    return null;
  }

  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) return null;

    // final emailRegex = RegExp(r"^[a-zA-Z0-9.!#$%&'*+=^`()~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    final valid = emailRegex.hasMatch(value ?? '');
    if (!valid) return l10n?.invalid_email_address ?? '';

    return null;
  }
}
