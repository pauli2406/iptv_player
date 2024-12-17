import 'package:fluent_ui/fluent_ui.dart';
import 'package:play_shift/service/collections/series_episode.dart';

class NextEpisodeOverlay extends StatelessWidget {
  final SeriesEpisode nextEpisode;
  final VoidCallback onPlayNext;
  final VoidCallback onCancel;

  const NextEpisodeOverlay({
    super.key,
    required this.nextEpisode,
    required this.onPlayNext,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);

    return Positioned(
      right: 40,
      bottom: 80,
      child: Card(
        padding: const EdgeInsets.all(16),
        backgroundColor: theme.micaBackgroundColor.withOpacity(0.8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Next Episode',
              style: theme.typography.subtitle,
            ),
            const SizedBox(height: 8),
            Text(
              nextEpisode.title ?? 'Episode ${nextEpisode.episodeNum}',
              style: theme.typography.body,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FilledButton(
                  onPressed: onPlayNext,
                  child: const Text('Play Next'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
