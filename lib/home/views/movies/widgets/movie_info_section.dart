import 'package:fluent_ui/fluent_ui.dart';
import 'package:play_shift/constants/ui_constants.dart';
import 'package:play_shift/provider/models/movie_view_model.dart';
import 'package:xtream_code_client/xtream_code_client.dart' hide Icon;

class MovieInfoSection extends StatelessWidget {
  final MovieViewModel movie;
  final XTremeCodeVodInfo? info;
  final Function(String) onTrailerPressed;
  final String Function(DateTime?) dateFormatter;
  final bool isFavorite;
  final Function() onFavoriteToggle;

  const MovieInfoSection({
    super.key,
    required this.movie,
    required this.info,
    required this.onTrailerPressed,
    required this.dateFormatter,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _buildFavoriteButton(context),
            if (info?.info.rating != null)
              _buildInfoChip(
                context,
                null,
                '${info!.info.rating}/10.0',
                icon: FluentIcons.favorite_star,
              ),
            if (info?.info.releasedate != null)
              _buildInfoChip(
                context,
                null,
                dateFormatter(info!.info.releasedate),
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
                context,
                null,
                info!.info.genre!,
                icon: FluentIcons.list,
              ),
            if (info?.info.country != null)
              _buildInfoChip(
                context,
                null,
                info!.info.country!,
                icon: FluentIcons.flag,
              ),
            if (info?.info.youtubeTrailer != null) _buildTrailerButton(context),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          movie.title,
          style: FluentTheme.of(context).typography.titleLarge,
        ),
        if (info?.info.description?.isNotEmpty ?? false) ...[
          const SizedBox(height: 8),
          Text(
            info!.info.description!,
            style: FluentTheme.of(context).typography.body,
          ),
        ],
        if (info?.info.cast?.isNotEmpty ?? false) ...[
          const SizedBox(height: 16),
          _buildSection(context, 'Cast', info!.info.cast!),
        ],
        if (info?.info.director?.isNotEmpty ?? false) ...[
          const SizedBox(height: 16),
          _buildSection(context, 'Director', info!.info.director!),
        ],
      ],
    );
  }

  Widget _buildSection(BuildContext context, String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: FluentTheme.of(context).typography.subtitle,
        ),
        const SizedBox(height: 8),
        Text(
          content,
          style: FluentTheme.of(context).typography.body,
        ),
      ],
    );
  }

  Widget _buildTrailerButton(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: HoverButton(
        onPressed: () => onTrailerPressed(info!.info.youtubeTrailer!),
        builder: (context, states) {
          return Card(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            backgroundColor: states.isHovered
                ? FluentTheme.of(context).accentColor.lighter
                : FluentTheme.of(context).accentColor,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  FluentIcons.play,
                  size: UIConstants.chipIconSize,
                  color: Colors.white,
                ),
                const SizedBox(width: 8),
                Text(
                  'Watch Trailer',
                  style: FluentTheme.of(context).typography.body?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ],
            ),
          );
        },
      ),
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
    VoidCallback? onTap,
  }) {
    final content = Row(
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
    );

    final card = Card(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: onTap != null
          ? HoverButton(
              onPressed: onTap,
              builder: (context, states) {
                return content;
              },
            )
          : content,
    );

    return label?.isNotEmpty == true
        ? InfoLabel(
            label: label!,
            child: card,
          )
        : card;
  }
}
