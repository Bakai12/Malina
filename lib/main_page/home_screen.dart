import 'package:flutter/material.dart';
import 'category_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Искать в Malina',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                contentPadding: EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // QR код секция
          Container(
            width: double.infinity,
            height: 100,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFF72055),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(Icons.qr_code_scanner, size: 48, color: Colors.white),
                const SizedBox(width: 16),
                const Text(
                  'Сканируй QR-код\nи заказывай',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Категории
          CategoryCard(
            imagePath: 'assets/images/eda.png',
            title: 'Еда',
            subtitle: 'Рестораны и кафе',
          ),

          const SizedBox(height: 20),

          CategoryCard(
            imagePath: 'assets/images/beauty.png',
            title: 'Бьюти',
            subtitle: 'Салоны красоты',
            backgroundColor: const Color(0xFFFFDEDD),
          ),

          const SizedBox(height: 30),
          const Text('Скоро в Malina', style: TextStyle(fontSize: 18)),
          const SizedBox(height: 10),
          
          // Горизонтальный список
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildCategoryItem('Вакансии', Colors.blue[100]!),
                const SizedBox(width: 12),
                _buildCategoryItem('Маркет', Colors.yellow[100]!),
                const SizedBox(width: 12),
                _buildCategoryItem('Цветы', Colors.green[100]!),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String title, Color color) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(12),
      child: Center(child: Text(title)),
    );
  }
}