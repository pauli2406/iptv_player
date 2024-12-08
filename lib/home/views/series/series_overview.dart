import 'package:auto_route/auto_route.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:play_shift/provider/isar/m3u_provider.dart';
import 'package:platform_builder/platform.dart';
import 'package:play_shift/service/collections/series_episode.dart';
import 'package:play_shift/video_player/base_video_player.dart';
import 'package:play_shift/video_player/base_video_player_config.dart';
import 'package:play_shift/theme.dart';
import 'package:play_shift/constants/ui_constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:play_shift/home/views/series/widgets/series_info_section.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';

@RoutePage()
class SeriesOverview extends ConsumerStatefulWidget {
  final int seriesId;

  const SeriesOverview({
    super.key,
    required this.seriesId,
  });

  @override
  ConsumerState<SeriesOverview> createState() => _SeriesOverviewState();
}

class _SeriesOverviewState extends ConsumerState<SeriesOverview> {
  int? _selectedSeason;
  int? _selectedEpisodeIndex;

  Future<void> _launchTrailer(String videoId) async {
    final Uri uri = Uri.parse('https://www.youtube.com/watch?v=$videoId');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  List<MapEntry<int, String?>> _getValidSeasons(SeriesWithInfo data) {
    final validSeasonNumbers =
        data.episodes.keys.map((s) => int.parse(s)).toSet();
    return data.seriesInfo?.seasons
            ?.where((s) =>
                s.seasonNumber != null &&
                validSeasonNumbers.contains(s.seasonNumber))
            .map((s) => MapEntry(s.seasonNumber!, s.name))
            .toList() ??
        [];
  }

  MapEntry<int, String?>? _getSelectedSeasonInfo(SeriesWithInfo data) {
    if (_selectedSeason == null) return null;
    return data.seriesInfo?.seasons
        ?.where((s) => s.seasonNumber == _selectedSeason)
        .map((s) => MapEntry(s.seasonNumber!, s.overview))
        .firstOrNull;
  }

  Widget _buildDescription(BuildContext context, SeriesWithInfo data) {
    final hasSelectedEpisode = _isVideoPlaying(data);

    if (hasSelectedEpisode) {
      final episode =
          data.episodes[_selectedSeason.toString()]![_selectedEpisodeIndex!];
      if (episode.plot != null) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description',
              style: FluentTheme.of(context).typography.subtitle,
            ),
            const SizedBox(height: 8),
            Text(
              episode.title ?? 'Episode ${episode.episodeNum}',
              style: FluentTheme.of(context).typography.bodyStrong,
            ),
            const SizedBox(height: 8),
            Text(
              episode.plot!,
              style: FluentTheme.of(context).typography.body,
            ),
          ],
        );
      }
    }

    final seasonInfo = _getSelectedSeasonInfo(data);
    final hasSeasonOverview = seasonInfo?.value?.isNotEmpty == true;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (data.plot != null) ...[
          Text(
            'Description',
            style: FluentTheme.of(context).typography.subtitle,
          ),
          const SizedBox(height: 8),
          Text(
            data.plot!,
            style: FluentTheme.of(context).typography.body,
          ),
        ],
        if (hasSeasonOverview) ...[
          const SizedBox(height: 16),
          Text(
            'Season ${seasonInfo!.key}',
            style: FluentTheme.of(context).typography.subtitle,
          ),
          const SizedBox(height: 8),
          Text(
            seasonInfo.value!,
            style: FluentTheme.of(context).typography.body,
          ),
        ],
      ],
    );
  }

  Widget _buildCrewInfo(BuildContext context, SeriesWithInfo data) {
    if (_selectedSeason != null && _selectedEpisodeIndex != null) {
      return const SizedBox.shrink();
    }

    // Return empty widget if no director and no cast
    if (data.director == null && data.cast == null) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (data.director?.isNotEmpty == true) ...[
          Text(
            'Director',
            style: FluentTheme.of(context).typography.subtitle,
          ),
          const SizedBox(height: 8),
          Text(
            data.director!,
            style: FluentTheme.of(context).typography.body,
          ),
          const SizedBox(height: 16),
        ],
        if (data.cast?.isNotEmpty == true) ...[
          Text(
            'Cast',
            style: FluentTheme.of(context).typography.subtitle,
          ),
          const SizedBox(height: 8),
          Text(
            data.cast!,
            style: FluentTheme.of(context).typography.body,
          ),
          const SizedBox(height: 24),
        ],
      ],
    );
  }

  bool _isVideoPlaying(SeriesWithInfo data) {
    return _selectedSeason != null &&
        _selectedEpisodeIndex != null &&
        data.episodes.containsKey(_selectedSeason.toString()) &&
        data.episodes[_selectedSeason.toString()]!.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final seriesData =
        ref.watch(findSeriesWithInfoProvider(seriesId: widget.seriesId));
    final currentTheme = ref.watch(appThemeProvider);

    // Set initial season when data is available
    seriesData.whenData((data) {
      if (_selectedSeason == null && data.episodes.isNotEmpty) {
        final seasons = data.episodes.keys.map((s) => int.parse(s)).toList()
          ..sort();
        if (seasons.isNotEmpty) {
          _selectedSeason = seasons.first;
        }
      }
    });

    return NavigationView(
      content: ScaffoldPage(
        padding: const EdgeInsets.only(top: 5),
        content: seriesData.when(
          data: (data) => Column(
            children: [
              _buildHeader(context, data.series.title ?? "", currentTheme),
              if (_isVideoPlaying(data))
                _buildVideoPlayer(
                  context,
                  data.episodes[_selectedSeason.toString()]![
                      _selectedEpisodeIndex!],
                ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.all(UIConstants.movieDetailsPadding),
                  child: Card(
                    child: SingleChildScrollView(
                      padding:
                          const EdgeInsets.all(UIConstants.movieDetailsPadding),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (data.seriesInfo?.info.cover != null)
                            Padding(
                              padding: const EdgeInsets.only(right: 24),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: FastCachedImage(
                                  url: data.seriesInfo!.info.cover!,
                                  width: 200,
                                  height: 300,
                                  fit: BoxFit.cover,
                                  loadingBuilder: (context, progress) =>
                                      const ProgressRing(),
                                  errorBuilder: (context, error, stack) =>
                                      const SizedBox(
                                    width: 200,
                                    height: 300,
                                    child: Icon(FluentIcons.my_movies_t_v),
                                  ),
                                ),
                              ),
                            ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SeriesInfoSection(
                                  data: data,
                                  onTrailerPressed: _launchTrailer,
                                  showInfoChips: !_isVideoPlaying(data),
                                  onCloseVideo: _isVideoPlaying(data)
                                      ? () => setState(
                                          () => _selectedEpisodeIndex = null)
                                      : null,
                                ),
                                const SizedBox(height: 16),
                                _buildDescription(context, data),
                                const SizedBox(height: 24),
                                _buildCrewInfo(context, data),
                                _buildSeasonSelector(context, data),
                                const SizedBox(height: 16),
                                _buildEpisodesList(context, data),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          loading: () => const Center(child: ProgressRing()),
          error: (err, stack) => Center(
            child: Text('Error loading series: $err'),
          ),
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

  Widget _buildVideoPlayer(BuildContext context, SeriesEpisode episode) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: BaseVideoPlayer(
        key:
            ValueKey('${episode.id}_${_selectedSeason}_$_selectedEpisodeIndex'),
        streamLink: episode.streamUrl,
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

  Widget _buildSeasonSelector(BuildContext context, SeriesWithInfo data) {
    final seasons = _getValidSeasons(data)
      ..sort((a, b) => a.key.compareTo(b.key));

    return Row(
      children: [
        Text(
          'Season:',
          style: FluentTheme.of(context).typography.subtitle,
        ),
        const SizedBox(width: 8),
        ComboBox<int>(
          value: _selectedSeason,
          placeholder: const Text('Select Season'),
          items: seasons
              .map((season) => ComboBoxItem<int>(
                    value: season.key,
                    child: Text(season.value ?? 'Season ${season.key}'),
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {
              _selectedSeason = value;
              _selectedEpisodeIndex = null;
            });
          },
        ),
      ],
    );
  }

  Widget _buildEpisodesList(BuildContext context, SeriesWithInfo data) {
    final seasonEpisodes = _selectedSeason != null
        ? (data.episodes[_selectedSeason.toString()] ?? [])
        : [];

    final isVideoPlaying = _isVideoPlaying(data);

    return SizedBox(
      height: isVideoPlaying ? 75 : 200,
      child: ListView.builder(
        key: ValueKey('season_${_selectedSeason}'), // Add key to force rebuild
        scrollDirection: Axis.horizontal,
        itemCount: seasonEpisodes.length,
        itemBuilder: (context, index) {
          final episode = seasonEpisodes[index];
          return Card(
            key: ValueKey(
                'episode_${_selectedSeason}_${episode.id}'), // Add unique key for each episode
            padding: EdgeInsets.zero,
            margin: const EdgeInsets.only(right: 8),
            child: Button(
              style: ButtonStyle(
                padding: ButtonState.all(EdgeInsets.zero),
                backgroundColor: ButtonState.all(
                  index == _selectedEpisodeIndex
                      ? FluentTheme.of(context).accentColor
                      : null,
                ),
              ),
              onPressed: () => setState(() => _selectedEpisodeIndex = index),
              child: Container(
                width: isVideoPlaying ? 200 : 300,
                padding: const EdgeInsets.all(8.0),
                child: isVideoPlaying
                    ? _buildCompactEpisodeView(context, episode)
                    : _buildDetailedEpisodeView(context, episode),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCompactEpisodeView(BuildContext context, SeriesEpisode episode) {
    return Center(
      child: Text(
        'Episode ${episode.episodeNum}',
        style: FluentTheme.of(context).typography.bodyStrong,
      ),
    );
  }

  Widget _buildDetailedEpisodeView(
      BuildContext context, SeriesEpisode episode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (episode.movieImage != null)
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: FastCachedImage(
              url: episode.movieImage!,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
              loadingBuilder: (context, progress) => SizedBox(
                height: 120,
                child: Center(child: const ProgressRing()),
              ),
              errorBuilder: (context, error, stack) => Container(
                height: 120,
                color: FluentTheme.of(context)
                    .resources
                    .cardBackgroundFillColorSecondary,
                child: const Icon(FluentIcons.video),
              ),
            ),
          )
        else
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: FluentTheme.of(context)
                  .resources
                  .cardBackgroundFillColorSecondary,
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Center(
              child: Icon(FluentIcons.video),
            ),
          ),
        const SizedBox(height: 8),
        Row(
          children: [
            Text(
              'Episode ${episode.episodeNum}',
              style: FluentTheme.of(context).typography.bodyStrong,
            ),
            const Spacer(),
            if (episode.durationSecs != null)
              Text(
                _formatDuration(episode.durationSecs!),
                style: FluentTheme.of(context).typography.caption,
              ),
          ],
        ),
        if (episode.title != null) ...[
          const SizedBox(height: 4),
          Text(
            episode.title!,
            style: FluentTheme.of(context).typography.body,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ],
    );
  }

  String _formatDuration(int seconds) {
    final hours = seconds ~/ 3600;
    final minutes = (seconds % 3600) ~/ 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    }
    return '${minutes}m';
  }
}
