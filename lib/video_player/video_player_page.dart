import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:play_shift/provider/models/channel_view_model.dart';
import 'package:play_shift/video_player/base_video_player.dart';
import 'package:play_shift/video_player/custom_controls/desktop_track_settings_button.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:platform_builder/platform.dart';
import 'package:play_shift/video_player/base_video_player_config.dart';

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
                  : _materialMobileVideoControlsTheme(videoController),
        ),
      ),
    );
  }

  MaterialDesktopVideoControlsTheme _materialDesktopVideoControlsTheme(
      VideoController controller) {
    final themeData = BaseVideoPlayerConfig.desktopThemeData(
      topButtonBar: topButtonBar,
      bottomButtonBar: const [
        MaterialDesktopSkipPreviousButton(),
        MaterialDesktopPlayOrPauseButton(),
        MaterialDesktopSkipNextButton(),
        MaterialDesktopVolumeButton(),
        MaterialDesktopPositionIndicator(),
        Spacer(),
        DesktopTrackSetttingsButton(),
        MaterialDesktopFullscreenButton(),
      ],
    );

    return MaterialDesktopVideoControlsTheme(
      key: ValueKey(stream.streamId),
      normal: themeData,
      fullscreen: themeData,
      child: Stack(children: [
        Video(controller: controller, controls: MaterialDesktopVideoControls),
        overlay
      ]),
    );
  }

  MaterialVideoControlsTheme _materialMobileVideoControlsTheme(
      VideoController controller) {
    return MaterialVideoControlsTheme(
      key: ValueKey(stream.streamId),
      normal: BaseVideoPlayerConfig.mobileThemeData(topButtonBar: topButtonBar),
      fullscreen: BaseVideoPlayerConfig.mobileThemeData(),
      child: Stack(children: [
        Video(controller: controller, controls: MaterialVideoControls),
        overlay
      ]),
    );
  }
}
