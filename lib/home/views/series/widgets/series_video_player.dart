import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:play_shift/provider/isar/series_providers.dart';
import 'package:play_shift/service/collections/series_episode.dart';
import 'package:play_shift/video_player/base_video_player.dart';
import 'package:platform_builder/platform.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:play_shift/video_player/base_video_player_config.dart';

class SeriesVideoPlayer extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = ref.watch(episodeProgressProvider(episode.id!));

    // Mark series as started when episode starts playing
    ref.read(seriesProgressProvider(selectedSeason).notifier).markAsStarted();

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: BaseVideoPlayer(
        key: ValueKey('${episode.id}_$selectedSeason$selectedEpisodeIndex'),
        streamLink: episode.streamUrl,
        initialPosition:
            progress != null ? Duration(seconds: progress.toInt()) : null,
        // TODO FIX THIS
        // onPositionChanged: (position) {
        //   ref.read(episodeProgressProvider(episode.id!).notifier)
        //       .updateProgress(position.inSeconds.toDouble());
        // },
        builder: (controller) =>
            (Platform.instance.isMacOS || Platform.instance.isWindows)
                ? MaterialDesktopVideoControlsTheme(
                    normal: BaseVideoPlayerConfig.desktopThemeData(),
                    fullscreen: BaseVideoPlayerConfig.desktopThemeData(),
                    child: Video(
                      controller: controller,
                      controls: MaterialDesktopVideoControls,
                    ),
                  )
                : MaterialVideoControlsTheme(
                    normal: BaseVideoPlayerConfig.mobileThemeData(),
                    fullscreen: BaseVideoPlayerConfig.mobileThemeData(),
                    child: Video(
                      controller: controller,
                      controls: MaterialVideoControls,
                    ),
                  ),
      ),
    );
  }
}
