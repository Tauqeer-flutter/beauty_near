import 'package:beauty_near/widgets/bottom%20sheet/image_selection_bottom_sheet.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
   String? _profileImagePath;
  String? get getProfileImagePath => _profileImagePath;
    Future<void> setProfileImagePath({required BuildContext context}) async {
    final String? imagePath = await ImageSelectionBottomSheet.show(
      context: context,
      title: 'Select Profile Image',
    );

    if (imagePath != null) {
      _profileImagePath = imagePath;
    }
    notifyListeners();

  }
}
