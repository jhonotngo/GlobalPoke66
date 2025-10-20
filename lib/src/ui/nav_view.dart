import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:global66/src/constants/color.dart';
import 'package:global66/src/ui/favorite/pokemon_favorite_view.dart';
import 'package:global66/src/ui/pokedex/pokemon_list_view.dart';
import 'package:global66/src/ui/regions/pokemon_regions_view.dart';
import 'package:global66/src/ui/profile/profile_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class NavView extends StatefulWidget {
  const NavView({super.key});

  @override
  State<NavView> createState() => _NavViewState();
}

class _NavViewState extends State<NavView> {
  final PersistentTabController _controller = PersistentTabController(
    initialIndex: 0,
  );

  List<Widget> _buildScreens() {
    return [PokemonList(), PokemonRegions(), PokemonFavorites(), Profile()];
  }

  List<PersistentBottomNavBarItem> _navBarItems(BuildContext context) {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.catching_pokemon),
        title: FlutterI18n.translate(context, "navigation.pokedex"),
        activeColorPrimary: kBlueIndicator,
        inactiveColorPrimary: Colors.grey.shade600,
        textStyle: TextStyle(fontSize: 12),
      ),

      PersistentBottomNavBarItem(
        icon: Icon(Icons.language),
        title: FlutterI18n.translate(context, "navigation.regions"),
        activeColorPrimary: kBlueIndicator,
        inactiveColorPrimary: Colors.grey.shade600,
        textStyle: TextStyle(fontSize: 12),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.favorite),
        title: FlutterI18n.translate(context, "navigation.favorites"),
        activeColorPrimary: kBlueIndicator,
        inactiveColorPrimary: Colors.grey.shade600,
        textStyle: TextStyle(fontSize: 12),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: FlutterI18n.translate(context, "navigation.profile"),
        activeColorPrimary: kBlueIndicator,
        inactiveColorPrimary: Colors.grey.shade600,
        textStyle: TextStyle(fontSize: 12),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _controller.index == 0,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop && _controller.index != 0) {
          _controller.jumpToTab(0);
        }
      },
      child: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarItems(context),
        confineToSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        navBarStyle: NavBarStyle.style6,
        navBarHeight: 70,

        decoration: NavBarDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          colorBehindNavBar: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(75),
              blurRadius: 20,
              offset: Offset(0, -5),
            ),
          ],
        ),
        padding: EdgeInsets.only(top: 20, bottom: 8),
      ),
    );
  }
}
