import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'language_drop_down.dart';

class LanguageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LanguageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
      scrolledUnderElevation: 0,
      foregroundColor: Colors.black,
      automaticallyImplyLeading: false,
      elevation: 0,
      actions: [LanguageDropDown()],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
