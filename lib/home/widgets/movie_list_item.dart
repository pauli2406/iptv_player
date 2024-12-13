import 'package:auto_route/auto_route.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:play_shift/home/widgets/generic_media_list_item.dart';
import 'package:play_shift/provider/isar/movie_providers.dart';
import 'package:play_shift/provider/models/movie_view_model.dart';
import 'package:play_shift/shared/theme_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieListItem extends ConsumerWidget {
  const MovieListItem({
    required this.movie,
    required this.height,
    required this.route,
    this.titleMaxLines = 1,
    super.key,
  });

  final MovieViewModel movie;
  final double height;
  final PageRouteInfo route;
  final int titleMaxLines;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = ref.watch(movieProgressProvider(movie.streamId));
    final progressPercentage = progress != null && movie.durationSecs != null
        ? (progress / movie.durationSecs!).clamp(0.0, 1.0)
        : 0.0;

    return HoverButton(
      onPressed: () => context.pushRoute(route),
      builder: (context, states) => MediaListItem(
        imageUrl: movie.streamIcon!,
        title: movie.title,
        subtitle: null,
        height: height,
        onTap: () => context.pushRoute(route),
        backgroundColor: ThemeService().defaultBackground(context),
        hoverBackgroundColor: ThemeService().hoverBackgroundColor(context),
        titleMaxLines: titleMaxLines,
        progressPercentage:
            progress != null && progress > 0 ? progressPercentage : null,
        showProgressIcon: true,
      ),
    );
  }
}
