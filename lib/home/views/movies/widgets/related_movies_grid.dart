import 'package:fluent_ui/fluent_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:play_shift/constants/ui_constants.dart';
import 'package:play_shift/provider/models/movie_view_model.dart';
import 'package:play_shift/router/app_router.gr.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';

class RelatedMoviesGrid extends StatelessWidget {
  final List<MovieViewModel> movies;

  const RelatedMoviesGrid({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int row = 0; row < UIConstants.relatedMoviesRows; row++)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (int col = 0; col < UIConstants.relatedMoviesPerRow; col++)
                  if ((row * UIConstants.relatedMoviesPerRow + col) <
                      movies.length)
                    _RelatedMovieCard(
                      movie:
                          movies[row * UIConstants.relatedMoviesPerRow + col],
                    ),
              ],
            ),
          ),
      ],
    );
  }
}

class _RelatedMovieCard extends StatelessWidget {
  final MovieViewModel movie;

  const _RelatedMovieCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: UIConstants.relatedMovieWidth,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: HoverButton(
          onPressed: () => context.router.replace(
            MovieOverviewRoute(streamId: movie.streamId),
          ),
          builder: (context, states) => Card(
            padding: const EdgeInsets.all(4),
            backgroundColor: states.isHovered
                ? FluentTheme.of(context)
                    .resources
                    .cardBackgroundFillColorSecondary
                : null,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (movie.streamIcon?.isNotEmpty ?? false)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: FastCachedImage(
                      url: movie.streamIcon!,
                      width: UIConstants.relatedMovieWidth,
                      height: UIConstants.relatedMovieHeight,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, progress) =>
                          const ProgressRing(),
                      errorBuilder: (context, error, stack) =>
                          const Icon(FluentIcons.error),
                    ),
                  ),
                const SizedBox(height: 4),
                Text(
                  movie.title,
                  style: FluentTheme.of(context).typography.bodyStrong,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (movie.year != null)
                  Text(
                    movie.year.toString(),
                    style: FluentTheme.of(context).typography.caption,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
