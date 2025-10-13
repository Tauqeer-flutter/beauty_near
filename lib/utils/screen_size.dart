import 'dart:developer';

import 'package:flutter/material.dart';

import 'enums.dart';

final screenNotifier = ValueNotifier(ScreenSize.none);
Size getDesignSize() {
  // Get the actual screen size
  final window = WidgetsBinding.instance.window;
  final size = window.physicalSize / window.devicePixelRatio;
  // Return appropriate design size based on screen width
  if (size.width >= 1200) {
    screenNotifier.value = ScreenSize.large;
    log('LARGE: ${size.width}');
    return Size(1200, 1600);
    // Large tablets/Desktop
  } else if (size.width >= 800) {
    screenNotifier.value = ScreenSize.medium;
    log('MEDIUM: ${size.width}');
    return Size(768, 1024); // Tablets
  } else if (size.width >= 600) {
    screenNotifier.value = ScreenSize.small;
    log('SMALL: ${size.width}');
    return Size(600, 900); // Small tablets
  } else {
    log('DEFAULT: ${size.width}');
    return const Size(390, 878);
  }
}
