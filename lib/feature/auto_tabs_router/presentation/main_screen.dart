import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reactive_variables/reactive_variables.dart';
import '../../../core/domain/router/router.gr.dart';
import '../../../theme/svg_image_collection.dart';
import '../../../theme/theme_colors.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final selectIndex = 1.rv;


    return  AutoTabsRouter(
      routes: const [
        FavoriteAnimeRoute(),
        AnimeNewReleasesRoute(),
        AuthRoute(),
      ],
      transitionBuilder: (context,child,animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return selectIndex.observer((context, value) =>
            Scaffold(
              body: child,
              bottomNavigationBar: NavigationBar(
                elevation: 0,
                onDestinationSelected: (value) {
                  selectIndex.value = value;
                  return tabsRouter.setActiveIndex(value);
                },
                selectedIndex: selectIndex.value,
                destinations:  [
                  const NavigationDestination(
                      icon: Icon(Icons.favorite_border, color: LightThemeColors.mdThemeLightOnSurfaceVariant),
                      selectedIcon:Icon(Icons.favorite, color: LightThemeColors.mdThemeLightOnSurface),
                      label: "Фавориты",
                  ),
                  const NavigationDestination(
                      icon: Icon(Icons.tv, color: LightThemeColors.mdThemeLightOnSurfaceVariant),
                      selectedIcon:Icon(Icons.tv, color: LightThemeColors.mdThemeLightOnSurface),
                      label: "Просмотр"),
                  NavigationDestination(
                      icon: SvgPicture.asset(ImageCollectionSVG.chatIcon,
                          colorFilter: const ColorFilter.mode(
                            LightThemeColors.mdThemeLightOnSurfaceVariant,
                            BlendMode.srcIn,
                          )),
                      selectedIcon:SvgPicture.asset(ImageCollectionSVG.chatOutlineIcon,
                          colorFilter: const ColorFilter.mode(
                            LightThemeColors.mdThemeLightOnSurface,
                            BlendMode.srcIn,
                          )),
                      label: "Чат",
                  ),
                ],

              ),
            ));
      },
    );
  }

}
