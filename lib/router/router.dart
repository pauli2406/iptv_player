import 'package:go_router/go_router.dart';
import 'package:iptv_player/home/home_view.dart';
import 'package:iptv_player/home/views/series/series_season_page.dart';
import 'package:iptv_player/video_player/channel/channel_video_player.dart';
import 'package:iptv_player/video_player/vod/series_video_player.dart';
import 'package:iptv_player/video_player/vod/vod_video_player.dart';

import '../iptv_list/iptv_server_list.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const IptvServerList(),
      routes: [
        GoRoute(
          path: 'main',
          builder: (context, state) => const HomeView(),
          routes: [
            GoRoute(
                path: 'series',
                builder: (context, state) {
                  int seriesId = state.extra as int;
                  return SeriesSeasonPage(
                    seriesId: seriesId,
                  );
                },
                routes: [
                  GoRoute(
                    path: 'player',
                    builder: (context, state) {
                      return SeriesVideoPlayer(
                        streamId: ((state.extra as Map)['streamId'] as int),
                        streamUrl:
                            ((state.extra as Map)['streamUrl'] as String),
                        streamTitle:
                            ((state.extra as Map)['streamTitle'] as String),
                        streamCover:
                            ((state.extra as Map)['streamCover'] as String),
                      );
                    },
                  ),
                ]),
            GoRoute(
              path: 'channel/player',
              builder: (context, state) {
                return ChannelVideoPlayer(
                  streamId: ((state.extra as Map)['streamId'] as int),
                );
              },
            ),
            GoRoute(
              path: 'movie/player',
              builder: (context, state) {
                return VodVideoPlayer(
                  streamId: ((state.extra as Map)['streamId'] as int),
                );
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
