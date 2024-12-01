import 'package:fluent_ui/fluent_ui.dart';

class ThemeService {
  Color hoverBackgroundColor(BuildContext context) =>
      FluentTheme.of(context).resources.cardBackgroundFillColorSecondary;

  Color defaultBackground(BuildContext context) =>
      FluentTheme.of(context).resources.cardBackgroundFillColorDefault;

  TextStyle? textStyleCaption(BuildContext context) =>
      FluentTheme.of(context).typography.caption?.copyWith(
            color: FluentTheme.of(context).resources.textFillColorPrimary,
          );

  TextStyle? textStyleBody(BuildContext context) =>
      FluentTheme.of(context).typography.body?.copyWith(
            color: FluentTheme.of(context).resources.textFillColorPrimary,
          );

  TextStyle? textStyleEpg(BuildContext context) =>
      FluentTheme.of(context).typography.caption?.copyWith(
            color: FluentTheme.of(context).resources.textFillColorSecondary,
            fontSize: 11,
          );

  bool isDarkMode(BuildContext context) {
    return FluentTheme.of(context).brightness == Brightness.dark;
  }
}
