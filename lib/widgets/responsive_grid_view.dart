import 'package:beauty_near/utils/enums.dart';
import 'package:beauty_near/utils/screen_size.dart';
import 'package:flutter/material.dart';

class ResponsiveGridView extends StatelessWidget {
  final List<Widget> children;
  const ResponsiveGridView({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    final screenSize = screenNotifier.value;
    return GridView.count(
      crossAxisCount:
          screenSize == ScreenSize.large || screenSize == ScreenSize.medium
          ? 3
          : 2,
      children: children,
    );
  }
}
