import 'package:formz/formz.dart';

enum TextInputError { empty }

extension TextInputErrorText on TextInputError {
  String text() {
    switch (this) {
      case TextInputError.empty:
        return '''Please enter a value.''';
    }
  }
}

class TextInput extends FormzInput<String, TextInputError> {
  const TextInput.pure({String? value = ''}) : super.pure(value ?? '');

  const TextInput.dirty({String value = ''}) : super.dirty(value);

  @override
  TextInputError? validator(String value) {
    return value.isEmpty ? TextInputError.empty : null;
  }
}
