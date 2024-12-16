import 'package:flutter/material.dart';

import '../utils/dimens.dart';

class AboutPage extends StatelessWidget {
  static String id = "AboutPage";
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Dimens dimens = Dimens.of(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: theme.iconTheme.copyWith(size: dimens.sizeIconMedium),
      ),
      body: Padding(
        padding: dimens.edgeInsetsScreenSymmetric,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Giới thiệu",
              style: theme.textTheme.headlineLarge,
            ),
            SizedBox(height: dimens.paddingScreenVertical),
            Text(
              'Đây là một ứng dụng thương mại điện tử đơn giản cung cấp '
              'cho bạn một mẫu giao diện người dùng có sẵn có thể chạy trên mọi '
              'nền tảng như (Di động, Windows, Web). Được Kareem Saad mã hóa bằng '
              'cách sử dụng nền tảng Flutter trong khi xem xét các khái niệm và '
              'tính năng quan trọng như:\n'
              'Giao diện người dùng phản hồi và thích ứng,\n'
              'Cấu trúc mã có thể tái sử dụng và có tổ chức,\n'
              'Chủ đề tối và sáng.',
              style: theme.textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
