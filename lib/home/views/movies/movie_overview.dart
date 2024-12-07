import 'package:auto_route/auto_route.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:play_shift/provider/isar/m3u_provider.dart';
import 'package:play_shift/provider/models/movie_view_model.dart';
import 'package:play_shift/router/app_router.gr.dart';
import 'package:play_shift/video_player/base_video_player.dart';
import 'package:platform_builder/platform.dart';
import 'package:play_shift/video_player/base_video_player_config.dart';
import 'package:play_shift/theme.dart';
import 'package:xtream_code_client/xtream_code_client.dart'
    hide Image, Icon, Video;
import 'package:media_kit_video/media_kit_video.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

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
  final _dateFormatter = DateFormat('dd.MM.yyyy');

  String _formatDate(DateTime? date) {
    if (date == null) return '';
    return _dateFormatter.format(date);
  }

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
            Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: FluentTheme.of(context)
                        .resources
                        .dividerStrokeColorDefault,
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
                    movie.title,
                    style: FluentTheme.of(context)
                        .navigationPaneTheme
                        .itemHeaderTextStyle,
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(FluentIcons.color),
                    onPressed: () => ref
                        .read(appThemeProvider.notifier)
                        .setAndPersistThemeMode(
                          currentTheme == ThemeMode.light
                              ? ThemeMode.dark
                              : ThemeMode.light,
                        ),
                  ),
                ],
              ),
            ),
            // Video player section
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: BaseVideoPlayer(
                key: ValueKey(widget.streamId), // Add this line
                streamLink: movie.streamUrl,
                builder: (controller) => (Platform.instance.isMacOS ||
                        Platform.instance.isWindows)
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
            ),
            // Movie details section
            Expanded(
              child: movieInfo.when(
                data: (info) => _buildMovieDetails(context, movie, info),
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

  Widget _buildMovieDetails(
      BuildContext context, MovieViewModel movie, XTremeCodeVodInfo? info) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (info?.info.coverBig != null)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              info!.info.coverBig!,
                              width: 200,
                              height: 300,
                              fit: BoxFit.cover,
                            ),
                          ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: [
                                  if (info?.info.rating != null)
                                    _buildInfoChip(
                                      context,
                                      null,
                                      '${info!.info.rating}/10',
                                      icon: FluentIcons.favorite_star,
                                    ),
                                  if (info?.info.releasedate != null)
                                    _buildInfoChip(
                                      context,
                                      null,
                                      _formatDate(info!.info.releasedate),
                                      icon: FluentIcons.calendar,
                                    ),
                                  if (info?.info.duration != null)
                                    _buildInfoChip(
                                      context,
                                      null,
                                      '${info!.info.duration}',
                                      icon: FluentIcons.timer,
                                    ),
                                  if (info?.info.genre != null)
                                    _buildInfoChip(
                                        context, null, info!.info.genre!,
                                        icon: FluentIcons.list),
                                  if (info?.info.country != null)
                                    _buildInfoChip(
                                      context,
                                      null,
                                      info!.info.country!,
                                      icon: FluentIcons.flag,
                                    ),
                                  if (info?.info.youtubeTrailer != null)
                                    MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: HoverButton(
                                        onPressed: () => _launchTrailer(
                                            info!.info.youtubeTrailer!),
                                        builder: (context, states) {
                                          return Card(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12, vertical: 8),
                                            backgroundColor: states.isHovered
                                                ? FluentTheme.of(context)
                                                    .accentColor
                                                    .lighter
                                                : FluentTheme.of(context)
                                                    .accentColor,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  FluentIcons.play,
                                                  size: 16,
                                                  color: Colors.white,
                                                ),
                                                const SizedBox(width: 8),
                                                Text(
                                                  'Watch Trailer',
                                                  style: FluentTheme.of(context)
                                                      .typography
                                                      .body
                                                      ?.copyWith(
                                                        color: Colors.white,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                ],
                              ),
                              SizedBox(height: 16),
                              Text(
                                movie.title,
                                style: FluentTheme.of(context)
                                    .typography
                                    .titleLarge,
                              ),
                              const SizedBox(height: 8),
                              if (info?.info.description?.isNotEmpty ??
                                  false) ...[
                                Text(
                                  info!.info.description!,
                                  style:
                                      FluentTheme.of(context).typography.body,
                                ),
                                const SizedBox(height: 16),
                              ],
                              // Cast section
                              if (info?.info.cast?.isNotEmpty ?? false) ...[
                                Text(
                                  'Cast',
                                  style: FluentTheme.of(context)
                                      .typography
                                      .subtitle,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  info!.info.cast!,
                                  style:
                                      FluentTheme.of(context).typography.body,
                                ),
                                const SizedBox(height: 16),
                              ],
                              // Add director section
                              if (info?.info.director?.isNotEmpty ?? false) ...[
                                Text(
                                  'Director',
                                  style: FluentTheme.of(context)
                                      .typography
                                      .subtitle,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  info!.info.director!,
                                  style:
                                      FluentTheme.of(context).typography.body,
                                ),
                                const SizedBox(height: 16),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 24),
              // Add related movies section
              SizedBox(
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Related Movies',
                      style: FluentTheme.of(context).typography.subtitle,
                    ),
                    const SizedBox(height: 16),
                    _buildRelatedMovies(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRelatedMovies(BuildContext context) {
    final relatedMovies =
        ref.watch(findRelatedMoviesProvider(streamId: widget.streamId));

    return Column(
      children: [
        for (int row = 0; row < 2; row++)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (int col = 0; col < 3; col++)
                  if ((row * 3 + col) < relatedMovies.length)
                    SizedBox(
                      width: 90,
                      child: HoverButton(
                        onPressed: () {
                          context.router.replace(
                            MovieOverviewRoute(
                              streamId: relatedMovies[row * 3 + col].streamId,
                            ),
                          );
                        },
                        builder: (context, states) {
                          final movie = relatedMovies[row * 3 + col];
                          return Card(
                            padding: const EdgeInsets.all(4),
                            backgroundColor: states.isHovered
                                ? FluentTheme.of(context)
                                    .resources
                                    .cardBackgroundFillColorSecondary
                                : null,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (movie.streamIcon!.isNotEmpty)
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(4),
                                    child: Image.network(
                                      movie.streamIcon!,
                                      width: 90,
                                      height: 135,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                const SizedBox(height: 4),
                                Text(
                                  movie.title,
                                  style: FluentTheme.of(context)
                                      .typography
                                      .bodyStrong,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                if (movie.year != null)
                                  Text(
                                    movie.year.toString(),
                                    style: FluentTheme.of(context)
                                        .typography
                                        .caption,
                                  ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildInfoChip(
    BuildContext context,
    String? label,
    String value, {
    IconData? icon,
  }) {
    final card = Card(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              size: 16,
            ),
            const SizedBox(width: 8),
          ],
          Text(
            value,
            style: FluentTheme.of(context).typography.body,
          ),
        ],
      ),
    );

    return label?.isNotEmpty == true
        ? InfoLabel(
            label: label!,
            child: card,
          )
        : card;
  }
}
