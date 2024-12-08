import 'package:auto_route/auto_route.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:play_shift/provider/isar/movie_providers.dart';
import 'package:play_shift/provider/models/movie_view_model.dart';
import 'package:play_shift/video_player/base_video_player.dart';
import 'package:platform_builder/platform.dart';
import 'package:play_shift/video_player/base_video_player_config.dart';
import 'package:play_shift/theme.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:play_shift/constants/ui_constants.dart';
import 'package:play_shift/home/views/movies/widgets/movie_details_section.dart';
import 'package:play_shift/utils/date_formatter.dart';
import 'package:play_shift/home/views/movies/widgets/related_movies_grid.dart';

@RoutePage()
class MovieOverview extends ConsumerStatefulWidget {
  final int streamId;

  const MovieOverview({
    super.key,
    required this.streamId,
  });

  @override
  ConsumerState<MovieOverview> createState() => _MovieOverviewState();
}

class _MovieOverviewState extends ConsumerState<MovieOverview> {
  Future<void> _launchTrailer(String videoId) async {
    final Uri uri = Uri.parse('https://www.youtube.com/watch?v=$videoId');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final movie = ref.watch(findMovieProvider(streamId: widget.streamId));
    final movieInfo =
        ref.watch(findMovieDetailProvider(vodId: widget.streamId));
    final currentTheme = ref.watch(appThemeProvider);

    return NavigationView(
      content: ScaffoldPage(
        padding: const EdgeInsets.only(top: 5),
        content: Column(
          children: [
            _buildHeader(context, movie.title, currentTheme),
            _buildVideoPlayer(context, movie),
            Expanded(
              child: movieInfo.when(
                data: (info) => Padding(
                  padding:
                      const EdgeInsets.all(UIConstants.movieDetailsPadding),
                  child: Card(
                    child: SingleChildScrollView(
                      padding:
                          const EdgeInsets.all(UIConstants.movieDetailsPadding),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 3,
                            child: MovieDetailsSection(
                              movie: movie,
                              info: info,
                              onTrailerPressed: _launchTrailer,
                              dateFormatter: DateFormatter.formatDate,
                            ),
                          ),
                          const SizedBox(width: 24),
                          SizedBox(
                            width: 300,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Related Movies',
                                  style: FluentTheme.of(context)
                                      .typography
                                      .subtitle,
                                ),
                                const SizedBox(
                                    height: UIConstants.movieDetailsPadding),
                                RelatedMoviesGrid(
                                  movies: ref.watch(
                                    findRelatedMoviesProvider(
                                        streamId: widget.streamId),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                loading: () => const Center(child: ProgressRing()),
                error: (err, stack) => Center(
                  child: Text(
                    'Error loading movie details: $err',
                    style: FluentTheme.of(context).typography.body,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(
      BuildContext context, String title, ThemeMode currentTheme) {
    return Container(
      height: UIConstants.headerHeight,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: FluentTheme.of(context).resources.dividerStrokeColorDefault,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(FluentIcons.back),
            onPressed: () => context.router.maybePop(),
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style:
                FluentTheme.of(context).navigationPaneTheme.itemHeaderTextStyle,
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(FluentIcons.color),
            onPressed: () =>
                ref.read(appThemeProvider.notifier).setAndPersistThemeMode(
                      currentTheme == ThemeMode.light
                          ? ThemeMode.dark
                          : ThemeMode.light,
                    ),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoPlayer(BuildContext context, MovieViewModel movie) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: BaseVideoPlayer(
        key: ValueKey(widget.streamId), // Add this line
        streamLink: movie.streamUrl,
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
