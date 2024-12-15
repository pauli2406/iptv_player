import 'package:auto_route/auto_route.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:play_shift/home/widgets/generic_media_list_item.dart';
import 'package:play_shift/provider/isar/favorite_providers.dart';
import 'package:play_shift/provider/isar/movie_providers.dart';
import 'package:play_shift/provider/models/channel_view_model.dart';
import 'package:play_shift/shared/theme_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChannelListItem extends ConsumerWidget {
  const ChannelListItem({
    required this.channelViewModel,
    required this.height,
    required this.route,
    this.titleMaxLines = 1,
    super.key,
  });

  final ChannelViewModel channelViewModel;
  final double height;
  final PageRouteInfo route;
  final int titleMaxLines;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress =
        ref.watch(movieProgressProvider(channelViewModel.streamId!));
    final isFavorite = ref
            .watch(isChannelFavoriteProvider(channelViewModel.streamId!))
            .value ??
        false;

    return GestureDetector(
      onTap: () => AutoRouter.of(context).push(route),
      child: Card(
        child: MediaListItem(
          imageUrl: channelViewModel.logoUrl,
          title: channelViewModel.title,
          subtitle: channelViewModel.currentEpgItem?.title,
          height: height,
          onTap: () => context.pushRoute(route),
          backgroundColor: ThemeService().defaultBackground(context),
          hoverBackgroundColor: ThemeService().hoverBackgroundColor(context),
          titleMaxLines: titleMaxLines,
          isFavorite: isFavorite,
          onFavoritePressed: () {
            ref.read(favoritesProvider.notifier).toggleChannelFavorite(channelViewModel.streamId!);
          },
        ),
      ),
    );
  }
}
