import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iptv_player/provider/isar/m3u_provider.dart';
import 'package:iptv_player/video_player/overlay_channel_list.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:platform_builder/platform.dart';

class VideoPlayer extends ConsumerStatefulWidget {
  const VideoPlayer({
    required this.streamId,
    super.key,
  });

  final int streamId;

  @override
  ConsumerState<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends ConsumerState<VideoPlayer> {
  late int _currentStreamId;
  final Player player = Player(
    configuration: const PlayerConfiguration(
      // Set the video output driver to OpenGL or Vulkan for better performance and quality
      vo: 'gpu-next',
      logLevel: MPVLogLevel.info,
      title: 'IPTV Player',
      bufferSize: 64 * 1024 * 1024,
    ),
  );
  late VideoController videoController;
  bool _showOverlay = false;

  @override
  void initState() {
    super.initState();
    _currentStreamId = widget.streamId;
    videoController = VideoController(player);

    _setupPlayer();
  }

  void _setupPlayer() {
    final link = ref.read(findChannelProvider(streamId: widget.streamId)).link;
    if (player.platform is NativePlayer) {
      (player.platform as dynamic)
        // Based on https://github.com/streamlink/streamlink-twitch-gui/wiki/Recommendations
        // and https://github.com/classicjazz/mpv-config/blob/master/mpv.conf
        // Selected API: select either Vulkan (preferred) or OpenGL
        ..setProperty('gpu-api', 'vulkan')
        ..setProperty('hwdec', 'auto')
        // Adjust cache settings to prevent buffering issues during livestream playback
        ..setProperty('cache', 'yes')
        ..setProperty('cache-default', '5000')
        // This defines how much data MPV will keep in its "back-buffer" for being able to rewind.
        ..setProperty('demuxer-max-back-bytes', '180M')
        // enable hardware acceleration for better performance
        ..setProperty('hwdec', 'auto');
    }
    player.open(
      Media(link),
    );
  }

  @override
  void dispose() {
    debugPrint('Disposing [Player] and [VideoController]...');
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final channels = ref.watch(findAllChannelsProvider());
    return Scaffold(
      body: SafeArea(
        child: (Platform.instance.isMacOS || Platform.instance.isWindows)
            ? _materialDesktopVideoControlsTheme(channels)
            : _materialVideoControlsTheme(channels),
      ),
    );
  }

  MaterialDesktopVideoControlsTheme _materialDesktopVideoControlsTheme(
      AsyncValue<List<ChannelViewModel>> channels) {
    return MaterialDesktopVideoControlsTheme(
      key: ValueKey(_currentStreamId),
      normal: _buildMaterialDesktopThemeData(),
      fullscreen: const MaterialDesktopVideoControlsThemeData(
        displaySeekBar: false,
        automaticallyImplySkipNextButton: false,
        automaticallyImplySkipPreviousButton: false,
      ),
      child: Stack(
        children: [
          Video(
            controller: videoController,
            controls: MaterialDesktopVideoControls,
          ),
          _buildOverlayChannelList(channels),
        ],
      ),
    );
  }

  MaterialVideoControlsTheme _materialVideoControlsTheme(
      AsyncValue<List<ChannelViewModel>> channels) {
    return MaterialVideoControlsTheme(
      key: ValueKey(_currentStreamId),
      normal: _buildMaterialThemeData(),
      fullscreen: const MaterialVideoControlsThemeData(
        displaySeekBar: false,
        automaticallyImplySkipNextButton: false,
        automaticallyImplySkipPreviousButton: false,
      ),
      child: Stack(
        children: [
          Video(
            controller: videoController,
            controls: MaterialVideoControls,
          ),
          _buildOverlayChannelList(channels),
        ],
      ),
    );
  }

  MaterialVideoControlsThemeData _buildMaterialThemeData() {
    return MaterialVideoControlsThemeData(
      buttonBarButtonSize: 24.0,
      buttonBarButtonColor: Colors.white,
      topButtonBarMargin: const EdgeInsets.only(top: 36.0),
      topButtonBar: _buildTopButtonBar(),
    );
  }

  MaterialDesktopVideoControlsThemeData _buildMaterialDesktopThemeData() {
    return MaterialDesktopVideoControlsThemeData(
      buttonBarButtonSize: 24.0,
      buttonBarButtonColor: Colors.white,
      topButtonBarMargin: const EdgeInsets.only(top: 36.0),
      topButtonBar: _buildTopButtonBar(),
    );
  }

  List<Widget> _buildTopButtonBar() {
    final channel = ref.watch(findChannelProvider(streamId: _currentStreamId));
    return [
      IconButton(
        icon: const Icon(Icons.arrow_back),
        color: Colors.white,
        onPressed: context.pop,
      ),
      Text(
        "${channel.title} - ${utf8.decode(base64.decode(channel.currentEpgItem?.title ?? ''))}",
        style: const TextStyle(color: Colors.white),
      ),
      const Spacer(),
      MaterialDesktopCustomButton(
        onPressed: _toggleOverlay,
        icon: const Icon(Icons.list_outlined),
      ),
    ];
  }

  void _toggleOverlay() {
    setState(() {
      _showOverlay = !_showOverlay;
    });
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

  void _handleChannelSelection(ChannelViewModel channel) {
    setState(() {
      _currentStreamId = channel.streamId!;
      _showOverlay = false;
      player.open(Media(channel.link));
    });
  }
}
