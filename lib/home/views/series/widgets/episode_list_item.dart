import 'package:fluent_ui/fluent_ui.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:play_shift/service/collections/series_episode.dart';
import 'package:play_shift/utils/duration_formatter.dart';
import 'package:play_shift/provider/isar/series_providers.dart';

class EpisodeListItem extends ConsumerWidget {
  final SeriesEpisode episode;
  final bool isPlaying;
  final bool isCompact;
  final VoidCallback onPressed;

  const EpisodeListItem({
    super.key,
    required this.episode,
    required this.isPlaying,
    required this.isCompact,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = ref.watch(episodeProgressProvider(episode.id ?? 0));
    final progressPercentage = progress != null && episode.durationSecs != null
        ? (progress / episode.durationSecs!).clamp(0.0, 1.0)
        : 0.0;

    return Card(
      padding: EdgeInsets.zero,
      margin: const EdgeInsets.only(right: 8),
      child: Button(
        style: ButtonStyle(
          padding: WidgetStateProperty.all(EdgeInsets.zero),
          backgroundColor: WidgetStateProperty.all(
            isPlaying ? FluentTheme.of(context).accentColor : null,
          ),
        ),
        onPressed: onPressed,
        child: Container(
          width: isCompact ? 200 : 300,
          padding: const EdgeInsets.all(8.0),
          child: isCompact
              ? _buildCompactView(context, progressPercentage)
              : _buildDetailedView(context, progressPercentage),
        ),
      ),
    );
  }

  Widget _buildCompactView(BuildContext context, double progressPercentage) {
    final isCompleted = progressPercentage >= 0.98;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Episode ${episode.episodeNum}',
          style: FluentTheme.of(context).typography.bodyStrong,
        ),
        if (progressPercentage > 0) ...[
          const SizedBox(height: 8),
          if (isCompleted)
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: isPlaying
                    ? FluentTheme.of(context)
                        .resources
                        .textOnAccentFillColorSelectedText
                    : FluentTheme.of(context).accentColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: FluentTheme.of(context).accentColor.withOpacity(0.3),
                    blurRadius: 8,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Icon(
                FluentIcons.check_mark,
                size: 14,
                color: isPlaying
                    ? FluentTheme.of(context).accentColor
                    : FluentTheme.of(context)
                        .resources
                        .textOnAccentFillColorPrimary,
              ),
            )
          else
            SizedBox(
              width: 100,
              child: ProgressBar(
                value: progressPercentage * 100,
                strokeWidth: 3,
              ),
            ),
        ],
      ],
    );
  }

  Widget _buildDetailedView(BuildContext context, double progressPercentage) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildThumbnail(context),
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
                DurationFormatter.formatSeconds(episode.durationSecs!),
                style: FluentTheme.of(context).typography.caption,
              ),
          ],
        ),
        if (progressPercentage > 0) ...[
          const SizedBox(height: 4),
          ProgressBar(value: progressPercentage * 100),
        ],
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

  Widget _buildThumbnail(BuildContext context) {
    if (episode.movieImage != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: FastCachedImage(
          url: episode.movieImage!,
          height: 120,
          width: double.infinity,
          fit: BoxFit.cover,
          loadingBuilder: (context, progress) => const SizedBox(
            height: 120,
            child: Center(child: ProgressRing()),
          ),
          errorBuilder: (context, error, stack) => _buildPlaceholder(context),
        ),
      );
    }
    return _buildPlaceholder(context);
  }

  Widget _buildPlaceholder(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color:
            FluentTheme.of(context).resources.cardBackgroundFillColorSecondary,
        borderRadius: BorderRadius.circular(4),
      ),
      child: const Center(
        child: Icon(FluentIcons.video),
      ),
    );
  }
}
