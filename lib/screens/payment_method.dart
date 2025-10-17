import 'package:beauty_near/route_generator.dart';
import 'package:beauty_near/utils/assets.dart';
import 'package:beauty_near/utils/color_constant.dart';
import 'package:beauty_near/utils/extensions.dart';
import 'package:beauty_near/widgets/custom_app_bar.dart';
import 'package:beauty_near/widgets/gender_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: context.localization.paymentMethod),

      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30.h),
            Text(
              context.localization.selectPaymentMethod,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 15.h),
            GenderCard(
              title: context.localization.payInCash,
              icon: SvgAssets.men,
              isSelected: false,
              onTap: () {
                Navigator.pushNamed(context, payInCash);
              },
            ),
            SizedBox(height: 15.h),
            GenderCard(
              title: context.localization.payOnlineStripe,
              icon: SvgAssets.women,
              isSelected: false,
              onTap: () {
                Navigator.pushNamed(context, payOnline);
              },
            ),
            SizedBox(height: 15.h),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: Color(0xffFFDEDE),
                border: Border.all(color: AppColors.kPrimaryColor, width: 1),
              ),
              child: Text(
                context.localization.upfrontDepositDescription,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: AppColors.kPrimaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
