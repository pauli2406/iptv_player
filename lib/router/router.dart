import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iptv_player/home/home_view.dart';

import '../iptv_list/iptv_server_list.dart';
import '../video_player/video_player.dart';

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
            // GoRoute(
            //   path: 'series',
            //   builder: (context, state) {
            //     M3UItem item = state.extra as M3UItem;
            //     return SeriesSeasonPage(
            //       series: item.series!,
            //     );
            //   },
            // ),
            GoRoute(
              path: 'player',
              builder: (context, state) {
                return VideoPlayer(
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
