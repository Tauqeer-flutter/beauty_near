import 'package:beauty_near/route_generator.dart';
import 'package:beauty_near/utils/color_constant.dart';
import 'package:beauty_near/utils/extensions.dart';
import 'package:beauty_near/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectServicesOrderSummary extends StatelessWidget {
  const SelectServicesOrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Select Services"),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30.h),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Order Summary",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 25.h),
                  orderSummaryRow(serviceName: "Haircut", price: "\$20"),
                  SizedBox(height: 20.h),
                  orderSummaryRow(serviceName: "Shaving", price: "\$20"),
                  SizedBox(height: 20.h),
                  orderSummaryRow(serviceName: "Massage", price: "\$20"),
                  SizedBox(height: 20.h),
                  Divider(color: AppColors.greyColor),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Text(
                        "Total Amount:",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "\$100",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 15.h,
                    ),
                    decoration: BoxDecoration(
                      gradient: AppColors.kPrimaryGradient,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Total Duration",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "60 Minutes",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, paymentMethod);
                },
                child: Text("Book Now"),
              ),
            ),
            SizedBox(height: context.notchAwareBottomPadding),
          ],
        ),
      ),
    );
  }

  orderSummaryRow({required String serviceName, required String price}) {
    return Row(
      children: [
        Text(
          serviceName,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
        ),
        Spacer(),
        Text(
          price,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
