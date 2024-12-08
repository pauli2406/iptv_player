// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:fluent_ui/fluent_ui.dart' as _i7;
import 'package:play_shift/home/home_view.dart' as _i2;
import 'package:play_shift/home/views/channels/channel_overview.dart' as _i1;
import 'package:play_shift/home/views/movies/movie_overview.dart' as _i4;
import 'package:play_shift/home/views/series/series_overview.dart' as _i5;
import 'package:play_shift/iptv_list/iptv_server_list.dart' as _i3;

/// generated route for
/// [_i1.ChannelOverview]
class ChannelOverviewRoute extends _i6.PageRouteInfo<ChannelOverviewRouteArgs> {
  ChannelOverviewRoute({
    _i7.Key? key,
    required int streamId,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          ChannelOverviewRoute.name,
          args: ChannelOverviewRouteArgs(
            key: key,
            streamId: streamId,
          ),
          initialChildren: children,
        );

  static const String name = 'ChannelOverviewRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChannelOverviewRouteArgs>();
      return _i1.ChannelOverview(
        key: args.key,
        streamId: args.streamId,
      );
    },
  );
}

class ChannelOverviewRouteArgs {
  const ChannelOverviewRouteArgs({
    this.key,
    required this.streamId,
  });

  final _i7.Key? key;

  final int streamId;

  @override
  String toString() {
    return 'ChannelOverviewRouteArgs{key: $key, streamId: $streamId}';
  }
}

/// generated route for
/// [_i2.HomeView]
class HomeViewRoute extends _i6.PageRouteInfo<void> {
  const HomeViewRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeViewRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeView();
    },
  );
}

/// generated route for
/// [_i3.IptvServerList]
class IptvServerListRoute extends _i6.PageRouteInfo<void> {
  const IptvServerListRoute({List<_i6.PageRouteInfo>? children})
      : super(
          IptvServerListRoute.name,
          initialChildren: children,
        );

  static const String name = 'IptvServerListRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.IptvServerList();
    },
  );
}

/// generated route for
/// [_i4.MovieOverview]
class MovieOverviewRoute extends _i6.PageRouteInfo<MovieOverviewRouteArgs> {
  MovieOverviewRoute({
    _i7.Key? key,
    required int streamId,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          MovieOverviewRoute.name,
          args: MovieOverviewRouteArgs(
            key: key,
            streamId: streamId,
          ),
          initialChildren: children,
        );

  static const String name = 'MovieOverviewRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MovieOverviewRouteArgs>();
      return _i4.MovieOverview(
        key: args.key,
        streamId: args.streamId,
      );
    },
  );
}

class MovieOverviewRouteArgs {
  const MovieOverviewRouteArgs({
    this.key,
    required this.streamId,
  });

  final _i7.Key? key;

  final int streamId;

  @override
  String toString() {
    return 'MovieOverviewRouteArgs{key: $key, streamId: $streamId}';
  }
}

/// generated route for
/// [_i5.SeriesOverview]
class SeriesOverviewRoute extends _i6.PageRouteInfo<SeriesOverviewRouteArgs> {
  SeriesOverviewRoute({
    _i7.Key? key,
    required int seriesId,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          SeriesOverviewRoute.name,
          args: SeriesOverviewRouteArgs(
            key: key,
            seriesId: seriesId,
          ),
          initialChildren: children,
        );

  static const String name = 'SeriesOverviewRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SeriesOverviewRouteArgs>();
      return _i5.SeriesOverview(
        key: args.key,
        seriesId: args.seriesId,
      );
    },
  );
}

class SeriesOverviewRouteArgs {
  const SeriesOverviewRouteArgs({
    this.key,
    required this.seriesId,
  });

  final _i7.Key? key;

  final int seriesId;

  @override
  String toString() {
    return 'SeriesOverviewRouteArgs{key: $key, seriesId: $seriesId}';
  }
}
