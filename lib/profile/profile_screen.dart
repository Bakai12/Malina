import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 150,
            color: const Color(0xFFF72055),
            child: const Center(
              child: Text(
                'Профиль',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person, color: Color(0xFFF72055)),
            title: const Text('Мои данные'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.shopping_bag, color: Color(0xFFF72055)),
            title: const Text('Мои заказы'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.favorite, color: Color(0xFFF72055)),
            title: const Text('Избранное'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app, color: Colors.red),
            title: const Text('Выйти'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}