import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:play_shift/constants/ui_constants.dart';
import 'package:play_shift/provider/models/provider_models.dart';

class SeriesInfoSection extends ConsumerWidget {
  final SeriesWithInfo data;
  final Function(String) onTrailerPressed;
  final bool showInfoChips;
  final VoidCallback? onCloseVideo;
  final bool isFavorite;
  final Function() onFavoriteToggle;

  const SeriesInfoSection({
    super.key,
    required this.data,
    required this.onTrailerPressed,
    required this.isFavorite,
    required this.onFavoriteToggle,
    this.showInfoChips = true,
    this.onCloseVideo,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                data.series.title?.trim() ?? "",
                style: FluentTheme.of(context).typography.titleLarge,
              ),
            ),
            if (onCloseVideo != null)
              IconButton(
                icon: const Icon(FluentIcons.up),
                onPressed: onCloseVideo,
              ),
          ],
        ),
        if (showInfoChips) ...[
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildFavoriteButton(context),
              if (data.rating != null && data.rating.toString().isNotEmpty)
                _buildInfoChip(
                  context,
                  null,
                  '${data.rating}/10.0',
                  icon: FluentIcons.favorite_star,
                ),
              if (data.year != null && data.year.toString().isNotEmpty)
                _buildInfoChip(
                  context,
                  null,
                  data.year.toString(),
                  icon: FluentIcons.calendar,
                ),
              if (data.runtime != null && data.runtime.toString().isNotEmpty)
                _buildInfoChip(
                  context,
                  null,
                  '${data.runtime! ~/ 60}h ${data.runtime! % 60}m',
                  icon: FluentIcons.timer,
                ),
              if (data.genre != null && data.genre!.trim().isNotEmpty)
                _buildInfoChip(
                  context,
                  null,
                  data.genre!,
                  icon: FluentIcons.list,
                ),
              if (data.episodes.isNotEmpty)
                _buildInfoChip(
                  context,
                  null,
                  '${data.episodes.length} Seasons',
                  icon: FluentIcons.video,
                ),
              if (data.youtubeTrailer != null &&
                  data.youtubeTrailer!.trim().isNotEmpty)
                _buildTrailerButton(context),
            ],
          ),
        ],
      ],
    );
  }

  Widget _buildFavoriteButton(BuildContext context) {
    final yellowColor = Colors.yellow;
    final darkYellow = Colors.yellow.darker;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: HoverButton(
        onPressed: onFavoriteToggle,
        builder: (context, states) {
          return Card(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            backgroundColor: states.isHovered
                ? isFavorite
                    ? darkYellow
                    : FluentTheme.of(context)
                        .resources
                        .controlAltFillColorSecondary
                : isFavorite
                    ? yellowColor
                    : null,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isFavorite
                      ? FluentIcons.favorite_star_fill
                      : FluentIcons.favorite_star,
                  size: UIConstants.chipIconSize,
                  color: isFavorite ? Colors.black : yellowColor,
                ),
                const SizedBox(width: 8),
                Text(
                  isFavorite ? 'Remove Favorite' : 'Add Favorite',
                  style: FluentTheme.of(context).typography.body?.copyWith(
                        color: isFavorite ? Colors.black : yellowColor,
                      ),
                ),
              ],
            ),
          );
        },
      ),
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
              size: UIConstants.chipIconSize,
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

  Widget _buildTrailerButton(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: HoverButton(
        onPressed: () => onTrailerPressed(data.youtubeTrailer!),
        builder: (context, states) {
          return Card(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            backgroundColor: states.isHovered
                ? FluentTheme.of(context).accentColor
                : FluentTheme.of(context).cardColor,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  FluentIcons.play,
                  size: UIConstants.chipIconSize,
                ),
                const SizedBox(width: 8),
                Text(
                  'Watch Trailer',
                  style: FluentTheme.of(context).typography.body,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
