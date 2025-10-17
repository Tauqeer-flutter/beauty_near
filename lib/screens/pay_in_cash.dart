import 'package:beauty_near/utils/extensions.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../route_generator.dart';
import '../utils/color_constant.dart';
import '../widgets/add_card_view_model.dart';
import '../widgets/custom_app_bar.dart';

class PayInCash extends StatelessWidget {
  const PayInCash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: context.localization.payInCash),
      backgroundColor: AppColors.kScaffoldColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.h),

              Center(
                child: Text(
                  context.localization.addCardDetails,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 21.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.localization.cardHolderName,
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
                    context.localization.cardNumber,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.textPrimaryColor,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  TextFormField(
                    keyboardType: TextInputType.number,
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
                              context.localization.expiryDate,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.textPrimaryColor,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Consumer<AddCardViewModel>(
                              builder: (context, viewModel, child) {
                                return GestureDetector(
                                  onTap: () => viewModel.selectDate(context),
                                  child: AbsorbPointer(
                                    child: TextFormField(
                                      controller: viewModel.dateController,
                                      decoration: InputDecoration(
                                        hintText: 'MM/DD/YYYY',
                                        suffixIcon: Icon(
                                          Iconsax.calendar_1,
                                          size: 18.sp,
                                          color: AppColors.greyColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
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
                              context.localization.cvv,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.textPrimaryColor,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: context.localization.cvv,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    context.localization.zipCode,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.textPrimaryColor,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: context.localization.zipCode,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    context.localization.countryRegion,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.textPrimaryColor,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Consumer<AddCardViewModel>(
                    builder: (context, viewModel, child) {
                      return Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.strokeColor),
                          borderRadius: BorderRadius.circular(38.r),
                          color: Colors.white,
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            hint: Text(
                              context.localization.selectCountry,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.greyColor,
                              ),
                            ),
                            items: viewModel.countries.map((String country) {
                              return DropdownMenuItem<String>(
                                value: country,
                                child: Text(
                                  country,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: AppColors.textPrimaryColor,
                                  ),
                                ),
                              );
                            }).toList(),
                            value: viewModel.selectedCountry,
                            onChanged: (String? newValue) {
                              viewModel.setSelectedCountry(newValue);
                            },
                            buttonStyleData: ButtonStyleData(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              height: 50.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            iconStyleData: IconStyleData(
                              icon: Icon(
                                Iconsax.arrow_down_1,
                                size: 18.sp,
                                color: AppColors.greyColor,
                              ),
                            ),
                            dropdownStyleData: DropdownStyleData(
                              maxHeight: 200.h,
                              width: MediaQuery.of(context).size.width - 40.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.1),
                                    blurRadius: 10,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                              ),
                              offset: Offset(0, -(200.h + 60.h)),
                              scrollbarTheme: ScrollbarThemeData(
                                radius: Radius.circular(40),
                                thickness: WidgetStateProperty.all(6),
                                thumbVisibility: WidgetStateProperty.all(true),
                              ),
                            ),
                            menuItemStyleData: MenuItemStyleData(
                              height: 40.h,
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),

              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(bottom: 24.h, left: 20.w, right: 20.w),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, orderSummary);
            },
            child: Text('Pay Now'),
          ),
        ),
      ),
    );
  }
}
