import 'package:fluent_ui/fluent_ui.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:play_shift/service/collections/series_episode.dart';
import 'package:play_shift/utils/duration_formatter.dart';

class EpisodeListItem extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Card(
      padding: EdgeInsets.zero,
      margin: const EdgeInsets.only(right: 8),
      child: Button(
        style: ButtonStyle(
          padding: ButtonState.all(EdgeInsets.zero),
          backgroundColor: ButtonState.all(
            isPlaying ? FluentTheme.of(context).accentColor : null,
          ),
        ),
        onPressed: onPressed,
        child: Container(
          width: isCompact ? 200 : 300,
          padding: const EdgeInsets.all(8.0),
          child: isCompact
              ? _buildCompactView(context)
              : _buildDetailedView(context),
        ),
      ),
    );
  }

  Widget _buildCompactView(BuildContext context) {
    return Center(
      child: Text(
        'Episode ${episode.episodeNum}',
        style: FluentTheme.of(context).typography.bodyStrong,
      ),
    );
  }

  Widget _buildDetailedView(BuildContext context) {
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
