import 'package:beauty_near/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../route_generator.dart';
import '../utils/assets.dart';
import '../utils/color_constant.dart';
import '../view_models/create_booking_view_model.dart';
import '../widgets/bottom sheet/review_bottom_sheet.dart';
import '../widgets/reviews_card.dart';
import '../widgets/service_card.dart';

class BarbarDetailScreen extends StatelessWidget {
  BarbarDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateBookingViewModel>(
      builder: (context, createBookingViewModel, child) {
        return Scaffold(
          backgroundColor: AppColors.kScaffoldColor,
          body: SafeArea(
            top: false,
            child: Column(
              children: [
                // Hero Image Section
                SizedBox(
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
                              Colors.black.withValues(alpha: 0.7),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          SizedBox(height: 15.h),
                          Padding(
                            padding: EdgeInsetsGeometry.symmetric(
                              horizontal: 20.w,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                      context.localization.distance('10'),
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
                                    GestureDetector(
                                      onTap: () {
                                        showReviewBottomSheet(context);
                                      },
                                      child: Text(
                                        context.localization.ratingAndReviews(
                                          '4.8',
                                          145,
                                        ),
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.h),
                                Text(
                                  context.localization.aboutBarber,
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
                                  // height: 68.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.greenColor.withValues(
                                      alpha: 0.1,
                                    ),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            context.localization.availableToday,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            context.localization.bookNow,
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
                                      child: GestureDetector(
                                        onTap: () {
                                          createBookingViewModel.setSelectedTab(
                                            0,
                                          );
                                        },
                                        child: Container(
                                          height: 31.h,
                                          decoration: BoxDecoration(
                                            gradient:
                                                createBookingViewModel
                                                        .selectedTabIndex ==
                                                    0
                                                ? AppColors.kPrimaryGradient
                                                : null,

                                            color:
                                                createBookingViewModel
                                                        .selectedTabIndex ==
                                                    0
                                                ? null
                                                : Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              70.r,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              context.localization.services,
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400,
                                                color:
                                                    createBookingViewModel
                                                            .selectedTabIndex ==
                                                        0
                                                    ? Colors.white
                                                    : AppColors
                                                          .textPrimaryColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10.w),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          createBookingViewModel.setSelectedTab(
                                            1,
                                          );
                                        },
                                        child: Container(
                                          height: 31.h,
                                          decoration: BoxDecoration(
                                            gradient:
                                                createBookingViewModel
                                                        .selectedTabIndex ==
                                                    1
                                                ? AppColors.kPrimaryGradient
                                                : null,

                                            color:
                                                createBookingViewModel
                                                        .selectedTabIndex ==
                                                    1
                                                ? null
                                                : Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              70.r,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              context.localization.reviews,
                                              style: TextStyle(
                                                color:
                                                    createBookingViewModel
                                                            .selectedTabIndex ==
                                                        1
                                                    ? Colors.white
                                                    : AppColors
                                                          .textPrimaryColor,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.h),
                                // Conditional content based on selected tab
                                if (createBookingViewModel.selectedTabIndex ==
                                    0) ...[
                                  SingleChildScrollView(
                                    child: Wrap(
                                      spacing: 10.0, // Horizontal spacing
                                      runSpacing: 10.0, // Vertical spacing
                                      children: List.generate(8, (index) {
                                        final service = createBookingViewModel
                                            .services[index];
                                        return ServiceCard(
                                          service: service,
                                          isSelected: createBookingViewModel
                                              .isServiceSelected(service),
                                          onTap: () => createBookingViewModel
                                              .toggleServiceSelection(service),
                                        );
                                      }),
                                    ),
                                  ),

                                  // Services Tab - Grid View
                                  SizedBox(height: 30.h),

                                  // Selected Services Section - Only visible on Services tab
                                ] else ...[
                                  // Reviews Tab - Rating Summary and List View
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    // height: 146.h,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,

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
                                              context.localization.onlyReviews(
                                                148,
                                              ),
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
                                  // Reviews List
                                  ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: 6,
                                    itemBuilder: (context, index) {
                                      return ReviewsCard();
                                    },
                                  ),
                                ],
                              ],
                            ),
                          ),
                          createBookingViewModel.selectedTabIndex == 0
                              ? Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20.w,
                                  ),
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      SizedBox(height: 10.h),
                                      Center(
                                        child: Container(
                                          width: 60.w,
                                          height: 5.h,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              10.r,
                                            ),
                                            color: Color(0xff4a4a4a),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 15.h),
                                      Text(
                                        "Selected Services",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(height: 20.h),
                                      // Dynamic selected services
                                      if (createBookingViewModel
                                          .selectedServices
                                          .isNotEmpty) ...[
                                        ...createBookingViewModel
                                            .selectedServices
                                            .map(
                                              (service) => Padding(
                                                padding: EdgeInsets.only(
                                                  bottom: 10.h,
                                                ),
                                                child: selectedServices(
                                                  serviceName: service.name,
                                                  duration: service.duration,
                                                  price: service.price,
                                                  icon: service.icon,
                                                ),
                                              ),
                                            )
                                            .toList(),
                                        SizedBox(height: 20.h),
                                        // Total price bar
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(
                                              context,
                                              selectServicesOrderSummary,
                                            );
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(15),
                                            decoration: BoxDecoration(
                                              gradient:
                                                  AppColors.kPrimaryGradient,
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  context.localization.total,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Text(
                                                  "\$${createBookingViewModel.getTotalPrice().toStringAsFixed(0)}",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18.sp,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ] else ...[
                                        Text(
                                          context
                                              .localization
                                              .noServicesSelected,
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.darkGreyColor,
                                          ),
                                        ),
                                      ],
                                      SizedBox(height: 25.h),
                                    ],
                                  ),
                                )
                              : SizedBox(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Book Appointment Button
        );
      },
    );
  }

  selectedServices({
    required final String serviceName,
    required String duration,
    required String price,
    required String icon,
  }) {
    return Container(
      height: 65.h,
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: Colors.white,

        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.grey.shade200,
            spreadRadius: 5,
          ),
        ],
      ),

      child: Row(
        children: [
          SvgPicture.asset(icon, height: 45.h, width: 45.w),
          SizedBox(width: 7.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                serviceName,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 3.h),
              Text(
                duration,
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Spacer(),
          Text(
            price,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: AppColors.kPrimaryColor,
            ),
          ),
        ],
      ),
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
}
