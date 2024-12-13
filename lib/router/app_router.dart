import 'package:auto_route/auto_route.dart';
import 'package:play_shift/router/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: IptvServerListRoute.page, initial: true),
        AutoRoute(page: HomeViewRoute.page, path: '/main'),
        // AutoRoute(
        //   page: SeriesSeasonPageRoute.page,
        //   path: '/series',
        // ),
        AutoRoute(page: ChannelOverviewRoute.page, path: '/channel'),
        AutoRoute(page: SeriesOverviewRoute.page, path: '/series'),
        AutoRoute(page: MovieOverviewRoute.page, path: '/movie'),
      ];
}
