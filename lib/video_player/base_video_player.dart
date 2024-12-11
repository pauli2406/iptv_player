import 'dart:async';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:play_shift/home/provider/volume_value_provider.dart';

class BaseVideoPlayer extends ConsumerStatefulWidget {
  final String streamLink;
  final Widget Function(VideoController controller) builder;
  final Duration? initialPosition;
  final void Function(Duration)? onPositionChanged;
  final bool skipResumeDialog;

  const BaseVideoPlayer({
    required this.streamLink,
    required this.builder,
    this.initialPosition,
    this.onPositionChanged,
    this.skipResumeDialog = false,
    super.key,
  });

  @override
  ConsumerState<BaseVideoPlayer> createState() => _BaseVideoPlayerState();
}

class _BaseVideoPlayerState extends ConsumerState<BaseVideoPlayer> {
  late final Player player;
  late final VideoController videoController;
  StreamSubscription<double>? subscription;
  bool _showResumeDialog = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    player = Player(
      configuration: const PlayerConfiguration(
        vo: 'gpu-next',
        logLevel: MPVLogLevel.info,
        title: 'PlayShift',
        bufferSize: 64 * 1024 * 1024,
      ),
    );
    videoController = VideoController(player);

    if (widget.initialPosition != null) {
      if (widget.initialPosition!.inMinutes > 0 && !widget.skipResumeDialog) {
        _showResumeDialog = true;
      } else {
        _setupPlayer(widget.initialPosition);
      }
    } else {
      _setupPlayer();
    }
  }

  Future<void> _setupPlayer([Duration? startPosition]) async {
    setState(() => _isLoading = true);

    if (player.platform is NativePlayer) {
      (player.platform as dynamic)
        ..setProperty('gpu-api', 'vulkan')
        ..setProperty('cache', 'yes')
        ..setProperty('cache-default', '5000')
        ..setProperty('demuxer-max-back-bytes', '180M')
        ..setProperty('hwdec', 'auto');
    }

    await player.setVolume(ref.read(volumeValueProvider));
    await player.open(Media(widget.streamLink));

    subscription ??= player.stream.volume.listen((event) {
      ref.read(volumeValueProvider.notifier).setValue(event);
    });

    StreamSubscription<bool>? bufferingSubscription;
    bufferingSubscription = player.stream.buffering.listen((buffering) async {
      if (!buffering) {
        if (startPosition != null) {
          await player.seek(startPosition);
        }
        bufferingSubscription?.cancel();
      }
    });

    if (widget.onPositionChanged != null) {
      player.stream.position.listen(widget.onPositionChanged);
    }

    setState(() => _isLoading = false);
  }

  @override
  void dispose() {
    subscription?.cancel();
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (!_showResumeDialog) widget.builder(videoController),
        if (_isLoading)
          const Positioned.fill(
            child: Center(
              child: ProgressRing(),
            ),
          ),
        if (_showResumeDialog)
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.7),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (widget.initialPosition != null &&
                        widget.initialPosition!.inMinutes > 0)
                      FilledButton(
                        onPressed: () {
                          _setupPlayer(widget.initialPosition);
                          setState(() => _showResumeDialog = false);
                        },
                        child: Text(
                            'Resume from ${widget.initialPosition?.inHours}h ${widget.initialPosition?.inMinutes.remainder(60)}min'),
                      ),
                    if (widget.initialPosition != null &&
                        widget.initialPosition!.inMinutes > 0)
                      const SizedBox(width: 16),
                    Button(
                      onPressed: () {
                        _setupPlayer();
                        setState(() => _showResumeDialog = false);
                      },
                      child: const Text('Start from beginning'),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
