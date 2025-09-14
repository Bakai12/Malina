import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/lenta.svg',
            colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
          ),
          activeIcon: SvgPicture.asset(
            'assets/icons/lenta.svg',
            colorFilter: const ColorFilter.mode(Colors.red, BlendMode.srcIn),
          ),
          label: 'Лента',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/favorite.svg',
            colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
          ),
          activeIcon: SvgPicture.asset(
            'assets/icons/favorite.svg',
            colorFilter: const ColorFilter.mode(Colors.red, BlendMode.srcIn),
          ),
          label: 'Избранное',
        ),
        BottomNavigationBarItem(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
            child: SvgPicture.asset(
              'assets/icons/scan1.svg',
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
              width: 24,
              height: 24,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/profile.svg',
            colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
          ),
          activeIcon: SvgPicture.asset(
            'assets/icons/profile.svg',
            colorFilter: const ColorFilter.mode(Colors.red, BlendMode.srcIn),
          ),
          label: 'Профиль',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/basket.svg',
            colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
          ),
          activeIcon: SvgPicture.asset(
            'assets/icons/basket.svg',
            colorFilter: const ColorFilter.mode(Colors.red, BlendMode.srcIn),
          ),
          label: 'Корзина',
        ),
      ],
    );
  }
}