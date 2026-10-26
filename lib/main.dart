import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'custom_text.dart';
import 'detail_menu_page.dart';
import 'add_menu_page.dart';

void main() {
  runApp(const KantinApp());
}

class KantinApp extends StatelessWidget {
  const KantinApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pencatat Menu Kantin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MenuListPage(),
    );
  }
}

class MenuListPage extends StatefulWidget {
  const MenuListPage({Key? key}) : super(key: key);

  @override
  State<MenuListPage> createState() => _MenuListPageState();
}

class _MenuListPageState extends State<MenuListPage> {
  // Data awal minimal 5 menu
  final List<Map<String, String>> _menuList = [
    {'name': 'Nasi Uduk Spesial', 'price': '10000'},
    {'name': 'Bubur Ayam Kampung', 'price': '12000'},
    {'name': 'Es Teh Manis Jumbo', 'price': '4000'},
    {'name': 'Indomie Goreng Double', 'price': '11000'},
    {'name': 'Gorengan Bakwan (3pcs)', 'price': '5000'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: 'Daftar Menu Kantin',
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: CustomText(
                text: 'Dapat Pilih Menu di Bawah Ini:',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _menuList.length,
              itemBuilder: (context, index) {
                final menu = _menuList[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  elevation: 2,
                  child: ListTile(
                    leading: const Icon(Icons.fastfood, color: Colors.blue),
                    title: CustomText(
                      text: menu['name']!,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    subtitle: CustomText(
                      text: 'Rp ${menu['price']}',
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () async {
                      // Navigasi ke halaman detail menggunakan Get.to()
                      await Get.to(() => DetailMenuPage(menu: menu));
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () async {
          // Navigasi ke halaman tambah menu dan menunggu hasil balikannya
          final result = await Get.to(() => const AddMenuPage());
          if (result != null && result is Map<String, String>) {
            setState(() {
              _menuList.add(result);
            });
          }
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}