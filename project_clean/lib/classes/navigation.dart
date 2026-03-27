import 'package:flutter/material.dart';
import 'package:flutter_application_1/cart_user.dart';
import 'package:flutter_application_1/classes/colors.dart';
//import 'package:flutter_application_1/home/home.dart';
import 'package:flutter_application_1/location/locationuser.dart';
import 'package:flutter_application_1/profile_user.dart';
import 'package:flutter_application_1/reorder_user.dart';
import 'package:flutter_application_1/splash_screen.dart';
import 'package:flutter_application_1/utils/responsive_size_helper.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
class Navigation extends StatelessWidget {
  const Navigation({super.key});
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: const [
      SplashScreen(),
       Locationuser(),
       CartUser(),
       ReorderUser(),
       ProfileUser(),
       
      ],
      items: [
        PersistentBottomNavBarItem(
          icon: Icon(
            Icons.home_outlined,
            size: responsiveHeight(context, 30),
            color: AppColors.textcolor,
          ),
          title: "Home",
          activeColorPrimary: AppColors.textcolor,
          inactiveColorPrimary: const Color.fromARGB(106, 61, 24, 5),
        ),
        PersistentBottomNavBarItem(
          icon: Icon(
            Icons.location_on,
            size: responsiveHeight(context, 30),
            color: AppColors.textcolor,
          ),
          title: "Location",
          activeColorPrimary: AppColors.textcolor,
          inactiveColorPrimary: const Color.fromARGB(106, 61, 24, 5),
        ),
        PersistentBottomNavBarItem(
          icon: Icon(
            Icons.shopping_cart,
            size: responsiveHeight(context, 30),
            color: AppColors.textcolor,
          ),
          title: "Cart",
          activeColorPrimary: AppColors.textcolor,
          inactiveColorPrimary: const Color.fromARGB(106, 61, 24, 5),
        ),
        PersistentBottomNavBarItem(
          icon: Icon(
            Icons.refresh_outlined,
            size: responsiveHeight(context, 30),
            color: AppColors.textcolor,
          ),
          title: "Reorder",
          activeColorPrimary: AppColors.textcolor,
          inactiveColorPrimary: const Color.fromARGB(106, 61, 24, 5),
        ),
        PersistentBottomNavBarItem(
          icon: Icon(
            Icons.person_2_outlined,
            size: responsiveHeight(context, 30),
            color: AppColors.textcolor,
          ),
          title: "Profile",
          activeColorPrimary: AppColors.textcolor,
          inactiveColorPrimary: const Color.fromARGB(106, 61, 24, 5),
        ),
      ],
      backgroundColor: AppColors.btnColor,
      navBarStyle: NavBarStyle.style6,
    );
  }
}