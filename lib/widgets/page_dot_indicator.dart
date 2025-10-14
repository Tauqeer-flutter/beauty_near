import 'package:flutter/material.dart';

import '../utils/color_constant.dart';

class PageDotIndicator extends StatelessWidget {
  final int length;
  final int current;
  final ValueSetter<int> onDotTap;
  const PageDotIndicator({
    super.key,
    required this.length,
    required this.current,
    required this.onDotTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(length, (index) {
        return GestureDetector(
          onTap: () => onDotTap(index),
          child: Container(
            width: 7.0,
            height: 7.0,
            margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 4.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : AppColors.kPrimaryColor)
                      .withValues(alpha: current == index ? 0.9 : 0.4),
            ),
          ),
        );
      }),
    );
  }
}
