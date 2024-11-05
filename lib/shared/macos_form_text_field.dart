import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

class MacOsFormTextField extends StatelessWidget {
  const MacOsFormTextField(
      {required this.controller,
      required this.showError,
      required this.errorText,
      required this.placeholder,
      this.obscureText = false,
      super.key});

  final TextEditingController controller;
  final bool showError;
  final String? errorText;
  final String? placeholder;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return FormField(
      builder: (FormFieldState<String> state) {
        return Column(
          children: [
            MacosTextField(
              placeholder: placeholder,
              controller: controller,
              obscureText: obscureText,
              
            ),
            Offstage(
              offstage: showError,
              child: Text(
                errorText ?? "",
                style: const TextStyle(
                  color: CupertinoColors.systemRed,
                  fontSize: 11,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
