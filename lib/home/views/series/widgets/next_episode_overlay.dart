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
    return Positioned(
      right: 40,
      bottom: 80,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.8),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Next Episode',
              style: FluentTheme.of(context).typography.subtitle,
            ),
            const SizedBox(height: 8),
            Text(
              nextEpisode.title ?? 'Episode ${nextEpisode.episodeNum}',
              style: FluentTheme.of(context).typography.body,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FilledButton(
                  onPressed: onPlayNext,
                  child: const Text('Play Next'),
                ),
                const SizedBox(width: 8),
                Button(
                  onPressed: onCancel,
                  child: const Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
