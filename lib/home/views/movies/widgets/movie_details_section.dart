import 'package:fluent_ui/fluent_ui.dart';
import 'package:play_shift/constants/ui_constants.dart';
import 'package:play_shift/provider/isar/favorite_providers.dart';
import 'package:play_shift/provider/models/movie_view_model.dart';
import 'package:xtream_code_client/xtream_code_client.dart' hide Icon;
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:play_shift/home/views/movies/widgets/movie_info_section.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieDetailsSection extends ConsumerWidget {
  final MovieViewModel movie;
  final XTremeCodeVodInfo? info;
  final Function(String) onTrailerPressed;
  final String Function(DateTime?) dateFormatter;

  const MovieDetailsSection({
    super.key,
    required this.movie,
    required this.info,
    required this.onTrailerPressed,
    required this.dateFormatter,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteState = ref.watch(isMovieFavoriteProvider(movie.streamId));

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (info?.info.coverBig != null)
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: FastCachedImage(
              url: info!.info.coverBig!,
              width: UIConstants.moviePosterWidth,
              height: UIConstants.moviePosterHeight,
              fit: BoxFit.cover,
              loadingBuilder: (context, progress) => const ProgressRing(),
              errorBuilder: (context, error, stack) =>
                  const Icon(FluentIcons.error),
            ),
          ),
        const SizedBox(width: UIConstants.movieDetailsPadding),
        Expanded(
          child: MovieInfoSection(
            movie: movie,
            info: info,
            onTrailerPressed: onTrailerPressed,
            dateFormatter: dateFormatter,
            isFavorite: favoriteState.whenOrNull(
                  data: (isFavorite) => isFavorite,
                ) ??
                false,
            onFavoriteToggle: () => ref
                .read(favoritesProvider.notifier)
                .toggleMovieFavorite(movie.streamId),
          ),
        ),
      ],
    );
  }
}
