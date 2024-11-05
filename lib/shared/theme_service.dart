import 'package:fluent_ui/fluent_ui.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:platform_builder/platform.dart';

class ThemeService {
  // Load hoverColor from MacosTheme if mac or from FluentTheme if windows. to check if max use Platform.instance.isMacOS

  Color defaultBackground(BuildContext context) => Platform.instance.isMacOS
      ? MacosTheme.of(context).canvasColor
      : FluentTheme.of(context).scaffoldBackgroundColor;

  TextStyle? textStyleCaption(BuildContext context) => Platform.instance.isMacOS
      ? MacosTheme.of(context).typography.caption1
      : FluentTheme.of(context).typography.caption;

  TextStyle? textStyleBody(BuildContext context) => Platform.instance.isMacOS
      ? MacosTheme.of(context).typography.body
      : FluentTheme.of(context).typography.body;
}
