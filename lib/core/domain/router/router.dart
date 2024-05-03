import 'package:auto_route/auto_route.dart';
import 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: MainRoute.page, path: "/", children: [
          AutoRoute(page: FavoriteAnimeRoute.page),
          AutoRoute(page: AnimeReleasesRoute.page),
          AutoRoute(page: AuthRoute.page)
        ]),
        AutoRoute(page: AnimeInfoRoute.page)
      ];
}
