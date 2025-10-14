import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/custom_app_bar.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Terms and Conditions"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            Text(
              "Information We Collect",
              style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 5.h),
            Text(
              "A- Personal Information",
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 5.h),
            Flexible(
              child: Text(
                ". Lorem ipsum dolor sit amet consectetur. Porttitor in ornare convallis mauris proin in sapien non. Massa arcu mi faucibus id nunc urna in. Vestibulum augue enim tristique aliquet nec tellus gravida vitae. Vitae fusce eget adipiscing ullamcorper condimentum a mollis hendrerit. Ultrices pellentesque tristique pretium metus ultricies in semper amet. Quis vitae fermentum magna enim sed tempus. Tempor platea at nec vitae donec gravida aenean arcu. Senectus nulla a facilisis nunc cras lorem eget. Neque sollicitudin.",
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              "B- Payment Information",
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 10.h),
            Flexible(
              child: Text(
                ". Lorem ipsum dolor sit amet consectetur. Porttitor in ornare convallis mauris proin in sapien non. Massa arcu mi faucibus id nunc urna in. Vestibulum augue enim tristique aliquet nec tellus gravida vitae. Vitae fusce eget adipiscing ullamcorper condimentum a mollis hendrerit. Ultrices pellentesque tristique pretium metus ultricies in semper amet. Quis vitae fermentum magna enim sed tempus. Tempor platea at nec vitae donec gravida aenean arcu. Senectus nulla a facilisis nunc cras lorem eget. Neque sollicitudin.",
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              "C- Usage Data",
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 10.h),
            Flexible(
              child: Text(
                ". Lorem ipsum dolor sit amet consectetur. Porttitor in ornare convallis mauris proin in sapien non. Massa arcu mi faucibus id nunc urna in. Vestibulum augue enim tristique aliquet nec tellus gravida vitae. Vitae fusce eget adipiscing ullamcorper condimentum a mollis hendrerit. Ultrices pellentesque tristique pretium metus ultricies in semper amet. Quis vitae fermentum magna enim sed tempus. Tempor platea at nec vitae donec gravida aenean arcu. Senectus nulla a facilisis nunc cras lorem eget. Neque sollicitudin.",
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
