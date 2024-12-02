import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:play_shift/provider/isar/isar_provider.dart';
import 'package:play_shift/router/app_router.dart';
import 'package:play_shift/service/collections/theme/theme.dart';
import 'package:play_shift/theme.dart';
import 'package:isar/isar.dart';
import 'package:fluent_ui/fluent_ui.dart';

class App extends ConsumerStatefulWidget {
  const App({required this.isar, super.key});

  final Isar isar;

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  final appRouter = AppRouter();

  @override
  void initState() {
    super.initState();
    ref.read(getIsarProvider).init(widget.isar);
    final initialTheme = widget.isar.themeCollections.getSync(1) ??
        ThemeCollection(1, ThemeMode.system);
    Future(() => ref.read(appThemeProvider.notifier).set(initialTheme.mode));
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(appThemeProvider);
    return FluentApp.router(
      routerConfig: appRouter.config(),
      title: 'Play Shift',
      themeMode: theme,
      darkTheme: FluentThemeData.dark(),
      theme: FluentThemeData.light(),
      debugShowCheckedModeBanner: false,
    );
  }
}
