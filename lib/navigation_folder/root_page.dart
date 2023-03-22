
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sport_connect/helpers/designs.dart';
import 'package:sport_connect/navigation_folder/home_page.dart';
import 'package:sport_connect/navigation_folder/settings.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  late PersistentTabController _controller;

  @override
  void initState(){
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      const ProfilePage(),
      const Center(
        child: Text('Buddies',
          style: TextStyle(
              fontSize: 15
          ),),
      ),
      const Center(
        child: Text('Discover',
          style: TextStyle(
              fontSize: 15
          ),),
      ),
      const Settings()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.person_alt),
        title: ("Home"),
        activeColorPrimary: Designs.blueColor.withOpacity(0.8),
        inactiveColorPrimary: Designs.buttonColor.withOpacity(0.8),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.group_solid),
        title: ("Buddies"),
        activeColorPrimary: Designs.blueColor.withOpacity(0.8),
        inactiveColorPrimary: Designs.buttonColor.withOpacity(0.8),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Entypo.location),
        title: ("Discover"),
        activeColorPrimary: Designs.blueColor.withOpacity(0.8),
        inactiveColorPrimary: Designs.buttonColor.withOpacity(0.8),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.settings_solid),
        title: ("Settings"),
        activeColorPrimary: Designs.blueColor.withOpacity(0.8),
        inactiveColorPrimary: Designs.buttonColor.withOpacity(0.8),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Designs.scaffoldTheme.withOpacity(0.8), // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(5.0),
        colorBehindNavBar: Designs.scaffoldTheme.withOpacity(0.8),
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style9, // Choose the nav bar style with this property.
    );
  }
}

