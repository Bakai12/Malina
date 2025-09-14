import 'package:flutter/material.dart';
import 'package:malina/custom_bottom_navigation_bar.dart';
import 'package:malina/navigation_screens.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  void _handleScanResult(BuildContext context, String result) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Отсканирован: $result'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: NavigationScreens.getScreens()[_currentIndex],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}