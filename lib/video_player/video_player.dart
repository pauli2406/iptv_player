import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:window_manager/window_manager.dart';

class VideoPlayer extends ConsumerStatefulWidget {
  const VideoPlayer({
    required this.videoUrl,
    required this.epgTitle,
    super.key,
  });

  final String videoUrl;
  final String epgTitle;

  @override
  ConsumerState<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends ConsumerState<VideoPlayer> with WindowListener {
  final Player player = Player(
    configuration: const PlayerConfiguration(
      logLevel: MPVLogLevel.warn,
      title: 'IPTV Player',
    ),
  );
  late VideoController videoController;

  @override
  void initState() {
    super.initState();
    windowManager.addListener(this);
    videoController = VideoController(player);
    player.open(
      Media(widget.videoUrl),
    );
  }

  @override
  void dispose() {
    debugPrint('Disposing [Player] and [VideoController]...');
    player.dispose();
    super.dispose();
  }

  @override
  void onWindowClose() async {
    dispose();
    super.onWindowClose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Navigator.of(context).userGestureInProgress) {
          return false;
        } else {
          return true;
        }
      },
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            centerTitle: true,
            title: Text(
              widget.epgTitle,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          body: Video(
            controller: videoController,
          ),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
