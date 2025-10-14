import 'package:beauty_near/utils/assets.dart';
import 'package:beauty_near/widgets/circular_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../utils/color_constant.dart';

class BarbarDetailScreen extends StatefulWidget {
  const BarbarDetailScreen({super.key});

  @override
  State<BarbarDetailScreen> createState() => _BarbarDetailScreenState();
}

class _BarbarDetailScreenState extends State<BarbarDetailScreen> {
  List<String> selectedServices = [];
  String? selectedTimeSlot;

  final List<String> services = [
    'Hair Cut',
    'Beard Trim',
    'Hair Wash',
    'Hair Styling',
  ];

  final List<String> timeSlots = [
    '9:00 AM',
    '10:00 AM',
    '11:00 AM',
    '2:00 PM',
    '3:00 PM',
    '4:00 PM',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kScaffoldColor,
      body: Column(
        children: [
          // Hero Image Section
          Container(
            height: 251.h,
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Barber Image
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(PngAssets.bookingImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Gradient Overlay
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.7),
                      ],
                    ),
                  ),
                ),
                // Back Button
                Positioned(
                  top: 50.h,
                  left: 20.w,
                  child: Container(
                    width: 36.w,
                    height: 36.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.chevron_left,
                        color: AppColors.textPrimaryColor,
                        size: 18.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Content Section
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.kScaffoldColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    SizedBox(height: 15.h),
                    Text(
                      "Barber Name Here",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Icon(
                          Iconsax.location5,
                          color: AppColors.kPrimaryColor,
                          size: 18.sp,
                        ),
                        SizedBox(width: 5.h),
                        Text(
                          "10 km",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(width: 5.h),
                        Text(
                          '•',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(width: 5.h),
                        Icon(
                          Iconsax.star1,
                          size: 16.sp,
                          color: Color(0XffDBA300),
                        ),
                        SizedBox(width: 5.h),
                        Text(
                          "4.8 (145 Reviews)",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      "About Barber",
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      "With 12 years perfecting the art of precision cutting, Marcus brings unmatched expertise to every appointment. Passionate about creating looks that reflect each client's unique style. M...Readmore",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      padding: EdgeInsets.all(16),
                      height: 68.h,
                      decoration: BoxDecoration(
                        color: AppColors.greenColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Iconsax.clock,
                            color: AppColors.greenColor,
                            size: 24.sp,
                          ),
                          SizedBox(width: 8.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Available Today",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "Book now for same-day service",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 31.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(70.r),
                            ),
                            child: Center(
                              child: Text(
                                "Services",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Container(
                            height: 31.h,
                            decoration: BoxDecoration(
                              gradient: AppColors.kPrimaryGradient,
                              borderRadius: BorderRadius.circular(70.r),
                            ),
                            child: Center(
                              child: Text(
                                "Services",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 146.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                customRatingRow(
                                  ratingNumber: "5",
                                  barLenght: 100,
                                ),
                                SizedBox(height: 8.h),
                                customRatingRow(
                                  ratingNumber: "4",
                                  barLenght: 75,
                                ),
                                SizedBox(height: 8.h),

                                customRatingRow(
                                  ratingNumber: "3",
                                  barLenght: 50,
                                ),
                                SizedBox(height: 8.h),

                                customRatingRow(
                                  ratingNumber: "2",
                                  barLenght: 25,
                                ),
                                SizedBox(height: 8.h),

                                customRatingRow(
                                  ratingNumber: "1",
                                  barLenght: 10,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 51.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,

                            children: [
                              Text(
                                "4.0",
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              fiveStarRow(),
                              SizedBox(height: 8.h),
                              Text(
                                "52 Reviews",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.h),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return reviewsCard();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

      // Book Appointment Button
    );
  }

  customRatingRow({required String ratingNumber, required double barLenght}) {
    return Row(
      children: [
        Text(
          ratingNumber,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
        SizedBox(width: 4.w),
        Icon(Iconsax.star1, size: 16.sp, color: Color(0XffDBA300)),
        SizedBox(width: 4.w),
        Expanded(
          child: LinearProgressIndicator(
            minHeight: 6.h,
            value: barLenght / 100,
            valueColor: AlwaysStoppedAnimation(AppColors.kPrimaryColor),
            backgroundColor: Colors.white,
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
        // Container(
        //   width: barLenght.w,
        //   height: 6.h,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(4),
        //     color: Color(0xffd9303c),
        //   ),
        // ),
      ],
    );
  }

  fiveStarRow() {
    return Row(
      children: [
        Icon(Iconsax.star1, size: 16.sp, color: Color(0XffDBA300)),
        Icon(Iconsax.star1, size: 16.sp, color: Color(0XffDBA300)),
        Icon(Iconsax.star1, size: 16.sp, color: Color(0XffDBA300)),
        Icon(Iconsax.star1, size: 16.sp, color: Color(0XffDBA300)),
        Icon(Iconsax.star1, size: 16.sp, color: Colors.grey),
      ],
    );
  }

  reviewsCard() {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Row(
            children: [
              CircularImageWidget(
                height: 38.h,
                width: 38.w,
                image: PngAssets.person,
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Courtney Henry",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        fiveStarRow(),
                        SizedBox(width: 4.w),
                        Text(
                          "2 mins ago",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Icon(Icons.more_vert),
            ],
          ),
          SizedBox(height: 13.h),
          Text(
            "Consequat velit qui adipisicing sunt do rependerit ad laborum tempor ullamco exercitation. Ullamco tempor adipisicing et voluptate duis sit esse aliqua",
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 20.h),
          Divider(color: AppColors.greyColor),
        ],
      ),
    );
  }
}
