import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:play_shift/home/provider/volume_value_provider.dart';
import 'package:play_shift/provider/models/channel_view_model.dart';

class BaseVideoPlayer extends ConsumerStatefulWidget {
  final ChannelViewModel stream;
  final Widget Function(VideoController controller) builder;

  const BaseVideoPlayer({
    required this.stream,
    required this.builder,
    super.key,
  });

  @override
  ConsumerState<BaseVideoPlayer> createState() => _BaseVideoPlayerState();
}

class _BaseVideoPlayerState extends ConsumerState<BaseVideoPlayer> {
  late final Player player;
  late final VideoController videoController;
  StreamSubscription<double>? subscription;

  @override
  void initState() {
    super.initState();
    player = Player(
      configuration: const PlayerConfiguration(
        vo: 'gpu-next',
        logLevel: MPVLogLevel.info,
        title: 'IPTV Player',
        bufferSize: 64 * 1024 * 1024,
      ),
    );
    videoController = VideoController(player);
    _setupPlayer();
  }

  void _setupPlayer() {
    if (player.platform is NativePlayer) {
      (player.platform as dynamic)
        ..setProperty('gpu-api', 'vulkan')
        ..setProperty('cache', 'yes')
        ..setProperty('cache-default', '5000')
        ..setProperty('demuxer-max-back-bytes', '180M')
        ..setProperty('hwdec', 'auto');
    }

    player.setVolume(ref.read(volumeValueProvider));
    player.open(Media(widget.stream.link));

    subscription ??= player.stream.volume.listen((event) {
      ref.read(volumeValueProvider.notifier).setValue(event);
    });
  }

  @override
  void dispose() {
    subscription?.cancel();
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.builder(videoController);
}
