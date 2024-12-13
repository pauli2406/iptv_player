import 'package:fluent_ui/fluent_ui.dart';
import 'package:play_shift/constants/ui_constants.dart';

class GoToActionButton extends StatelessWidget {
  const GoToActionButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: HoverButton(
        onPressed: () => onPressed(),
        builder: (context, states) {
          return Card(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            backgroundColor: states.isHovered
                ? FluentTheme.of(context).accentColor.lighter
                : FluentTheme.of(context).accentColor,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  FluentIcons.play,
                  size: UIConstants.chipIconSize,
                  color: Colors.white,
                ),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: FluentTheme.of(context)
                      .typography
                      .body
                      ?.copyWith(color: Colors.white),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
