import 'package:flutter/material.dart';

class CircularImageWidget extends StatelessWidget {
  final String image;
  final num? height;
  final num? width;
  const CircularImageWidget({
    super.key,
    required this.image,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.asset(
        image,
        height: height?.toDouble(),
        width: width?.toDouble(),
      ),
    );
  }
}
