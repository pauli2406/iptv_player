import 'package:auto_route/auto_route.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:play_shift/home/views/series/widgets/series_crew_info_section.dart';
import 'package:play_shift/home/views/series/widgets/series_header_section.dart';
import 'package:play_shift/provider/isar/m3u_provider.dart';
import 'package:play_shift/provider/isar/series_providers.dart';
import 'package:play_shift/provider/models/provider_models.dart';
import 'package:play_shift/service/collections/series_episode.dart';
import 'package:play_shift/theme.dart';
import 'package:play_shift/constants/ui_constants.dart';
import 'package:play_shift/widgets/go_to_action_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:play_shift/home/views/series/widgets/series_info_section.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'widgets/episode_list_item.dart';
import 'widgets/series_video_player.dart';
import 'dart:async';

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
  final ScrollController _episodeScrollController = ScrollController();
  Timer? _scrollTimer;
  static const _scrollInterval = Duration(milliseconds: 20);
  static const _scrollAmount = 50.0;
  bool _hasScrolledToLastWatched = false;

  @override
  void dispose() {
    _scrollTimer?.cancel();
    _episodeScrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initializeSelectedSeason();
  }

  void _initializeSelectedSeason() {
    if (_selectedSeason != null) return; // Already initialized

    // Try to get last watched episode
    final lastWatchedId = ref.read(lastWatchedEpisodeProvider(widget.seriesId));
    if (lastWatchedId != null) {
      final episode =
          ref.read(m3uServiceProvider).getLastWatchedEpisode(widget.seriesId);
      if (episode?.season != null) {
        setState(() => _selectedSeason = episode!.season);
        return;
      }
    }
  }

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

  bool _isVideoPlaying(SeriesWithInfo data) {
    return _selectedSeason != null &&
        _selectedEpisodeIndex != null &&
        data.episodes.containsKey(_selectedSeason.toString()) &&
        data.episodes[_selectedSeason.toString()]!.isNotEmpty;
  }

  void _startPlayback(SeriesWithInfo data, {SeriesEpisode? specificEpisode}) {
    if (specificEpisode != null) {
      // Find season and episode index for the specific episode
      final seasonStr = specificEpisode.season.toString();
      final episodeIndex = data.episodes[seasonStr]?.indexWhere(
            (e) => e.id == specificEpisode.id,
          ) ??
          -1;

      if (episodeIndex != -1) {
        _onEpisodeSelected(episodeIndex, data);
        setState(() {
          _selectedSeason = specificEpisode.season;
          _selectedEpisodeIndex = episodeIndex;
        });
        return;
      }
    }

    // Default to first episode of first season
    final seasons = data.episodes.keys.map((s) => int.parse(s)).toList()
      ..sort();
    if (seasons.isNotEmpty) {
      final firstSeason = seasons.first;
      setState(() {
        _selectedSeason = firstSeason;
        _selectedEpisodeIndex = 0;
      });
    }
  }

  SeriesEpisode? _findNextEpisode(SeriesWithInfo data, SeriesEpisode current) {
    final seasonStr = current.season.toString();
    final currentIndex =
        data.episodes[seasonStr]?.indexWhere((e) => e.id == current.id) ?? -1;

    if (currentIndex != -1) {
      // Try next episode in current season
      if (currentIndex + 1 < (data.episodes[seasonStr]?.length ?? 0)) {
        return data.episodes[seasonStr]![currentIndex + 1];
      }

      // Try first episode of next season
      final seasons = data.episodes.keys.map((s) => int.parse(s)).toList()
        ..sort();
      final currentSeasonIndex = seasons.indexOf(current.season!);
      if (currentSeasonIndex != -1 && currentSeasonIndex + 1 < seasons.length) {
        final nextSeason = seasons[currentSeasonIndex + 1].toString();
        if (data.episodes[nextSeason]?.isNotEmpty == true) {
          return data.episodes[nextSeason]!.first;
        }
      }
    }
    return null;
  }

  void _scrollEpisodes(bool forward) {
    final currentPosition = _episodeScrollController.offset;
    final scrollAmount =
        forward ? 300.0 : -300.0; // Adjust this value as needed
    _episodeScrollController.animateTo(
      (currentPosition + scrollAmount).clamp(
        0.0,
        _episodeScrollController.position.maxScrollExtent,
      ),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _startScrolling(bool forward) {
    _scrollTimer?.cancel();
    _scrollTimer = Timer.periodic(_scrollInterval, (timer) {
      if (_episodeScrollController.hasClients) {
        final newOffset = _episodeScrollController.offset +
            (forward ? _scrollAmount : -_scrollAmount);
        _episodeScrollController.animateTo(
          newOffset.clamp(
            0.0,
            _episodeScrollController.position.maxScrollExtent,
          ),
          duration: _scrollInterval,
          curve: Curves.linear,
        );
      }
    });
  }

  void _stopScrolling() {
    _scrollTimer?.cancel();
    _scrollTimer = null;
  }

  @override
  Widget build(BuildContext context) {
    final seriesData = ref.watch(seriesProvider(seriesId: widget.seriesId));
    final seriesInfoData =
        ref.watch(seriesInfoProvider(seriesId: widget.seriesId));
    final currentTheme = ref.watch(appThemeProvider);

    return NavigationView(
      content: ScaffoldPage(
        padding: const EdgeInsets.only(top: 5),
        content: seriesData.when(
          data: (series) => seriesInfoData.when(
            data: (info) => _buildContent(
              context,
              SeriesWithInfo(series, info),
              currentTheme,
            ),
            loading: () => const Center(child: ProgressRing()),
            error: (err, stack) => Center(
              child: Text('Error loading series info: $err'),
            ),
          ),
          loading: () => const Center(child: ProgressRing()),
          error: (err, stack) => Center(
            child: Text('Error loading series: $err'),
          ),
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
        SeriesHeaderSection(
            ref: ref,
            context: context,
            title: data.series.title ?? "",
            currentTheme: currentTheme),
        if (_isVideoPlaying(data))
          SeriesVideoPlayer(
            episode: data
                .episodes[_selectedSeason.toString()]![_selectedEpisodeIndex!],
            selectedSeason: _selectedSeason!,
            selectedEpisodeIndex: _selectedEpisodeIndex!,
            skipResumeDialog: true,
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
                          Row(
                            children: [
                              Expanded(
                                child: SeriesInfoSection(
                                  data: data,
                                  onTrailerPressed: _launchTrailer,
                                  showInfoChips: !_isVideoPlaying(data),
                                  onCloseVideo: _isVideoPlaying(data)
                                      ? () => setState(
                                          () => _selectedEpisodeIndex = null)
                                      : null,
                                ),
                              ),
                              if (!_isVideoPlaying(data))
                                _buildContinueButton(data),
                            ],
                          ),
                          const SizedBox(height: 16),
                          _buildDescription(context, data),
                          const SizedBox(height: 24),
                          SeriesCrewInfoSection(
                            selectedSeason: _selectedSeason,
                            selectedEpisodeIndex: _selectedEpisodeIndex,
                            context: context,
                            data: data,
                          ),
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

  Widget _buildContinueButton(SeriesWithInfo data) {
    final lastWatchedId =
        ref.watch(lastWatchedEpisodeProvider(widget.seriesId));

    if (lastWatchedId == null) {
      return GoToActionButton(
          label: 'Start Watching', onPressed: () => _startPlayback(data));
    }

    final lastWatchedEpisode = data.episodes.values
        .expand((e) => e)
        .firstWhere((e) => e.id == lastWatchedId);

    final progress = ref.watch(episodeProgressProvider(lastWatchedId));
    final isNearlyComplete = progress != null &&
        lastWatchedEpisode.durationSecs != null &&
        progress / lastWatchedEpisode.durationSecs! >= 0.95;

    if (isNearlyComplete) {
      final nextEpisode = _findNextEpisode(data, lastWatchedEpisode);
      if (nextEpisode != null) {
        return GoToActionButton(
            label: 'Next Episode',
            onPressed: () =>
                _startPlayback(data, specificEpisode: nextEpisode));
      }
      return const SizedBox.shrink(); // No next episode available
    }

    return GoToActionButton(
        label: 'Continue Watching',
        onPressed: () =>
            _startPlayback(data, specificEpisode: lastWatchedEpisode));
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

  Widget _buildSeasonSelector(BuildContext context, SeriesWithInfo data) {
    final seasons = _getValidSeasons(data)
      ..sort((a, b) => a.key.compareTo(b.key));
    _selectedSeason ??= seasons.firstOrNull?.key;
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
    final lastWatchedId =
        ref.watch(lastWatchedEpisodeProvider(widget.seriesId));

    // Determine which episode should be highlighted
    final int? highlightedEpisodeId = () {
      if (lastWatchedId == null) {
        return seasonEpisodes.firstOrNull?.id;
      }
      return lastWatchedId;
    }();

    // Add scroll to last watched episode logic
    if (!_hasScrolledToLastWatched &&
        lastWatchedId != null &&
        seasonEpisodes.isNotEmpty) {
      final episodeIndex =
          seasonEpisodes.indexWhere((e) => e.id == lastWatchedId);
      if (episodeIndex != -1) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          final scrollPosition = episodeIndex * 308.0;
          _episodeScrollController.animateTo(
            scrollPosition,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
          _hasScrolledToLastWatched = true;
        });
      }
    }

    return SizedBox(
      height: isVideoPlaying ? 95 : 240,
      child: Stack(
        children: [
          Scrollbar(
            controller: _episodeScrollController,
            child: ListView.builder(
              controller: _episodeScrollController,
              key: ValueKey('season_$_selectedSeason'),
              scrollDirection: Axis.horizontal,
              itemCount: seasonEpisodes.length,
              itemBuilder: (context, index) => EpisodeListItem(
                key: ValueKey(
                    'episode_${_selectedSeason}_${seasonEpisodes[index].id}'),
                episode: seasonEpisodes[index],
                isPlaying: index == _selectedEpisodeIndex,
                isHighlighted: seasonEpisodes[index].id == highlightedEpisodeId,
                isCompact: isVideoPlaying,
                onPressed: () => _onEpisodeSelected(index, data),
              ),
            ),
          ),
          // Navigation Arrows
          if (seasonEpisodes.length > 3) ...[
            Positioned.fill(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildNavigationButton(
                    context: context,
                    icon: FluentIcons.chevron_left,
                    onPressed: () => _scrollEpisodes(false),
                    forward: false,
                  ),
                  _buildNavigationButton(
                    context: context,
                    icon: FluentIcons.chevron_right,
                    onPressed: () => _scrollEpisodes(true),
                    forward: true,
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildNavigationButton({
    required BuildContext context,
    required IconData icon,
    required VoidCallback onPressed,
    required bool forward,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Center(
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: onPressed,
            onLongPressStart: (_) => _startScrolling(forward),
            onLongPressEnd: (_) => _stopScrolling(),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black.withOpacity(0.6),
                border: Border.all(
                  color: Colors.white.withOpacity(0.2),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 4,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onEpisodeSelected(int index, SeriesWithInfo data) {
    final episode = data.episodes[_selectedSeason.toString()]![index];
    ref
        .read(lastWatchedEpisodeProvider(widget.seriesId).notifier)
        .update(episode.id!);
    _selectedEpisodeIndex = index;
  }
}
