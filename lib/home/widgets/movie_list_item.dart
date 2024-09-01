import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:go_router/go_router.dart';
import 'package:iptv_player/provider/isar/m3u_provider.dart';
import 'package:macos_ui/macos_ui.dart';

class M3uListItem extends StatefulWidget {
  const M3uListItem({
    required this.channelViewModel,
    required this.height,
    required this.route,
    super.key,
  });
  final ChannelViewModel channelViewModel;
  final double height;
  final String route;

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
          context.go(widget.route, extra: {
            'link': widget.channelViewModel.link,
            'streamId': widget.channelViewModel.streamId,
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isHovering
                ? MacosTheme.of(context).dividerColor
                : MacosTheme.of(context).canvasColor,
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
                        child: ProgressBar(
                          value: progress.progressPercentage.value,
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
                height: widget.height / 18,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.channelViewModel.title,
                    style: MacosTheme.of(context).typography.body,
                  ),
                ),
              ),
              SizedBox(
                height: widget.height / 12,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 48.0,
                  ),
                  child: Text(
                    widget.channelViewModel.currentEpgItem?.title ?? '',
                    style: MacosTheme.of(context).typography.caption1,
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
