import 'package:auto_route/auto_route.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:play_shift/provider/isar/m3u_provider.dart';
import 'package:play_shift/theme.dart';
import 'package:play_shift/constants/ui_constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:play_shift/home/views/series/widgets/series_info_section.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'widgets/episode_list_item.dart';
import 'widgets/series_video_player.dart';

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
          data: (data) => _buildContent(context, data, currentTheme),
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
        key: ValueKey('season_${_selectedSeason}'),
        scrollDirection: Axis.horizontal,
        itemCount: seasonEpisodes.length,
        itemBuilder: (context, index) => EpisodeListItem(
          key: ValueKey(
              'episode_${_selectedSeason}_${seasonEpisodes[index].id}'),
          episode: seasonEpisodes[index],
          isPlaying: index == _selectedEpisodeIndex,
          isCompact: isVideoPlaying,
          onPressed: () => setState(() => _selectedEpisodeIndex = index),
        ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    SeriesWithInfo data,
    ThemeMode currentTheme,
  ) {
    return Column(
      children: [
        _buildHeader(context, data.series.title ?? "", currentTheme),
        if (_isVideoPlaying(data))
          SeriesVideoPlayer(
            episode: data
                .episodes[_selectedSeason.toString()]![_selectedEpisodeIndex!],
            selectedSeason: _selectedSeason!,
            selectedEpisodeIndex: _selectedEpisodeIndex!,
          ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(UIConstants.movieDetailsPadding),
            child: Card(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(UIConstants.movieDetailsPadding),
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
                                ? () =>
                                    setState(() => _selectedEpisodeIndex = null)
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
    );
  }
}
