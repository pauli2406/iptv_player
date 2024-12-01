import 'package:auto_route/auto_route.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:fluent_ui/fluent_ui.dart' hide ProgressBar;
import 'package:flutter/gestures.dart';
import 'package:iptv_player/provider/isar/m3u_provider.dart';
import 'package:iptv_player/shared/theme_service.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:platform_builder/platform_builder.dart';

class M3uListItem extends StatefulWidget {
  const M3uListItem({
    required this.channelViewModel,
    required this.height,
    required this.route,
    super.key,
  });

  final ChannelViewModel channelViewModel;
  final double height;
  final PageRouteInfo route;

  @override
  State<M3uListItem> createState() => _M3uListItemState();
}

class _M3uListItemState extends State<M3uListItem> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onExit: (event) {
        setState(() => isHovering = false);
      },
      onHover: (PointerHoverEvent hovering) {
        setState(() => isHovering = true);
      },
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () async {
          context.navigateTo(widget.route);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isHovering
                ? const Color.fromARGB(255, 133, 133, 133)
                : ThemeService().defaultBackground(context),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(10),
                  ),
                  child: FastCachedImage(
                    fit: BoxFit.fitWidth,
                    url: widget.channelViewModel.logoUrl,
                    loadingBuilder: (context, progress) {
                      return Center(
                        child: PlatformBuilder(
                          macOSBuilder: (context) => ProgressRing(
                            value: progress.progressPercentage.value,
                          ),
                          windowsBuilder: (context) => ProgressRing(
                            value: progress.progressPercentage.value,
                          ),
                          iOSBuilder: (context) => ProgressBar(
                            value: progress.progressPercentage.value,
                          ),
                        ),
                      );
                    },
                    errorBuilder: (context, exception, stacktrace) =>
                        Image.asset(
                      "assets/images/no_image_available.png",
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.channelViewModel.title,
                    style: ThemeService().textStyleBody(context),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 48.0,
                  ),
                  child: Text(
                    widget.channelViewModel.currentEpgItem?.title ?? '',
                    style: ThemeService().textStyleCaption(context),
                    maxLines: 2,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
