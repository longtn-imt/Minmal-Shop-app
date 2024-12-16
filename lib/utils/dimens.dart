// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

sealed class Dimens {
  const Dimens();

  static final dimensDesktop = DimensDesktop();
  static final dimensMobile = DimensMobile();

  /// Get dimensions definition based on screen size
  factory Dimens.of(BuildContext context) =>
      switch (MediaQuery.sizeOf(context).shortestSide) {
        > 600 => dimensDesktop,
        _ => dimensMobile,
      };

  abstract final double paddingScreenHorizontal;

  abstract final double paddingScreenVertical;

  abstract final double sizeIconLager;

  abstract final double sizeIconMedium;

  abstract final double aspectRatioProductImage;

  abstract final double widthProduct;

  abstract final double paddingProduct;
}

/// Mobile dimensions
class DimensMobile extends Dimens {
  @override
  double paddingScreenVertical = 16.0;

  @override
  double paddingScreenHorizontal = 24.0;

  @override
  double get sizeIconLager => 64.0;

  @override
  double get sizeIconMedium => 24.0;

  @override
  double get aspectRatioProductImage => 1;

  @override
  double get widthProduct => 350;

  @override
  double get paddingProduct => 16.0;
}

/// Desktop/Web dimensions
class DimensDesktop extends Dimens {
  @override
  double paddingScreenVertical = 25.0;

  @override
  double paddingScreenHorizontal = 50.0;

  @override
  double get sizeIconLager => 80.0;

  @override
  double get sizeIconMedium => 40.0;

  @override
  double get aspectRatioProductImage => 1.4;

  @override
  double get widthProduct => 500;

  @override
  double get paddingProduct => 25.0;
}

extension DimensExtension on Dimens {
  EdgeInsets get edgeInsetsScreenHorizontal => EdgeInsets.symmetric(
        horizontal: paddingScreenHorizontal,
      );

  EdgeInsets get edgeInsetsScreenVertical => EdgeInsets.symmetric(
        vertical: paddingScreenVertical,
      );

  EdgeInsets get edgeInsetsScreenSymmetric => EdgeInsets.symmetric(
        horizontal: paddingScreenHorizontal,
        vertical: paddingScreenVertical,
      );

  EdgeInsets get edgeInsetsProductAll => EdgeInsets.all(paddingProduct);

  SizedBox get gapVertical => SizedBox(height: paddingScreenVertical);

  SizedBox get gapHorizontal => SizedBox(width: paddingScreenHorizontal);
}
