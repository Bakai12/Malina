import 'package:flutter/material.dart';
import 'package:malina/basket/basket_screen.dart';
import 'package:malina/favorite_page/favorites_screen.dart';
import 'package:malina/main_page/home_screen.dart';
import 'package:malina/profile/profile_screen.dart';
import 'package:malina/qr/qr_scanner_screen.dart';



class NavigationScreens {
  static List<Widget> getScreens() {
    return [
      const HomeScreen(),
      const FavoritesScreen(),
      const QrScannerScreen(),
      const ProfileScreen(),
      const BasketScreen(),
    ];
  }
}