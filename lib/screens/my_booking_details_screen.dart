import 'package:beauty_near/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../route_generator.dart';
import '../utils/assets.dart';
import '../utils/color_constant.dart';
import '../widgets/custom_app_bar.dart';

class MyBookingDetailScreen extends StatelessWidget {
  final bool isCompleted;
  const MyBookingDetailScreen({super.key, required this.isCompleted});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Bookings Details"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 30.h),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: Colors.white,
                ),
                width: double.infinity,

                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.0.w,
                    vertical: 16.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Congratulations!",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textPrimaryColor,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "Your Booking was successfully Booked.",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textPrimaryColor,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          Text(
                            "Booking ID:",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textPrimaryColor,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "124G4587",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      Row(
                        children: [
                          Text(
                            "Booked On:",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textPrimaryColor,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "12:12:2025",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 58.h,
                    width: 58.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(PngAssets.person),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    "Client Name",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textPrimaryColor,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, chatScreen);
                    },
                    child: Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: AppColors.kPrimaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Icon(
                        Iconsax.message5,
                        color: AppColors.kPrimaryColor,
                        size: 20.sp,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              Text(
                'Booking Details',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimaryColor,
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: Colors.white,
                ),

                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 15.h,
                  ),

                  child: Column(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        visualDensity: VisualDensity(vertical: -4),
                        leading: Padding(
                          padding: const EdgeInsets.only(bottom: 100.0),
                          child: Icon(
                            Iconsax.user,
                            color: AppColors.kPrimaryColor,
                          ),
                        ),
                        title: Text(
                          "Service",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textPrimaryColor,
                          ),
                        ),
                        subtitle: Padding(
                          padding: EdgeInsets.only(top: 7.0),
                          child: Text(
                            'Haircut  •  Shaving  •  Head Massage',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        visualDensity: VisualDensity(vertical: -4),
                        leading: Padding(
                          padding: const EdgeInsets.only(bottom: 100.0),
                          child: Icon(
                            Iconsax.user,
                            color: AppColors.kPrimaryColor,
                          ),
                        ),
                        title: Text(
                          "Persons",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textPrimaryColor,
                          ),
                        ),
                        subtitle: Padding(
                          padding: EdgeInsets.only(top: 7.0),
                          child: Text(
                            '2 Adults  •  1 Kid',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        visualDensity: VisualDensity(vertical: -4),
                        leading: Padding(
                          padding: const EdgeInsets.only(bottom: 100.0),
                          child: Icon(
                            Iconsax.user,
                            color: AppColors.kPrimaryColor,
                          ),
                        ),
                        title: Text(
                          "Timing",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textPrimaryColor,
                          ),
                        ),
                        subtitle: Padding(
                          padding: EdgeInsets.only(top: 7.0),
                          child: Text(
                            '12 Jun, 2025  •  12:00 PM',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              Text(
                "Payment Summary",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimaryColor,
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.all(15.0.w),
                  child: Column(
                    children: [
                      paymentSummartRow(service: "Haircut", price: "\$20"),
                      SizedBox(height: 20.h),
                      paymentSummartRow(service: "Haircut", price: "\$20"),
                      SizedBox(height: 20.h),
                      paymentSummartRow(service: "Haircut", price: "\$20"),
                      SizedBox(height: 20.h),
                      paymentSummartRow(service: "Haircut", price: "\$20"),
                      SizedBox(height: 20.h),
                      paymentSummartRow(service: "Haircut", price: "\$20"),
                      SizedBox(height: 15.h),
                      Divider(color: AppColors.greyColor),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Text(
                            "Total Amount:",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textPrimaryColor,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "\$100",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          gradient: LinearGradient(
                            colors: [
                              AppColors.kPrimaryColor,
                              Color(0xffDE6C75),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 15.h,
                        ),
                        child: Row(
                          children: [
                            Text(
                              "Total Duration",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                            Spacer(),
                            Text(
                              "60 Minutes",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              if (isCompleted)
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel'),
                )
              else
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        decoration: BoxDecoration(
                          color: Color(0xff00A12B).withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(38.r),
                        ),
                        child: Center(
                          child: Text(
                            "Accept",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff00A12B),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12.h),

                        decoration: BoxDecoration(
                          color: AppColors.kPrimaryColor.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(38.r),
                        ),
                        child: Center(
                          child: Text(
                            "Reject",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.kPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

              SizedBox(height: context.notchAwareBottomPadding),
            ],
          ),
        ),
      ),
    );
  }

  paymentSummartRow({required String service, required String price}) {
    return Row(
      children: [
        Text(
          service,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.textPrimaryColor,
          ),
        ),
        Spacer(),
        Text(
          price,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.textPrimaryColor,
          ),
        ),
      ],
    );
  }
}
