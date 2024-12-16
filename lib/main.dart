import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/shop_model.dart';
import 'pages/about_page.dart';
import 'pages/cart_page.dart';
import 'pages/intro_page.dart';
import 'pages/settings_page.dart';
import 'pages/shop_page.dart';
import 'themes/theme_mode.dart';
import 'themes/theme_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => Shop(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const IntroPage(),
      themeMode: Provider.of<ThemeProvider>(context).themeMode,
      theme: lightmode,
      darkTheme: darkmode,
      routes: {
        IntroPage.id: (context) => const IntroPage(),
        ShopPage.id: (context) => const ShopPage(),
        CartPage.id: (context) => const CartPage(),
        SettingsPage.id: (context) => const SettingsPage(),
        AboutPage.id: (context) => const AboutPage(),
      },
    );
  }
}
