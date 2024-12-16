import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/my_drawer.dart';
import '../components/my_product_tile.dart';
import '../models/product_model.dart';
import '../models/shop_model.dart';
import '../utils/dimens.dart';
import 'cart_page.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  static String id = '/shop_page';

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Dimens dimens = Dimens.of(context);
    final List<Product> products = context.watch<Shop>().shop;

    return Scaffold(
      appBar: AppBar(
        iconTheme: theme.iconTheme.copyWith(size: dimens.sizeIconMedium),
        title: const Text('Mua sắm'),
        actions: [
          SearchAnchor(
            isFullScreen: true,
            builder: (BuildContext context, SearchController controller) {
              return IconButton(
                icon: const Icon(Icons.search),
                onPressed: controller.openView,
              );
            },
            suggestionsBuilder: (context, SearchController controller) {
              return products
                  .where((product) => product.name.contains(controller.text))
                  .map(
                    (product) => ListTile(
                      title: Text(product.name),
                      onTap: () => controller.closeView(product.name),
                    ),
                  );
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, CartPage.id),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      body: Column(
        children: [
          Center(
            child: Text(
              "Chọn từ danh sách các sản phẩm cao cấp được chọn lọc",
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
          Expanded(
            child: CarouselView(
              itemSnapping: true,
              enableSplash: false,
              itemExtent: dimens.widthProduct,
              shrinkExtent: dimens.widthProduct,
              padding: dimens.edgeInsetsProductAll,
              children: List.generate(
                products.length,
                (index) => MyProductTile(product: products[index]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
