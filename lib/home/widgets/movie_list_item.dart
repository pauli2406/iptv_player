import 'package:auto_route/auto_route.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:play_shift/home/widgets/generic_media_list_item.dart';
import 'package:play_shift/provider/models/channel_view_model.dart';
import 'package:play_shift/shared/theme_service.dart';

class M3uListItem extends StatelessWidget {
  const M3uListItem({
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
  Widget build(BuildContext context) {
    return MediaListItem(
      imageUrl: channelViewModel.logoUrl,
      title: channelViewModel.title,
      subtitle: channelViewModel.currentEpgItem?.title,
      height: height,
      backgroundColor: ThemeService().defaultBackground(context),
      hoverBackgroundColor: ThemeService().hoverBackgroundColor(context),
      titleMaxLines: titleMaxLines,
      onTap: () => context.navigateTo(route),
    );
  }
}
