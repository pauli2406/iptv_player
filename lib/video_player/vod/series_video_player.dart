import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iptv_player/provider/models/channel_view_model.dart';
import 'package:iptv_player/video_player/video_player_page.dart';

@RoutePage()
class SeriesVideoPlayer extends ConsumerWidget {
  const SeriesVideoPlayer(
      {super.key,
      required this.streamId,
      required this.streamUrl,
      required this.streamTitle,
      required this.streamCover});

  final int streamId;
  final String streamUrl;
  final String streamTitle;
  final String streamCover;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final episodeVM = ChannelViewModel(
      streamId,
      streamUrl,
      streamTitle,
      streamCover,
      false,
      null,
      [],
    );

    return VideoPlayerPage(
      key: ValueKey(streamId),
      stream: episodeVM,
      overlay: Container(),
      topButtonBar: _buildTopButtonBar(context, episodeVM),
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
