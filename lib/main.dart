import 'dart:convert';

import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iptv_player/app.dart';
import 'package:iptv_player/service/collections/all_schemas.dart';
import 'package:iptv_player/video_player/video_player.dart';
import 'package:isar/isar.dart';
import 'package:media_kit/media_kit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:platform_builder/platform_builder.dart';
import 'package:window_manager/window_manager.dart';

const _windowOptions = WindowOptions(
  size: Size(1440, 900),
  center: true,
  backgroundColor: Colors.transparent,
  skipTaskbar: false,
  titleBarStyle: TitleBarStyle.hidden,
);

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  MediaKit.ensureInitialized();
  Platform.init(
      supportedPlatforms: {Platforms.macOS, Platforms.windows, Platforms.iOS});

  if (Platform.instance.isMacOS || Platform.instance.isWindows) {
    await windowManager.ensureInitialized();

    if (args.firstOrNull == 'multi_window') {
      final arguments = args[2].isEmpty
          ? const {}
          : jsonDecode(args[2]) as Map<String, dynamic>;
      if (arguments.containsValue('player')) {
        final link = arguments['link'];
        final epgTitle = arguments['epgTitle'];
        runApp(
          ProviderScope(
            child: VideoPlayer(
              videoUrl: link,
              epgTitle: epgTitle,
            ),
          ),
        );
      }
      windowManager.waitUntilReadyToShow(_windowOptions, () async {
        await windowManager.show();
        await windowManager.focus();
      });
    } else {
      await _initApp();
    }
  } else {
    await _initApp();
  }
}

Future<void> _initApp() async {
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(allSchemas, directory: dir.path);
  await FastCachedImageConfig.init(
    subDir: dir.path,
    clearCacheAfter: const Duration(days: 15),
  );
  runApp(
    ProviderScope(
      child: App(
        isar: isar,
      ),
    ),
  );
}