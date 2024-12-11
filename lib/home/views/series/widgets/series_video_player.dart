import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:play_shift/provider/isar/series_providers.dart';
import 'package:play_shift/service/collections/series_episode.dart';
import 'package:play_shift/video_player/base_video_player.dart';
import 'package:platform_builder/platform.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:play_shift/video_player/base_video_player_config.dart';

class SeriesVideoPlayer extends ConsumerStatefulWidget {
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
  ConsumerState<SeriesVideoPlayer> createState() => _SeriesVideoPlayerState();
}

class _SeriesVideoPlayerState extends ConsumerState<SeriesVideoPlayer> {
  @override
  void initState() {
    super.initState();
    // Mark series as started when episode starts playing
    ref
        .read(seriesProgressProvider(widget.episode.parentSeriesId!).notifier)
        .markAsStarted();
  }

  @override
  Widget build(BuildContext context) {
    final progress = ref.watch(episodeProgressProvider(widget.episode.id!));

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: BaseVideoPlayer(
        key: ValueKey(
            '${widget.episode.id}_$widget.selectedSeason$widget.selectedEpisodeIndex'),
        streamLink: widget.episode.streamUrl,
        initialPosition:
            progress != null ? Duration(seconds: progress.toInt()) : null,
        onPositionChanged: (position) {
          ref
              .read(episodeProgressProvider(widget.episode.id!).notifier)
              .updateProgress(position.inSeconds.toDouble());
        },
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
