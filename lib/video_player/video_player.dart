import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iptv_player/provider/isar/m3u_provider.dart';
import 'package:iptv_player/video_player/custom_controls/material_desktop_audio_track_button.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:platform_builder/platform.dart';

class VideoPlayer extends ConsumerStatefulWidget {
  const VideoPlayer({
    required this.stream,
    required this.overlay,
    required this.topButtonBar,
    super.key,
  });

  final ChannelViewModel stream;
  final Widget overlay;
  final List<Widget> topButtonBar;

  @override
  ConsumerState<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends ConsumerState<VideoPlayer> {
  late int _currentStreamId;
  final Player player = Player(
    configuration: const PlayerConfiguration(
      // Set the video output driver to OpenGL or Vulkan for better performance and quality
      vo: 'gpu-next',
      logLevel: MPVLogLevel.info,
      title: 'IPTV Player',
      bufferSize: 64 * 1024 * 1024,
    ),
  );
  late VideoController videoController;

  @override
  void initState() {
    super.initState();
    _currentStreamId = widget.stream.streamId!;
    videoController = VideoController(player);

    _setupPlayer();
  }

  void _setupPlayer() {
    if (player.platform is NativePlayer) {
      (player.platform as dynamic)
        // Based on https://github.com/streamlink/streamlink-twitch-gui/wiki/Recommendations
        // and https://github.com/classicjazz/mpv-config/blob/master/mpv.conf
        // Selected API: select either Vulkan (preferred) or OpenGL
        ..setProperty('gpu-api', 'vulkan')
        ..setProperty('hwdec', 'auto')
        // Adjust cache settings to prevent buffering issues during livestream playback
        ..setProperty('cache', 'yes')
        ..setProperty('cache-default', '5000')
        // This defines how much data MPV will keep in its "back-buffer" for being able to rewind.
        ..setProperty('demuxer-max-back-bytes', '180M')
        // enable hardware acceleration for better performance
        ..setProperty('hwdec', 'auto');
    }
    player.open(
      Media(widget.stream.link),
    );
    // .then((_) => player.setAudioTrack(AudioTrack.auto())); // Fixed the 'then' method to accept a function
  }

  @override
  void dispose() {
    debugPrint('Disposing [Player] and [VideoController]...');
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: (Platform.instance.isMacOS || Platform.instance.isWindows)
            ? _materialDesktopVideoControlsTheme()
            : _materialVideoControlsTheme(),
      ),
    );
  }

  MaterialDesktopVideoControlsTheme _materialDesktopVideoControlsTheme() {
    return MaterialDesktopVideoControlsTheme(
      key: ValueKey(_currentStreamId),
      normal: _buildMaterialDesktopThemeData(),
      fullscreen: const MaterialDesktopVideoControlsThemeData(
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
          widget.overlay,
        ],
      ),
    );
  }

  MaterialVideoControlsTheme _materialVideoControlsTheme() {
    return MaterialVideoControlsTheme(
      key: ValueKey(_currentStreamId),
      normal: _buildMaterialThemeData(),
      fullscreen: const MaterialVideoControlsThemeData(
        displaySeekBar: false,
        automaticallyImplySkipNextButton: false,
        automaticallyImplySkipPreviousButton: false,
      ),
      child: Stack(
        children: [
          Video(
            controller: videoController,
            controls: MaterialVideoControls,
          ),
          widget.overlay,
        ],
      ),
    );
  }

  MaterialVideoControlsThemeData _buildMaterialThemeData() {
    return MaterialVideoControlsThemeData(
      buttonBarButtonSize: 24.0,
      buttonBarButtonColor: Colors.white,
      topButtonBarMargin: const EdgeInsets.only(top: 36.0),
      topButtonBar: widget.topButtonBar,
    );
  }

  MaterialDesktopVideoControlsThemeData _buildMaterialDesktopThemeData() {
    return MaterialDesktopVideoControlsThemeData(
      playAndPauseOnTap: false,
      buttonBarButtonSize: 24.0,
      buttonBarButtonColor: Colors.white,
      topButtonBarMargin: const EdgeInsets.only(top: 36.0),
      topButtonBar: widget.topButtonBar,
      bottomButtonBar: const [
        MaterialDesktopSkipPreviousButton(),
        MaterialDesktopPlayOrPauseButton(),
        MaterialDesktopSkipNextButton(),
        MaterialDesktopVolumeButton(),
        MaterialDesktopPositionIndicator(),
        Spacer(),
        MaterialDesktopFullscreenButton(),
        MaterialDesktopAudioTrackButton(),
      ],
    );
  }
}
