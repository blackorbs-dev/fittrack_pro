import 'package:flutter/cupertino.dart';

extension GridAspectRatioExtension on BuildContext {
  /// Computes childAspectRatio (width / height) for a fixed item height in a Grid layout.
  double gridChildAspectRatio({
    int crossAxisCount = 2,
    double crossAxisSpacing = 12,
    required double itemHeight,
  }) {
    final screenWidth = MediaQuery.of(this).size.width;
    final totalSpacing = (crossAxisCount - 1) * crossAxisSpacing;
    final itemWidth = (screenWidth - totalSpacing) / crossAxisCount;
    return itemWidth / itemHeight;
  }
}
