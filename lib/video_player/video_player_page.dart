import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:play_shift/provider/models/channel_view_model.dart';
import 'package:play_shift/video_player/base_video_player.dart';
import 'package:play_shift/video_player/custom_controls/material_desktop_audio_track_button.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:platform_builder/platform.dart';

class VideoPlayerPage extends ConsumerWidget {
  const VideoPlayerPage({
    required this.stream,
    required this.overlay,
    required this.topButtonBar,
    super.key,
  });

  final ChannelViewModel stream;
  final Widget overlay;
  final List<Widget> topButtonBar;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: BaseVideoPlayer(
          stream: stream,
          builder: (videoController) =>
              (Platform.instance.isMacOS || Platform.instance.isWindows)
                  ? _materialDesktopVideoControlsTheme(videoController)
                  : _materialVideoControlsTheme(videoController),
        ),
      ),
    );
  }

  MaterialDesktopVideoControlsTheme _materialDesktopVideoControlsTheme(
      VideoController controller) {
    return MaterialDesktopVideoControlsTheme(
      key: ValueKey(stream.streamId),
      normal: _buildMaterialDesktopThemeData(),
      fullscreen: _buildMaterialDesktopThemeData(),
      child: Stack(
        children: [
          Video(
            controller: controller,
            controls: MaterialDesktopVideoControls,
          ),
          overlay,
        ],
      ),
    );
  }

  MaterialVideoControlsTheme _materialVideoControlsTheme(
      VideoController controller) {
    return MaterialVideoControlsTheme(
      key: ValueKey(stream.streamId),
      normal: _buildMaterialThemeData(),
      fullscreen: const MaterialVideoControlsThemeData(
        displaySeekBar: false,
        automaticallyImplySkipNextButton: false,
        automaticallyImplySkipPreviousButton: false,
      ),
      child: Stack(
        children: [
          Video(
            controller: controller,
            controls: MaterialVideoControls,
          ),
          overlay,
        ],
      ),
    );
  }

  MaterialVideoControlsThemeData _buildMaterialThemeData() {
    return MaterialVideoControlsThemeData(
      buttonBarButtonSize: 24.0,
      buttonBarButtonColor: Colors.white,
      topButtonBarMargin: const EdgeInsets.only(top: 36.0),
      topButtonBar: topButtonBar,
    );
  }

  MaterialDesktopVideoControlsThemeData _buildMaterialDesktopThemeData() {
    return MaterialDesktopVideoControlsThemeData(
      playAndPauseOnTap: false,
      buttonBarButtonSize: 24.0,
      buttonBarButtonColor: Colors.white,
      topButtonBarMargin: const EdgeInsets.only(top: 36.0),
      topButtonBar: topButtonBar,
      hideMouseOnControlsRemoval: true,
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
