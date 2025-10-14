import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../utils/color_constant.dart';
import '../widgets/custom_app_bar.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Support"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0.w),

        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30.h),
              TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(fontSize: 16.sp, color: Colors.grey),
                  prefixIcon: Icon(Iconsax.search_normal, color: Colors.grey),

                  suffixIcon: Icon(Iconsax.sort, color: Colors.grey),
                ),
              ),
              SizedBox(height: 35.h),
              customExpansionCard(
                context: context,
                title: "Bitcoin Back",
                description:
                    "Lorem ipsum dolor sit amet consectetur. Purus sit pellentesque ac arcu aenean vel tortor. Dui scelerisque in massa velit urna erat. Massa aliquam metus neque nec purus ipsum nec neque a. Rhoncus sagittis nascetur a convallis in scelerisque vitae ullamcorper. Ipsum auctor in.",
              ),
              SizedBox(height: 15.h),
              customExpansionCard(
                context: context,
                title: "Bitcoin Back",
                description:
                    "Lorem ipsum dolor sit amet consectetur. Purus sit pellentesque ac arcu aenean vel tortor. Dui scelerisque in massa velit urna erat. Massa aliquam metus neque nec purus ipsum nec neque a. Rhoncus sagittis nascetur a convallis in scelerisque vitae ullamcorper. Ipsum auctor in.",
              ),
              SizedBox(height: 15.h),
              customExpansionCard(
                context: context,
                title: "Bitcoin Back",
                description:
                    "Lorem ipsum dolor sit amet consectetur. Purus sit pellentesque ac arcu aenean vel tortor. Dui scelerisque in massa velit urna erat. Massa aliquam metus neque nec purus ipsum nec neque a. Rhoncus sagittis nascetur a convallis in scelerisque vitae ullamcorper. Ipsum auctor in.",
              ),
              SizedBox(height: 15.h),
              customExpansionCard(
                context: context,
                title: "Bitcoin Back",
                description:
                    "Lorem ipsum dolor sit amet consectetur. Purus sit pellentesque ac arcu aenean vel tortor. Dui scelerisque in massa velit urna erat. Massa aliquam metus neque nec purus ipsum nec neque a. Rhoncus sagittis nascetur a convallis in scelerisque vitae ullamcorper. Ipsum auctor in.",
              ),
              SizedBox(height: 15.h),
              customExpansionCard(
                context: context,
                title: "Bitcoin Back",
                description:
                    "Lorem ipsum dolor sit amet consectetur. Purus sit pellentesque ac arcu aenean vel tortor. Dui scelerisque in massa velit urna erat. Massa aliquam metus neque nec purus ipsum nec neque a. Rhoncus sagittis nascetur a convallis in scelerisque vitae ullamcorper. Ipsum auctor in.",
              ),
              SizedBox(height: 15.h),
              customExpansionCard(
                context: context,
                title: "Bitcoin Back",
                description:
                    "Lorem ipsum dolor sit amet consectetur. Purus sit pellentesque ac arcu aenean vel tortor. Dui scelerisque in massa velit urna erat. Massa aliquam metus neque nec purus ipsum nec neque a. Rhoncus sagittis nascetur a convallis in scelerisque vitae ullamcorper. Ipsum auctor in.",
              ),
              SizedBox(height: 15.h),
              customExpansionCard(
                context: context,
                title: "Bitcoin Back",
                description:
                    "Lorem ipsum dolor sit amet consectetur. Purus sit pellentesque ac arcu aenean vel tortor. Dui scelerisque in massa velit urna erat. Massa aliquam metus neque nec purus ipsum nec neque a. Rhoncus sagittis nascetur a convallis in scelerisque vitae ullamcorper. Ipsum auctor in.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget customExpansionCard({
  required BuildContext context,
  required String title,
  required String description,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12.r),
      boxShadow: [
        BoxShadow(
          color: const Color(0x14000000), // #000000 with 8% opacity
          offset: const Offset(0, 0),
          blurRadius: 30,
          spreadRadius: 0,
        ),
      ],
    ),
    child: Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      child: Material(
        color: Colors.transparent,
        child: ExpansionTile(
          title: Text(
            title,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
          ),
          iconColor: AppColors.kPrimaryColor,
          collapsedIconColor: AppColors.kPrimaryColor,
          maintainState: true,
          shape: Border.all(color: Colors.transparent),
          tilePadding: EdgeInsets.symmetric(horizontal: 12.w),
          childrenPadding: EdgeInsets.zero,
          children: [
            Padding(padding: EdgeInsets.all(8.0), child: Text(description)),
          ],
        ),
      ),
    ),
  );
}
