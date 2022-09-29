import 'package:firebase_project/core/constants/regExp_constant.dart';

extension RegExpExtension on String {
  bool matches(String regExp) => RegExp(regExp).hasMatch(this);

  bool get isValidEmail => matches(RegExpConstant.regExpEmail);

  bool get isValidPassword => matches(RegExpConstant.regExpPassword);

  bool isLength(int passwordLength) => passwordLength >= 6;
}

extension NullableStringExtension on String? {
  bool get isNullOrEmpty => this?.isEmpty ?? false;

  bool get isNotNullOrEmpty => !isNotNullOrEmpty;
}
