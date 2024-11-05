import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iptv_player/provider/isar/m3u_provider.dart';
import 'package:iptv_player/video_player/video_player.dart';

@RoutePage()
class VodVideoPlayer extends ConsumerStatefulWidget {
  const VodVideoPlayer({super.key, required this.streamId});
  final int streamId;

  @override
  ConsumerState<VodVideoPlayer> createState() => _ChannelVideoPlayerState();
}

class _ChannelVideoPlayerState extends ConsumerState<VodVideoPlayer> {
  late int _currentStreamId;

  @override
  void initState() {
    super.initState();
    _currentStreamId = widget.streamId;
  }

  @override
  Widget build(BuildContext context) {
    final movie = ref.watch(findMovieProvider(streamId: _currentStreamId));
    return VideoPlayer(
      key: ValueKey(_currentStreamId),
      stream: movie,
      overlay: Container(),
      topButtonBar: _buildTopButtonBar(context, movie),
    );
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
        channel.title,
        style: const TextStyle(color: Colors.white),
      ),
      const Spacer(),
    ];
  }
}
