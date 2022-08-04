import 'package:form_field_validator/form_field_validator.dart';

class UnifiedValidators {
  static MultiValidator registerEmailValidator = MultiValidator([
    RequiredValidator(errorText: 'Please enter your email'),
    EmailValidator(errorText: 'Please enter a valid email'),
  ]);

  static MultiValidator emailValidator = MultiValidator([
    EmailValidator(errorText: 'Please enter a valid email'),
  ]);

  static MultiValidator registerPasswordValidator = MultiValidator([
    RequiredValidator(errorText: 'Please enter a password'),
    MinLengthValidator(6, errorText: 'Password must be at least 6 characters'),
    // PatternValidator(r'(?=.*?[#?!@$%^&*-])',
    //     errorText: 'Password must contain at least 1 special character')
  ]);
  static MultiValidator emptyValidator = MultiValidator([
    RequiredValidator(errorText: 'Field cannot be empty'),
  ]);

  static RequiredValidator emptyValidatorCustomPrompt(String errorText) {
    return RequiredValidator(errorText: errorText);
  }

  static MultiValidator loginPasswordValidator = MultiValidator([
    RequiredValidator(errorText: 'Please enter a password'),
    MinLengthValidator(6,
        errorText: 'The password must be at least 6 characters in length'),
  ]);

  static MultiValidator registerUsernameValidator = MultiValidator([
    RequiredValidator(errorText: 'Please enter a password'),
    MinLengthValidator(3, errorText: 'The password is too short (min:3)'),
    MaxLengthValidator(12, errorText: 'The password is too long (max: 12)')
  ]);
}
