import 'dart:convert';

import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:go_router/go_router.dart';
import 'package:iptv_player/service/collections/epg_item.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:platform_builder/platform_builder.dart';

class M3uListItem extends StatefulWidget {
  const M3uListItem({
    required this.link,
    required this.title,
    required this.logoUrl,
    required this.isLive,
    this.currentEpgItem,
    required this.height,
    super.key,
  });

  final String link, title, logoUrl;
  final bool isLive;
  final double height;
  final EpgItem? currentEpgItem;

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
          if (Platform.instance.isMacOS || Platform.instance.isWindows) {
            try {
              final windowIds = await DesktopMultiWindow.getAllSubWindowIds();
              if (windowIds.isNotEmpty) {
                for (var element in windowIds) {
                  await WindowController.fromWindowId(element).close();
                }
              }
            } catch (e) {
              debugPrint(e.toString());
            }
            final window = await DesktopMultiWindow.createWindow(jsonEncode(
              {
                'args0': 'player',
                'link': widget.link,
                'epgTitle': utf8
                    .decode(base64.decode(widget.currentEpgItem?.title ?? "")),
                'isLive': widget.isLive,
              },
            ));
            debugPrint('$window');
            window
              ..setFrame(const Offset(0, 0) & const Size(960, 540))
              ..center()
              ..setTitle(widget.title)
              ..show();
          } else {
            

            context.go("/main/player", extra: {
              'link': widget.link,
              'currentEpgItem': widget.currentEpgItem?.title,
            });
          }
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isHovering
                ? MacosTheme.of(context).dividerColor
                : MacosTheme.of(context).canvasColor,
          ),
          child: Column(children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
                child: FastCachedImage(
                  fit: BoxFit.fitHeight,
                  url: widget.logoUrl,
                  loadingBuilder: (context, progress) {
                    return Center(
                      child: ProgressBar(
                        value: progress.progressPercentage.value,
                      ),
                    );
                  },
                  errorBuilder: (context, exception, stacktrace) => Image.asset(
                    "assets/images/no_image_available.png",
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.title,
                style: MacosTheme.of(context).typography.body,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 48.0,
              ),
              child: Text(
                utf8.decode(base64.decode(widget.currentEpgItem?.title ?? "")),
                style: MacosTheme.of(context).typography.caption1,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
