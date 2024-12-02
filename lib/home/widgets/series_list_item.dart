import 'package:auto_route/auto_route.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:play_shift/home/widgets/generic_media_list_item.dart';
import 'package:play_shift/router/app_router.gr.dart';
import 'package:play_shift/service/collections/series_item.dart';
import 'package:play_shift/shared/theme_service.dart';

class SeriesListItem extends StatelessWidget {
  const SeriesListItem(this.seriesItem, {required this.height, super.key});

  final SeriesItem seriesItem;
  final double height;

  @override
  Widget build(BuildContext context) {
    return MediaListItem(
      imageUrl: seriesItem.cover ?? "https://placehold.co/600x400",
      title: seriesItem.title ?? '',
      height: height,
      backgroundColor: ThemeService().defaultBackground(context),
      hoverBackgroundColor: ThemeService().hoverBackgroundColor(context),
      onTap: () => context.router.push(
        SeriesSeasonPageRoute(seriesId: seriesItem.id),
      ),
      titleMaxLines: 2,
    );
  }
}
