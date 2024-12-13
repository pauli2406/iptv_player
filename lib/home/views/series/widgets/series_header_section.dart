import 'package:auto_route/auto_route.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:play_shift/constants/ui_constants.dart';
import 'package:play_shift/theme.dart';

class SeriesHeaderSection extends StatelessWidget {
  const SeriesHeaderSection({
    super.key,
    required this.ref,
    required this.context,
    required this.title,
    required this.currentTheme,
  });

  final WidgetRef ref;
  final BuildContext context;
  final String title;
  final ThemeMode currentTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: UIConstants.headerHeight,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: FluentTheme.of(context).resources.dividerStrokeColorDefault,
          ),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(FluentIcons.back),
            onPressed: () => context.router.maybePop(),
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style:
                FluentTheme.of(context).navigationPaneTheme.itemHeaderTextStyle,
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(FluentIcons.color),
            onPressed: () =>
                ref.read(appThemeProvider.notifier).setAndPersistThemeMode(
                      currentTheme == ThemeMode.light
                          ? ThemeMode.dark
                          : ThemeMode.light,
                    ),
          ),
        ],
      ),
    );
  }
}
