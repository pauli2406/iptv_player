import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iptv_player/provider/isar/m3u_provider.dart';
import 'package:iptv_player/video_player/overlay_channel_list.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

class VideoPlayer extends ConsumerStatefulWidget {
  const VideoPlayer({
    required this.streamId,
    super.key,
  });

  final int streamId;

  @override
  ConsumerState<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends ConsumerState<VideoPlayer> {
  late int _currentStreamId;
  final Player player = Player(
    configuration: const PlayerConfiguration(
      logLevel: MPVLogLevel.debug,
      title: 'IPTV Player',
      bufferSize: 64 * 1024 * 1024,
    ),
  )..stream.log.listen((log) => debugPrint(log.toString()));

  late VideoController videoController;
  bool _showOverlay = false;

  @override
  void initState() {
    super.initState();
    _currentStreamId = widget.streamId;
    videoController = VideoController(player);
    final link = ref.read(findChannelProvider(streamId: widget.streamId)).link;

    if (player.platform is NativePlayer) {
      (player.platform as dynamic)
          .setProperty('vd-lavc-software-fallback', '5000');
    }
    player.open(
      Media(link),
    );

    // player.stream.playing.listen((playing) {
    //   debugPrint('Player is playing: $playing');
    //   if (!playing) player.play();
    // });

    // Listen to the onError event
    player.stream.completed.listen((error) {
      debugPrint('Player error: $error');
      // Restart the stream
      player.play();
    });
  }

  @override
  void dispose() {
    debugPrint('Disposing [Player] and [VideoController]...');
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ChannelViewModel channel =
        ref.watch(findChannelProvider(streamId: _currentStreamId));
    final channels = ref.watch(findAllChannelsProvider());
    return Scaffold(
      body: SafeArea(
        child: MaterialDesktopVideoControlsTheme(
          key: ValueKey(_currentStreamId),
          normal: MaterialDesktopVideoControlsThemeData(
            // Modify theme options:
            buttonBarButtonSize: 24.0,
            buttonBarButtonColor: Colors.white,
            // Modify top button bar:
            topButtonBarMargin: const EdgeInsets.only(top: 36.0),
            topButtonBar: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () {
                  context.pop();
                },
              ),
              Text(
                "${channel.title} - ${utf8.decode(base64.decode(channel.currentEpgItem?.title ?? ''))}",
                style: const TextStyle(color: Colors.white),
              ),
              const Spacer(),
              MaterialDesktopCustomButton(
                onPressed: () {
                  setState(() {
                    _showOverlay = !_showOverlay;
                  });
                },
                icon: const Icon(Icons.settings),
              ),
            ],
          ),
          fullscreen: const MaterialDesktopVideoControlsThemeData(
            // Modify theme options:
            displaySeekBar: false,
            automaticallyImplySkipNextButton: false,
            automaticallyImplySkipPreviousButton: false,
          ),
          child: Stack(
            children: [
              Video(
                controller: videoController,
                controls: MaterialDesktopVideoControls,
              ),
              Positioned(
                right: 0,
                top: 46,
                child: Visibility(
                  visible: _showOverlay,
                  child: OverlayChannelListWidget(
                      channels: channels,
                      onClose: () => setState(() => _showOverlay = false),
                      onChannelSelected: (channel) {
                        debugPrint('Channel selected: ${channel.title}');
                        setState(() {
                          _currentStreamId = channel.streamId!;
                          _showOverlay = false;
                          player.open(Media(channel.link));
                        });
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
