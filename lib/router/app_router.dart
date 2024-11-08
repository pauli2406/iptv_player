import 'package:auto_route/auto_route.dart';
import 'package:iptv_player/router/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType =>
      const RouteType.cupertino(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: IptvServerListRoute.page, initial: true),
        AutoRoute(page: HomeViewRoute.page, path: '/main'),
        AutoRoute(
          page: SeriesSeasonPageRoute.page,
          path: '/series',
        ),
        AutoRoute(page: SeriesVideoPlayerRoute.page, path: '/player/series'),
        AutoRoute(page: ChannelVideoPlayerRoute.page, path: '/player/channel'),
        AutoRoute(page: VodVideoPlayerRoute.page, path: '/player/vod'),
      ];
}
