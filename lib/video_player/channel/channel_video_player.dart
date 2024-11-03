import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iptv_player/provider/isar/m3u_provider.dart';
import 'package:iptv_player/video_player/channel/overlay_channel_list.dart';
import 'package:iptv_player/video_player/video_player.dart';
import 'package:media_kit_video/media_kit_video.dart';

@RoutePage()
class ChannelVideoPlayer extends ConsumerStatefulWidget {
  const ChannelVideoPlayer({super.key, required this.streamId});
  final int streamId;

  @override
  ConsumerState<ChannelVideoPlayer> createState() => _ChannelVideoPlayerState();
}

class _ChannelVideoPlayerState extends ConsumerState<ChannelVideoPlayer> {
  bool _showOverlay = false;
  late int _currentStreamId;

  @override
  void initState() {
    super.initState();
    _currentStreamId = widget.streamId;
  }

  @override
  Widget build(BuildContext context) {
    final channels = ref.watch(findAllChannelsProvider());
    final channel = ref.watch(findChannelProvider(streamId: _currentStreamId));

    return VideoPlayer(
      key: ValueKey(_currentStreamId),
      stream: channel,
      overlay: _buildOverlayChannelList(channels),
      topButtonBar: _buildTopButtonBar(context, channel),
    );
  }

  Widget _buildOverlayChannelList(AsyncValue<List<ChannelViewModel>> channels) {
    return Positioned(
      right: 0,
      top: 46,
      child: Visibility(
        visible: _showOverlay,
        child: OverlayChannelListWidget(
          channels: channels,
          onClose: _toggleOverlay,
          onChannelSelected: _handleChannelSelection,
        ),
      ),
    );
  }

  void _toggleOverlay() {
    setState(() {
      _showOverlay = !_showOverlay;
    });
  }

  void _handleChannelSelection(ChannelViewModel channel) {
    setState(() {
      _currentStreamId = channel.streamId!;
      _showOverlay = false;
    });
  }

  List<Widget> _buildTopButtonBar(
      BuildContext context, ChannelViewModel channel) {
    return [
      IconButton(
        icon: const Icon(Icons.arrow_back),
        color: Colors.white,
        onPressed: context.router.maybePop,
      ),
      Text(
        "${channel.title} - ${channel.currentEpgItem?.title ?? ''}",
        style: const TextStyle(color: Colors.white),
      ),
      const Spacer(),
      MaterialDesktopCustomButton(
        onPressed: _toggleOverlay,
        icon: const Icon(Icons.list_outlined),
      ),
    ];
  }
}
