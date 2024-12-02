import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:play_shift/app.dart';
import 'package:play_shift/service/collections/all_schemas.dart';
import 'package:isar/isar.dart';
import 'package:media_kit/media_kit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:platform_builder/platform_builder.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  MediaKit.ensureInitialized();
  Platform.init(
      supportedPlatforms: {Platforms.macOS, Platforms.windows, Platforms.iOS});
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(allSchemas, directory: dir.path);
  await FastCachedImageConfig.init(
    subDir: dir.path,
    clearCacheAfter: const Duration(days: 15),
  );

  if (!kIsWeb) {
    if (Platform.instance.isIOS) {
      await SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    }
  }

  runApp(
    ProviderScope(
      child: App(
        isar: isar,
      ),
    ),
  );
}
