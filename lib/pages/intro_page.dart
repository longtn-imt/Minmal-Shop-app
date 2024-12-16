import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../utils/dimens.dart';
import 'shop_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});
  static String id = '/intro_page';

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Dimens dimens = Dimens.of(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // logo
            children: [
              Icon(
                Icons.shopping_bag,
                size: dimens.sizeIconLager,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              dimens.gapVertical,

              // title
              Text(
                "Minmal Shop".toUpperCase(),
                style: theme.textTheme.headlineLarge?.copyWith(
                  color: theme.colorScheme.inversePrimary,
                ),
              ),
              dimens.gapVertical,

              //subtitle
              Text(
                "Sản phẩm chất lượng cao cấp",
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: theme.colorScheme.inversePrimary,
                ),
              ),
              dimens.gapVertical,

              // button
              MyButton(
                onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context,
                  ShopPage.id,
                  (route) => false,
                ),
                child: Icon(Icons.arrow_forward, size: dimens.sizeIconMedium),
              )
            ],
          ),
        ),
      ),
    );
  }
}
