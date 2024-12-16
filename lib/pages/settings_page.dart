import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../themes/theme_provider.dart';
import '../utils/dimens.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  static String id = "/SettingsPage";
  // static bool darkmode = false;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Dimens dimens = Dimens.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cài đặt"),
        iconTheme: theme.iconTheme.copyWith(size: dimens.sizeIconMedium),
      ),
      body: Container(
        margin: dimens.edgeInsetsScreenSymmetric,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
              return SwitchListTile(
                activeColor: Colors.green,
                title: Text("Chế độ tối",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.inversePrimary)),
                value: themeProvider.themeMode == ThemeMode.dark,
                onChanged: (value) {
                  themeProvider.toggleTheme();
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
