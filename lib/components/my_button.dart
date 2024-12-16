import 'package:flutter/material.dart';

import '../utils/dimens.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.onTap, required this.child});

  final GestureTapCallback? onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final Dimens dimens = Dimens.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 1.5),
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: dimens.edgeInsetsScreenSymmetric,
        child: child,
      ),
    );
  }
}
