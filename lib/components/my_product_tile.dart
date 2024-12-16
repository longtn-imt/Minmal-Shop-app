import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';
import '../models/shop_model.dart';
import '../utils/dimens.dart';

class MyProductTile extends StatelessWidget {
  const MyProductTile({super.key, required this.product});
  final Product product;

  void addToCart(BuildContext context) {
    final theme = Theme.of(context);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Thêm sản phẩm này vào giỏ hàng?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Hủy bỏ", style: theme.textTheme.titleMedium),
          ),
          FilledButton(
            onPressed: () {
              context.read<Shop>().addToCart(item: product);
              Navigator.pop(context);
            },
            child: Text("Đúng", style: theme.textTheme.titleMedium),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dimens = Dimens.of(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Theme.of(context).colorScheme.primary,
      ),
      padding: dimens.edgeInsetsProductAll,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AspectRatio(
            aspectRatio: dimens.aspectRatioProductImage,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.white,
              ),
              padding: dimens.edgeInsetsScreenSymmetric,
              width: double.infinity,
              child: Image.asset(
                fit: BoxFit.fitWidth,
                product.imagePath,
              ),
            ),
          ),
          dimens.gapVertical,
          Text(
            product.name,
            style: theme.textTheme.titleMedium,
          ),
          Expanded(
            child: Text(
              product.description,
              style: theme.textTheme.bodyMedium?.copyWith(
                overflow: switch (dimens) {
                  DimensMobile() => TextOverflow.ellipsis,
                  DimensDesktop() => null,
                },
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${product.price}đ'),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white, width: 2.0),
                ),
                child: IconButton(
                  color: theme.colorScheme.inversePrimary,
                  icon: const Icon(Icons.add),
                  onPressed: () => addToCart(context),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
