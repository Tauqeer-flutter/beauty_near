import 'package:beauty_near/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PayInCash extends StatelessWidget {
  const PayInCash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Pay In Cash"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30.h),
          Text(
            "Add Card Details",
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
