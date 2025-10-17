import 'package:beauty_near/screens/bot_nav_bar_page.dart';
import 'package:beauty_near/utils/color_constant.dart';
import 'package:beauty_near/utils/extensions.dart';
import 'package:beauty_near/widgets/custom_app_bar.dart';
import 'package:beauty_near/widgets/dialog%20box/success_dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: context.localization.orderSummary),
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
                  orderSummaryRow(
                    serviceName: context.localization.haircut,
                    price: "\$20",
                  ),
                  SizedBox(height: 20.h),
                  orderSummaryRow(
                    serviceName: context.localization.shaving,
                    price: "\$20",
                  ),
                  SizedBox(height: 20.h),
                  orderSummaryRow(
                    serviceName: context.localization.headMassage,
                    price: "\$20",
                  ),
                  SizedBox(height: 20.h),
                  orderSummaryRow(
                    serviceName: context.localization.platformFees,
                    price: "\$20",
                  ),
                  SizedBox(height: 20.h),
                  orderSummaryRow(
                    serviceName: context.localization.taxes,
                    price: "\$20",
                  ),
                  SizedBox(height: 20.h),
                  Divider(color: AppColors.greyColor),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Text(
                        context.localization.totalAmount,
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
                          context.localization.totalDuration,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),

                        Spacer(),
                        Text(
                          context.localization.minutes(60),
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
            SizedBox(height: 20.h),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: Color(0xffFFDEDE),
                border: Border.all(color: AppColors.kPrimaryColor, width: 1),
              ),
              child: Text(
                context.localization.cancelPaymentAcknowledgement,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.kPrimaryColor,
                ),
              ),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  showSuccessDialog(
                    screenContext: context,
                    desc: context.localization.bookingPlacedSuccessfully,
                    onSuccess: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        BotNavPage.routeName,
                        (route) => false,
                      );
                    },
                  );
                },
                child: Text(context.localization.payNow),
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
