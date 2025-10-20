import 'package:flutter/material.dart';

import 'language_drop_down.dart';

class LanguageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LanguageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      elevation: 0,
      actions: [LanguageDropDown()],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
