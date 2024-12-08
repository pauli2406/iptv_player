import 'package:auto_route/auto_route.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:play_shift/provider/isar/m3u_provider.dart';
import 'package:play_shift/router/app_router.gr.dart';
import 'package:play_shift/video_player/base_video_player.dart';
import 'package:platform_builder/platform.dart';
import 'package:play_shift/video_player/base_video_player_config.dart';
import 'package:play_shift/theme.dart';

@RoutePage()
class ChannelOverview extends ConsumerStatefulWidget {
  final int streamId;

  const ChannelOverview({
    super.key,
    required this.streamId,
  });

  @override
  ConsumerState<ChannelOverview> createState() => _ChannelOverviewState();
}

class _ChannelOverviewState extends ConsumerState<ChannelOverview> {
  bool showPastItems = false;
  bool showPastButton = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels > 0 && !showPastButton) {
      setState(() => showPastButton = true);
    } else if (_scrollController.position.pixels <= 0 && showPastButton) {
      setState(() => showPastButton = false);
    }
  }

  String _formatDuration(DateTime start, DateTime end) {
    final duration = end.difference(start);
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    if (hours > 0) {
      return '${hours}h ${minutes}min';
    }
    return '${minutes}min';
  }

  bool _isCurrentEpg(DateTime start, DateTime end) {
    final now = DateTime.now();
    return now.isAfter(start) && now.isBefore(end);
  }

  bool _isPastEpg(DateTime end) {
    return end.isBefore(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    final channel = ref.watch(findChannelProvider(streamId: widget.streamId));
    final currentTheme = ref.watch(appThemeProvider);
    final alternativeChannels = ref.watch(findAlternativeChannelsProvider(
      channel.currentEpgItem?.title ?? '',
      channel.streamId!,
    ));

    return NavigationView(
      content: ScaffoldPage(
        padding: EdgeInsets.only(top: 5),
        content: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: FluentTheme.of(context)
                              .resources
                              .dividerStrokeColorDefault,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(FluentIcons.back),
                          onPressed: () => context.router.maybePop(),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          channel.title,
                          style: FluentTheme.of(context)
                              .navigationPaneTheme
                              .itemHeaderTextStyle,
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(FluentIcons.color),
                          onPressed: () {
                            ref
                                .read(appThemeProvider.notifier)
                                .setAndPersistThemeMode(
                                  currentTheme == ThemeMode.light
                                      ? ThemeMode.dark
                                      : ThemeMode.light,
                                );
                          },
                        ),
                      ],
                    ),
                  ),
                  // Video player section
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: BaseVideoPlayer(
                      key: ValueKey(
                          'video_player_${channel.streamId}'), // Add this line
                      streamLink: channel.link,
                      builder: (controller) => (Platform.instance.isMacOS ||
                              Platform.instance.isWindows)
                          ? MaterialDesktopVideoControlsTheme(
                              normal: BaseVideoPlayerConfig.desktopThemeData(),
                              fullscreen:
                                  BaseVideoPlayerConfig.desktopThemeData(),
                              child: Video(
                                controller: controller,
                                controls: MaterialDesktopVideoControls,
                              ),
                            )
                          : MaterialVideoControlsTheme(
                              normal: BaseVideoPlayerConfig.mobileThemeData(),
                              fullscreen:
                                  BaseVideoPlayerConfig.mobileThemeData(),
                              child: Video(
                                controller: controller,
                                controls: MaterialVideoControls,
                              ),
                            ),
                    ),
                  ),
                  // EPG header
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Program Guide (EPG)',
                      style: FluentTheme.of(context).typography.subtitle,
                    ),
                  ),
                  // EPG list
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Card(
                        child: Column(
                          children: [
                            if (channel.epgItems
                                    .any((epg) => _isPastEpg(epg.end!)) &&
                                showPastButton)
                              AnimatedSlide(
                                duration: const Duration(milliseconds: 200),
                                offset: showPastButton
                                    ? Offset.zero
                                    : const Offset(0, -1),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ToggleButton(
                                    checked: showPastItems,
                                    onChanged: (value) =>
                                        setState(() => showPastItems = value),
                                    child: Text('Show past programs'),
                                  ),
                                ),
                              ),
                            Expanded(
                              child: ListView.builder(
                                controller: _scrollController,
                                padding: const EdgeInsets.all(8.0),
                                itemCount: channel.epgItems.length,
                                itemBuilder: (context, index) {
                                  final epg = channel.epgItems[index];
                                  final timeFormat = DateFormat('HH:mm');
                                  final dateFormat =
                                      DateFormat('E, MMM d'); // Add date format
                                  final isPast = _isPastEpg(epg.end!);
                                  final isCurrent =
                                      _isCurrentEpg(epg.start!, epg.end!);

                                  if (isPast && !showPastItems) {
                                    return const SizedBox.shrink();
                                  }
                                  return Expander(
                                    header: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              dateFormat.format(epg.start!),
                                              style: FluentTheme.of(context)
                                                  .typography
                                                  .caption,
                                            ),
                                            Text(
                                              '${timeFormat.format(epg.start!)} - ${timeFormat.format(epg.end!)}',
                                              style: FluentTheme.of(context)
                                                  .typography
                                                  .body,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          _formatDuration(epg.start!, epg.end!),
                                          style: FluentTheme.of(context)
                                              .typography
                                              .caption,
                                        ),
                                        const SizedBox(width: 16),
                                        Text(
                                          epg.title ?? '',
                                          style: isCurrent
                                              ? FluentTheme.of(context)
                                                  .typography
                                                  .bodyStrong
                                                  ?.copyWith(
                                                    color: Colors.blue,
                                                  )
                                              : FluentTheme.of(context)
                                                  .typography
                                                  .bodyStrong,
                                        ),
                                        if (isCurrent) ...[
                                          const SizedBox(width: 8),
                                          const Icon(FluentIcons.play,
                                              size: 12),
                                        ],
                                      ],
                                    ),
                                    initiallyExpanded: isCurrent,
                                    content:
                                        epg.description?.isNotEmpty ?? false
                                            ? Text(
                                                epg.description!,
                                                style: FluentTheme.of(context)
                                                    .typography
                                                    .caption,
                                              )
                                            : const SizedBox.shrink(),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (alternativeChannels.isNotEmpty)
              Container(
                width: 300,
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: FluentTheme.of(context)
                          .resources
                          .dividerStrokeColorDefault,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Alternative Channels',
                        style: FluentTheme.of(context).typography.subtitle,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: alternativeChannels.length,
                        itemBuilder: (context, index) {
                          final altChannel = alternativeChannels[index];
                          return ListTile(
                            leading: altChannel.logoUrl.isNotEmpty
                                ? Image.network(
                                    altChannel.logoUrl,
                                    width: 40,
                                    height: 40,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            const Icon(FluentIcons.t_v_monitor),
                                  )
                                : const Icon(FluentIcons.t_v_monitor),
                            title: Text(altChannel.title),
                            subtitle: altChannel.currentEpgItem != null
                                ? Text(
                                    '${DateFormat('HH:mm').format(altChannel.currentEpgItem!.start!)} - ${DateFormat('HH:mm').format(altChannel.currentEpgItem!.end!)}',
                                    style: FluentTheme.of(context)
                                        .typography
                                        .caption,
                                  )
                                : null,
                            onPressed: () {
                              context.router.replace(
                                ChannelOverviewRoute(
                                    streamId: altChannel.streamId!),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
