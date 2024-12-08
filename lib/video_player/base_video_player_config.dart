import 'package:fluent_ui/fluent_ui.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:play_shift/video_player/custom_controls/desktop_track_settings_button.dart';

class BaseVideoPlayerConfig {
  static MaterialDesktopVideoControlsThemeData desktopThemeData({
    List<Widget> topButtonBar = const [],
    List<Widget> bottomButtonBar = const [
      MaterialDesktopSkipPreviousButton(),
      MaterialDesktopPlayOrPauseButton(),
      MaterialDesktopSkipNextButton(),
      MaterialDesktopVolumeButton(),
      MaterialDesktopPositionIndicator(),
      Spacer(),
      DesktopTrackSetttingsButton(),
      MaterialDesktopFullscreenButton(),
    ],
  }) {
    return MaterialDesktopVideoControlsThemeData(
      playAndPauseOnTap: true,
      buttonBarButtonSize: 24.0,
      buttonBarButtonColor: Colors.white,
      topButtonBarMargin: const EdgeInsets.only(top: 36.0),
      topButtonBar: topButtonBar,
      hideMouseOnControlsRemoval: true,
      bottomButtonBar: bottomButtonBar,
      bufferingIndicatorBuilder: (context) {
        return const Center(
          child: ProgressRing(),
        );
      },
    );
  }

  static MaterialVideoControlsThemeData mobileThemeData({
    List<Widget> topButtonBar = const [],
  }) {
    return MaterialVideoControlsThemeData(
      buttonBarButtonSize: 24.0,
      buttonBarButtonColor: Colors.white,
      topButtonBarMargin: const EdgeInsets.only(top: 36.0),
      topButtonBar: topButtonBar,
      displaySeekBar: false,
      automaticallyImplySkipNextButton: false,
      automaticallyImplySkipPreviousButton: false,
      bufferingIndicatorBuilder: (context) {
        return const Center(
          child: ProgressRing(),
        );
      },
    );
  }
}
