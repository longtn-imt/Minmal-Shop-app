import 'package:flutter/material.dart';

import '../utils/dimens.dart';

class MyListTile extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function()? onTap;
  const MyListTile(
      {super.key, required this.text, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final Dimens dimens = Dimens.of(context);

    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: ListTile(
        title: Text(
          text.toUpperCase(),
        ),
        leading: Icon(
          icon,
          color: Colors.grey,
          size: dimens.sizeIconMedium,
        ),
        onTap: onTap,
      ),
    );
  }
}
