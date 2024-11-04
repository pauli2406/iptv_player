import 'package:auto_route/auto_route.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:fluent_ui/fluent_ui.dart' hide ProgressBar;
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:iptv_player/router/app_router.gr.dart';
import 'package:iptv_player/service/collections/series_item.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:platform_builder/platform_builder.dart';

class SeriesListItem extends StatefulWidget {
  const SeriesListItem(this.seriesItem, {required this.height, super.key});

  final SeriesItem seriesItem;
  final double height;

  @override
  State<SeriesListItem> createState() => _SeriesListItemState();
}

class _SeriesListItemState extends State<SeriesListItem> {
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
          context.router.push(
            SeriesSeasonPageRoute(seriesId: widget.seriesItem.id),
          );
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
                  url:
                      widget.seriesItem.cover ?? "https://placehold.co/600x400",
                  loadingBuilder: (context, progress) {
                    return Center(
                      child: PlatformBuilder(
                        macOSBuilder: (context) => ProgressBar(
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
                      const Icon(CupertinoIcons.exclamationmark_octagon),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${widget.seriesItem.title}",
                style: MacosTheme.of(context).typography.body,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
