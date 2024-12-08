
import 'package:fluent_ui/fluent_ui.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:platform_builder/platform.dart';
import 'package:play_shift/service/collections/series_episode.dart';
import 'package:play_shift/video_player/base_video_player.dart';
import 'package:play_shift/video_player/base_video_player_config.dart';

class SeriesVideoPlayer extends StatelessWidget {
  final SeriesEpisode episode;
  final int selectedSeason;
  final int selectedEpisodeIndex;

  const SeriesVideoPlayer({
    super.key,
    required this.episode,
    required this.selectedSeason,
    required this.selectedEpisodeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: BaseVideoPlayer(
        key: ValueKey('${episode.id}_${selectedSeason}_$selectedEpisodeIndex'),
        streamLink: episode.streamUrl,
        builder: (controller) => _buildPlayer(controller),
      ),
    );
  }

  Widget _buildPlayer(VideoController controller) {
    if (Platform.instance.isMacOS || Platform.instance.isWindows) {
      return MaterialDesktopVideoControlsTheme(
        normal: BaseVideoPlayerConfig.desktopThemeData(),
        fullscreen: BaseVideoPlayerConfig.desktopThemeData(),
        child: Video(
          controller: controller,
          controls: MaterialDesktopVideoControls,
        ),
      );
    }

    return MaterialVideoControlsTheme(
      normal: BaseVideoPlayerConfig.mobileThemeData(),
      fullscreen: BaseVideoPlayerConfig.mobileThemeData(),
      child: Video(
        controller: controller,
        controls: MaterialVideoControls,
      ),
    );
  }
}