import 'package:auto_route/auto_route.dart';

import 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: MainRoute.page,
          path: "/",
          children: [
            AutoRoute(page: FavoriteAnimeRoute.page),
            AutoRoute(
              page: AnimeReleasesRoute.page,
            ),
            AutoRoute(page: ChatRoute.page),
            AutoRoute(page: AnimeSearch.page)
          ],
        ),
        AutoRoute(page: PersonalChatRoute.page),
        AutoRoute(page: SendAnimeInviteRoute.page),
        AutoRoute(page: AnimeInfoRoute.page),
        AutoRoute(page: RegistrationRoute.page),
        AutoRoute(page: ProfileRoute.page),
        AutoRoute(page: InterlocutorProfileRoute.page),
        AutoRoute(page: EditingProfileRoute.page),
        AutoRoute(page: SinglePlayerRoute.page),
        AutoRoute(page: SharePlayerRoute.page),
        AutoRoute(page: AnimeSearch.page),
        AutoRoute(page: AnimeFavoritesSearch.page),
        AutoRoute(page: SearchProfileRoute.page),
      ];
}
