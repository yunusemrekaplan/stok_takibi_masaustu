import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stok_takibi_masaustu/view/screen/inventory/Inventory_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/inventory',
      getPages: [
        GetPage(name: '/inventory', page: () => const InventoryScreen()),
        // GetPage(name: '/home', page: () => Home()),
        // GetPage(name: '/other', page: () => Other()),
        // GetPage(name: '/login', page: () => LoginScreen()),
        // GetPage(name: '/other', page: () => Other(), transition: Transition.fadeIn),
      ],
      // themeMode: ThemeMode.light,
      // theme: themeFirst,
      // darkTheme: themeSec,
    );
  }
}