import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:provider/provider.dart';

import '../components/my_button.dart';
import '../models/product_model.dart';
import '../models/shop_model.dart';
import '../utils/dimens.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  static String id = "/cart_page";
  void removeItemFromCart(
      {required BuildContext context, required Product product}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Xóa sản phẩm này khỏi giỏ hàng?"),
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Hủy bỏ"),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);

              context.read<Shop>().removeFromCart(item: product);
            },
            child: const Text("Đúng"),
          )
        ],
      ),
    );
  }

  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text(
            "Người dùng muốn thanh toán! Kết nối ứng dụng này với phần thanh toán của bạn"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dimens = Dimens.of(context);
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Giỏ hàng"),
        iconTheme: theme.iconTheme.copyWith(size: dimens.sizeIconMedium),
      ),
      body: Column(
        children: [
          Expanded(
              child: cart.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.cartArrowDown,
                          size: dimens.sizeIconLager,
                        ),
                        SizedBox(height: dimens.paddingScreenVertical),
                        Center(
                          child: Text(
                            "Giỏ hàng của bạn đang trống",
                            style: theme.textTheme.headlineMedium,
                          ),
                        ),
                      ],
                    )
                  : ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        final item = cart[index];

                        return ListTile(
                          title: Text(
                            item.name,
                          ),
                          subtitle: Text(item.price.toStringAsFixed(2)),
                          trailing: IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              removeItemFromCart(
                                  context: context, product: item);
                            },
                          ),
                        );
                      },
                    )),
          Padding(
            padding: dimens.edgeInsetsScreenSymmetric,
            child: MyButton(
              onTap: () => payButtonPressed(context),
              child: const Text("THANH TOÁN NGAY"),
            ),
          )
        ],
      ),
    );
  }
}
