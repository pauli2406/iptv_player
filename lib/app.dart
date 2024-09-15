import 'package:flutter/material.dart' show ThemeMode;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iptv_player/provider/isar/isar_provider.dart';
import 'package:iptv_player/router/router.dart';
import 'package:iptv_player/service/collections/theme/theme.dart';
import 'package:iptv_player/theme.dart';
import 'package:isar/isar.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:platform_builder/platform_builder.dart';

class App extends ConsumerStatefulWidget {
  const App({required this.isar, super.key});

  final Isar isar;

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
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
    return PlatformBuilder(
      macOSBuilder: (context) => _buildApp(),
      windowsBuilder: (context) => _buildApp(),
      iOSBuilder: (context) => SafeArea(child: _buildApp()),
    );
  }

  MacosApp _buildApp() {
    final theme = ref.watch(appThemeProvider);
    return MacosApp.router(
      routerConfig: router,
      title: 'iptv_player',
      themeMode: theme,
      debugShowCheckedModeBanner: false,
    );
  }
}
