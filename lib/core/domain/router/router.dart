import 'package:auto_route/auto_route.dart';

import '../../../feature/anime_board/presetation/anime_new_item_page/anime_new_releases_page.dart';
import '../../../feature/anime_board/presetation/favorite_anime_page/favorite_anime_page.dart';

import 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: MainRoute.page, path: "/", children: [
          AutoRoute(page: FavoriteAnimeRoute.page),
          AutoRoute(page: AnimeNewReleasesRoute.page,initial: true),
          AutoRoute(page: AuthRoute.page)
        ]),
      ];
}
