import 'package:flutter/material.dart';

import '../pages/about_page.dart';
import '../pages/cart_page.dart';
import '../pages/intro_page.dart';
import '../pages/settings_page.dart';
import '../utils/dimens.dart';
import 'my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final Dimens dimens = Dimens.of(context);

    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //drawer header  : logo
              DrawerHeader(
                child: Icon(
                  Icons.shopping_bag,
                  size: dimens.sizeIconLager,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              SizedBox(height: dimens.paddingScreenVertical),
              // shop tile
              MyListTile(
                text: "Cửa hàng",
                icon: Icons.home,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              MyListTile(
                text: "Giỏ hàng",
                icon: Icons.shopping_cart,
                onTap: () {
                  Navigator.pop(context);

                  Navigator.pushNamed(context, CartPage.id);
                },
              ),
              MyListTile(
                text: "Cài đặt",
                icon: Icons.settings,
                onTap: () {
                  Navigator.pop(context);

                  Navigator.pushNamed(context, SettingsPage.id);
                },
              ),
              MyListTile(
                text: "Giới thiệu",
                icon: Icons.info,
                onTap: () {
                  Navigator.pop(context);

                  Navigator.pushNamed(context, AboutPage.id);
                },
              ),
            ],
          ),
          Padding(
            padding: dimens.edgeInsetsScreenVertical,
            child: MyListTile(
              text: "Thoát",
              icon: Icons.logout,
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                context,
                IntroPage.id,
                (route) => false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
