import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../utils/assets.dart';
import '../utils/color_constant.dart';

class PersonalInformationScreen extends StatelessWidget {
  const PersonalInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kScaffoldColor,
        centerTitle: true,
        title: Text(
          "Personal Information",
          style: TextStyle(
            color: AppColors.textPrimaryColor,
            fontSize: 19.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 20.0.w),
          child: Container(
            width: 36.w,
            height: 36.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffFFFFFF),
            ),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.chevron_left,
                color: Color(0xff292D32),
                size: 18.sp,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.h),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 94.w,
                      height: 94.h,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: CircleAvatar(
                        radius: 38.r,
                        backgroundColor: Colors.pink,
                        // You can replace with actual image:
                        backgroundImage: AssetImage(PngAssets.person),
                      ),
                    ),
                    Positioned(
                      bottom: 1,
                      right: 1,
                      child: CircleAvatar(
                        radius: 12.r,
                        backgroundColor: Color(0xffEFC2C8),

                        child: Icon(
                          Iconsax.edit,
                          color: AppColors.kPrimaryColor,
                          size: 12.w,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              Text(
                "Enter Name",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 8.h),
              TextFormField(decoration: InputDecoration(hintText: "John Doe")),
              SizedBox(height: 15.h),
              Text(
                "Email Address",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 8.h),
              TextFormField(
                decoration: InputDecoration(hintText: "John1Dow@example.com"),
              ),
              SizedBox(height: 15.h),
              Text(
                "Phone Number",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 8.h),
              TextFormField(
                decoration: InputDecoration(hintText: "+123 4569 9630 0258"),
              ),
              SizedBox(height: 15.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(70.r),
                  border: Border.all(
                    color: AppColors.kPrimaryColor, // Set the border color here
                    width: 1.sp, // Optional: Set the border width
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      "Change Password",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.kPrimaryColor,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward,
                      color: AppColors.kPrimaryColor,
                      size: 20.sp,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Edit Profile"),
                ),
              ),
              SizedBox(height: 40.h),
              Text(
                "Bank Details",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textPrimaryColor,
                ),
              ),
              SizedBox(height: 30.h),

              Text(
                'Card Holder Name',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.textPrimaryColor,
                ),
              ),
              SizedBox(height: 8.h),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'John Doe',
                  suffixIcon: Icon(
                    Iconsax.user,
                    size: 18.sp,
                    color: AppColors.greyColor,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                'Card Number',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.textPrimaryColor,
                ),
              ),
              SizedBox(height: 8.h),
              TextFormField(
                decoration: InputDecoration(
                  hintText: '1234 5678 9012 3456',
                  suffixIcon: Icon(
                    Iconsax.card,
                    size: 18.sp,
                    color: AppColors.greyColor,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Expiry Date',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.textPrimaryColor,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'MM/DD/YYYY',
                            suffixIcon: Icon(
                              Iconsax.calendar_1,
                              size: 18.sp,
                              color: AppColors.greyColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'CVV',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.textPrimaryColor,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        TextFormField(
                          decoration: InputDecoration(hintText: 'CVC'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Text(
                'Zip Code',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.textPrimaryColor,
                ),
              ),
              SizedBox(height: 8.h),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Zip Code',
                  suffixIcon: Icon(
                    Iconsax.arrow_down_1,
                    size: 18.sp,
                    color: AppColors.greyColor,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                'Country / Region',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.textPrimaryColor,
                ),
              ),
              SizedBox(height: 8.h),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Select',
                  suffixIcon: Icon(
                    Iconsax.arrow_down_1,
                    size: 18.sp,
                    color: AppColors.greyColor,
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Edit Bank Details"),
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
