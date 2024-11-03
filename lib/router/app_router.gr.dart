// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/cupertino.dart' as _i9;
import 'package:flutter/material.dart' as _i8;
import 'package:iptv_player/home/home_view.dart' as _i2;
import 'package:iptv_player/home/views/series/series_season_page.dart' as _i4;
import 'package:iptv_player/iptv_list/iptv_server_list.dart' as _i3;
import 'package:iptv_player/video_player/channel/channel_video_player.dart'
    as _i1;
import 'package:iptv_player/video_player/vod/series_video_player.dart' as _i5;
import 'package:iptv_player/video_player/vod/vod_video_player.dart' as _i6;

/// generated route for
/// [_i1.ChannelVideoPlayer]
class ChannelVideoPlayerRoute
    extends _i7.PageRouteInfo<ChannelVideoPlayerRouteArgs> {
  ChannelVideoPlayerRoute({
    _i8.Key? key,
    required int streamId,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          ChannelVideoPlayerRoute.name,
          args: ChannelVideoPlayerRouteArgs(
            key: key,
            streamId: streamId,
          ),
          initialChildren: children,
        );

  static const String name = 'ChannelVideoPlayerRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChannelVideoPlayerRouteArgs>();
      return _i1.ChannelVideoPlayer(
        key: args.key,
        streamId: args.streamId,
      );
    },
  );
}

class ChannelVideoPlayerRouteArgs {
  const ChannelVideoPlayerRouteArgs({
    this.key,
    required this.streamId,
  });

  final _i8.Key? key;

  final int streamId;

  @override
  String toString() {
    return 'ChannelVideoPlayerRouteArgs{key: $key, streamId: $streamId}';
  }
}

/// generated route for
/// [_i2.HomeView]
class HomeViewRoute extends _i7.PageRouteInfo<void> {
  const HomeViewRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HomeViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeViewRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeView();
    },
  );
}

/// generated route for
/// [_i3.IptvServerList]
class IptvServerListRoute extends _i7.PageRouteInfo<void> {
  const IptvServerListRoute({List<_i7.PageRouteInfo>? children})
      : super(
          IptvServerListRoute.name,
          initialChildren: children,
        );

  static const String name = 'IptvServerListRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i3.IptvServerList();
    },
  );
}

/// generated route for
/// [_i4.SeriesSeasonPage]
class SeriesSeasonPageRoute
    extends _i7.PageRouteInfo<SeriesSeasonPageRouteArgs> {
  SeriesSeasonPageRoute({
    required int seriesId,
    _i9.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          SeriesSeasonPageRoute.name,
          args: SeriesSeasonPageRouteArgs(
            seriesId: seriesId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SeriesSeasonPageRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SeriesSeasonPageRouteArgs>();
      return _i4.SeriesSeasonPage(
        seriesId: args.seriesId,
        key: args.key,
      );
    },
  );
}

class SeriesSeasonPageRouteArgs {
  const SeriesSeasonPageRouteArgs({
    required this.seriesId,
    this.key,
  });

  final int seriesId;

  final _i9.Key? key;

  @override
  String toString() {
    return 'SeriesSeasonPageRouteArgs{seriesId: $seriesId, key: $key}';
  }
}

/// generated route for
/// [_i5.SeriesVideoPlayer]
class SeriesVideoPlayerRoute
    extends _i7.PageRouteInfo<SeriesVideoPlayerRouteArgs> {
  SeriesVideoPlayerRoute({
    _i8.Key? key,
    required int streamId,
    required String streamUrl,
    required String streamTitle,
    required String streamCover,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          SeriesVideoPlayerRoute.name,
          args: SeriesVideoPlayerRouteArgs(
            key: key,
            streamId: streamId,
            streamUrl: streamUrl,
            streamTitle: streamTitle,
            streamCover: streamCover,
          ),
          initialChildren: children,
        );

  static const String name = 'SeriesVideoPlayerRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SeriesVideoPlayerRouteArgs>();
      return _i5.SeriesVideoPlayer(
        key: args.key,
        streamId: args.streamId,
        streamUrl: args.streamUrl,
        streamTitle: args.streamTitle,
        streamCover: args.streamCover,
      );
    },
  );
}

class SeriesVideoPlayerRouteArgs {
  const SeriesVideoPlayerRouteArgs({
    this.key,
    required this.streamId,
    required this.streamUrl,
    required this.streamTitle,
    required this.streamCover,
  });

  final _i8.Key? key;

  final int streamId;

  final String streamUrl;

  final String streamTitle;

  final String streamCover;

  @override
  String toString() {
    return 'SeriesVideoPlayerRouteArgs{key: $key, streamId: $streamId, streamUrl: $streamUrl, streamTitle: $streamTitle, streamCover: $streamCover}';
  }
}

/// generated route for
/// [_i6.VodVideoPlayer]
class VodVideoPlayerRoute extends _i7.PageRouteInfo<VodVideoPlayerRouteArgs> {
  VodVideoPlayerRoute({
    _i8.Key? key,
    required int streamId,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          VodVideoPlayerRoute.name,
          args: VodVideoPlayerRouteArgs(
            key: key,
            streamId: streamId,
          ),
          initialChildren: children,
        );

  static const String name = 'VodVideoPlayerRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VodVideoPlayerRouteArgs>();
      return _i6.VodVideoPlayer(
        key: args.key,
        streamId: args.streamId,
      );
    },
  );
}

class VodVideoPlayerRouteArgs {
  const VodVideoPlayerRouteArgs({
    this.key,
    required this.streamId,
  });

  final _i8.Key? key;

  final int streamId;

  @override
  String toString() {
    return 'VodVideoPlayerRouteArgs{key: $key, streamId: $streamId}';
  }
}
