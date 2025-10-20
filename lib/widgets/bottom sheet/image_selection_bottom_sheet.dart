import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';


import '../../utils/color_constant.dart';

class ImageSelectionBottomSheet {
  static Future<String?> show({
    required BuildContext context,
    String? title,
  }) async {
    return await showModalBottomSheet<String>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return ImageSelectionBottomSheetContent(
          title: title ?? 'Select Image',
        );
      },
    );
  }
}

class ImageSelectionBottomSheetContent extends StatefulWidget {
  final String title;

  const ImageSelectionBottomSheetContent({
    super.key,
    required this.title,
  });

  @override
  State<ImageSelectionBottomSheetContent> createState() => _ImageSelectionBottomSheetContentState();
}

class _ImageSelectionBottomSheetContentState extends State<ImageSelectionBottomSheetContent> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: source,
        maxWidth: 1920,
        maxHeight: 1920,
        imageQuality: 85,
      );
      
      if (image != null) {
        Navigator.of(context).pop(image.path);
      }
    } catch (e) {
      // Handle error
      print('Error picking image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: AppColors.strokeColor,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
            SizedBox(height: 20.h),
            
            // Title
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimaryColor,
              ),
            ),
            SizedBox(height: 30.h),
            
            // Options
            Row(
              children: [
                // Camera option
                Expanded(
                  child: _buildOption(
                    icon: Icons.camera_alt,
                    title: 'Camera',
                    subtitle: 'Take a photo',
                    onTap: () => _pickImage(ImageSource.camera),
                  ),
                ),
                SizedBox(width: 16.w),
                
                // Gallery option
                Expanded(
                  child: _buildOption(
                    icon: Icons.photo_library,
                    title: 'Gallery',
                    subtitle: 'Choose from gallery',
                    onTap: () => _pickImage(ImageSource.gallery),
                  ),
                ),
              ],
            ),
            
            SizedBox(height: 30.h),
            
            // Cancel button
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    side: BorderSide(color: AppColors.strokeColor),
                  ),
                ),
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.darkGreyColor,
                  ),
                ),
              ),
            ),
            
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.strokeColor),
        ),
        child: Column(
          children: [
            Container(
              width: 60.w,
              height: 60.h,
              decoration: BoxDecoration(
                color: AppColors.kPrimaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: AppColors.kPrimaryColor,
                size: 28.sp,
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimaryColor,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.darkGreyColor,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
