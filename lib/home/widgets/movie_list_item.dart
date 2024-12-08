import 'package:auto_route/auto_route.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:play_shift/home/widgets/generic_media_list_item.dart';
import 'package:play_shift/provider/isar/movie_providers.dart';
import 'package:play_shift/provider/models/channel_view_model.dart';
import 'package:play_shift/shared/theme_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class M3uListItem extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    final progress =
        ref.watch(movieProgressProvider(channelViewModel.streamId!));

    return HoverButton(
      onPressed: () => context.pushRoute(route),
      builder: (context, states) => Stack(
        children: [
          MediaListItem(
            imageUrl: channelViewModel.logoUrl,
            title: channelViewModel.title,
            subtitle: channelViewModel.currentEpgItem?.title,
            height: height,
            onTap: () => context.pushRoute(route),
            backgroundColor: ThemeService().defaultBackground(context),
            hoverBackgroundColor: ThemeService().hoverBackgroundColor(context),
            titleMaxLines: titleMaxLines,
          ),
          if (progress != null && progress > 0)
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Icon(
                  FluentIcons.check_mark,
                  color: Colors.white,
                  size: 12,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
