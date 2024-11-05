import 'package:formz/formz.dart';

enum PortInputError { empty, invalid }

extension PortInputErrorPort on PortInputError {
  String text() {
    switch (this) {
      case PortInputError.invalid:
        return 'Please ensure the port entered is valid';
      case PortInputError.empty:
        return 'Please enter a value for an Port.';
    }
  }
}

class PortInput extends FormzInput<String, PortInputError> {
  const PortInput.pure({String? value = ''}) : super.pure(value ?? '');

  const PortInput.dirty({String value = ''}) : super.dirty(value);

  static final _urlPortRegExp = RegExp(
    r'^((6553[0-5])|(655[0-2][0-9])|(65[0-4][0-9]{2})|(6[0-4][0-9]{3})|([1-5][0-9]{4})|([0-5]{0,5})|([0-9]{1,4}))$',
  );

  @override
  PortInputError? validator(String value) {
        if (value.isEmpty) {
      return PortInputError.empty;
    }
    return _urlPortRegExp.hasMatch(value) ? null : PortInputError.invalid;
  }
}
