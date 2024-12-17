import 'package:auto_route/auto_route.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:play_shift/home/widgets/generic_media_list_item.dart';
import 'package:play_shift/provider/isar/favorite_providers.dart';
import 'package:play_shift/router/app_router.gr.dart';
import 'package:play_shift/service/collections/series_item.dart';
import 'package:play_shift/shared/theme_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SeriesListItem extends ConsumerWidget {
  const SeriesListItem(this.seriesItem, {required this.height, super.key});

  final SeriesItem seriesItem;
  final double height;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite = ref.watch(isSeriesFavoriteProvider(seriesItem.id)).value ?? false;

    return GestureDetector(
      onTap: () => context.router.push(
        SeriesOverviewRoute(seriesId: seriesItem.id),
      ),
      child: Card(
        child: Stack(
          children: [
            MediaListItem(
              imageUrl: seriesItem.cover ?? "https://placehold.co/600x400",
              title: seriesItem.title ?? '',
              height: height,
              backgroundColor: ThemeService().defaultBackground(context),
              hoverBackgroundColor:
                  ThemeService().hoverBackgroundColor(context),
              titleMaxLines: 2,
              onTap: () => context
                  .pushRoute(SeriesOverviewRoute(seriesId: seriesItem.id)),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: IconButton(
                icon: Icon(
                  isFavorite
                      ? FluentIcons.favorite_star_fill
                      : FluentIcons.favorite_star,
                  color: isFavorite ? Colors.yellow : Colors.white,
                ),
                onPressed: () {
                  ref
                      .read(favoritesProvider.notifier)
                      .toggleSeriesFavorite(seriesItem.id);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
