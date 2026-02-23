import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/main.dart';
import 'package:flutter_onboarding/models/plants.dart';
import 'package:flutter_onboarding/ui/scan_page.dart';
import 'package:flutter_onboarding/ui/screens/cart_page.dart';
import 'package:flutter_onboarding/ui/screens/favorite_page.dart';
import 'package:flutter_onboarding/ui/screens/home_page.dart';
import 'package:flutter_onboarding/ui/screens/profile_page.dart';
import 'package:page_transition/page_transition.dart';

class RootPage extends StatefulWidget {
  final String? userEmail;
  const RootPage({Key? key, this.userEmail}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  List<Plant> favorites = [];
  List<Plant> myCart = [];
  int _bottomNavIndex = 0;

  static const List<IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person,
  ];

  List<String> get titleList => [
    getLocalizedText('home'),
    getLocalizedText('favorite'),
    getLocalizedText('cart'),
    getLocalizedText('profile'),
  ];

  List<Widget> _widgetOptions() => [
    const HomePage(),
    FavoritePage(favoritedPlants: favorites),
    CartPage(addedToCartPlants: myCart),
    ProfilePage(userEmail: widget.userEmail),
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Locale>(
      valueListenable: localeNotifier,
      builder: (context, locale, child) {
        return Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: Text(
                    titleList[_bottomNavIndex],
                    key: ValueKey<int>(_bottomNavIndex),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    themeNotifier.value = themeNotifier.value == ThemeMode.light
                        ? ThemeMode.dark
                        : ThemeMode.light;
                  },
                  icon: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) {
                      return RotationTransition(
                        turns: animation,
                        child: FadeTransition(opacity: animation, child: child),
                      );
                    },
                    child: Icon(
                      themeNotifier.value == ThemeMode.light
                          ? Icons.dark_mode
                          : Icons.light_mode,
                      key: ValueKey<ThemeMode>(themeNotifier.value),
                      color: Theme.of(context).colorScheme.onSurface,
                      size: 28.0,
                    ),
                  ),
                )
              ],
            ),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0.0,
          ),
          body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(
                opacity: animation,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0.05, 0),
                    end: Offset.zero,
                  ).animate(CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeOutCubic,
                  )),
                  child: child,
                ),
              );
            },
            child: KeyedSubtree(
              key: ValueKey<int>(_bottomNavIndex),
              child: _widgetOptions()[_bottomNavIndex],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, PageTransition(child: const ScanPage(), type: PageTransitionType.bottomToTop));
            },
            child: Image.asset('assets/images/code-scan-two.png', height: 30.0),
            backgroundColor: Constants.primaryColor,
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: AnimatedBottomNavigationBar(
            splashColor: Constants.primaryColor,
            activeColor: Constants.primaryColor,
            inactiveColor: Colors.black.withOpacity(.5),
            icons: iconList,
            activeIndex: _bottomNavIndex,
            gapLocation: GapLocation.center,
            notchSmoothness: NotchSmoothness.softEdge,
            onTap: (index) => setState(() {
              _bottomNavIndex = index;
              favorites = Plant.getFavoritedPlants();
              myCart = Plant.addedToCartPlants().toSet().toList();
            }),
          ),
        );
      },
    );
  }
}
