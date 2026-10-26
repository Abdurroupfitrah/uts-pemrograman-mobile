import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'custom_text.dart';

class DetailMenuPage extends StatelessWidget {
  final Map<String, String> menu;

  const DetailMenuPage({Key? key, required this.menu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: 'Detail Menu Kantin',
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue, // Diubah ke blue
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
              text: 'Nama Menu:',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
            const SizedBox(height: 8),
            CustomText(
              text: menu['name'] ?? '',
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.blue, // Diubah ke blue agar senada
            ),
            const SizedBox(height: 24),
            const CustomText(
              text: 'Harga:',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
            const SizedBox(height: 8),
            CustomText(
              text: 'Rp ${menu['price']}',
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ],
        ),
      ),
    );
  }
}