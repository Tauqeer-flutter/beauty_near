import 'package:beauty_near/route_generator.dart';
import 'package:beauty_near/utils/color_constant.dart';
import 'package:beauty_near/utils/extensions.dart';
import 'package:beauty_near/widgets/custom_app_bar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class CreateBookingFormScreen extends StatefulWidget {
  const CreateBookingFormScreen({super.key});

  @override
  State<CreateBookingFormScreen> createState() =>
      _CreateBookingFormScreenState();
}

class _CreateBookingFormScreenState extends State<CreateBookingFormScreen> {
  int adultsCount = 0;
  int kidsCount = 0;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String? _selectedEthnicity;

  final List<String> _ethnicities = [
    'White',
    'Black/African/Caribbean',
    'Asian',
  ];

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: context.localization.createBooking),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            Center(
              child: Text(
                context.localization.fillThisForm,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.kBlackText,
                ),
              ),
            ),
            SizedBox(height: 6.h),
            Center(
              child: Text(
                context.localization.pleaseFillThisForm,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textGreyColor,
                ),
              ),
            ),
            SizedBox(height: 32.h),
            Text(
              context.localization.noOfAdults,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.kBlackText,
              ),
            ),
            SizedBox(height: 8.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 26.w),
              width: double.infinity,
              height: 45.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(70.r),
                border: Border.all(color: AppColors.strokeColor),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        adultsCount++;
                      });
                    },
                    child: Text("+", style: TextStyle(fontSize: 25.sp)),
                  ),
                  Text(
                    adultsCount.toString(),
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (adultsCount > 0) {
                          adultsCount--;
                        }
                      });
                    },
                    child: Text("-", style: TextStyle(fontSize: 25.sp)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              context.localization.noOfKids,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.kBlackText,
              ),
            ),
            SizedBox(height: 8.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 26.w),
              width: double.infinity,
              height: 45.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(70.r),
                border: Border.all(color: AppColors.strokeColor),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        kidsCount++;
                      });
                    },
                    child: Text("+", style: TextStyle(fontSize: 25.sp)),
                  ),
                  Text(
                    kidsCount.toString(),
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (kidsCount > 0) {
                          kidsCount--;
                        }
                      });
                    },
                    child: Text("-", style: TextStyle(fontSize: 25.sp)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              context.localization.selectEthnicity,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.textPrimaryColor,
              ),
            ),
            SizedBox(height: 8.h),
            DropdownButtonFormField2<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.only(
                  top: 13.h,
                  bottom: 13.h,
                  right: 10.w,
                ), // Offset from upper side
              ),
              value: _selectedEthnicity,
              isExpanded: true,
              hint: Text(context.localization.selectEthnicity),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedEthnicity = newValue;
                });
              },
              items: _ethnicities.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              dropdownStyleData: DropdownStyleData(
                offset: Offset(0, -4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    12.r,
                  ), // Border radius for dropdown
                  color: Colors.white, // White background
                ),
              ),
              buttonStyleData: ButtonStyleData(
                decoration: BoxDecoration(
                  color: Colors.white, // White background for button
                ),
              ),
              menuItemStyleData: MenuItemStyleData(
                padding: EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
            SizedBox(height: 20.h),

            Text(
              context.localization.selectDate,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.kBlackText,
              ),
            ),
            SizedBox(height: 8.h),
            GestureDetector(
              onTap: _selectDate,
              child: AbsorbPointer(
                child: TextFormField(
                  controller: TextEditingController(
                    text: selectedDate != null
                        ? '${selectedDate!.day.toString().padLeft(2, '0')}/${selectedDate!.month.toString().padLeft(2, '0')}/${selectedDate!.year}'
                        : '',
                  ),
                  decoration: InputDecoration(
                    hintText: "DD/MM/YYYY",
                    suffixIcon: Icon(Iconsax.calendar_2),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              context.localization.selectTime,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.kBlackText,
              ),
            ),
            SizedBox(height: 8.h),
            GestureDetector(
              onTap: _selectTime,
              child: AbsorbPointer(
                child: TextFormField(
                  controller: TextEditingController(
                    text: selectedTime != null
                        ? selectedTime!.format(context)
                        : '',
                  ),
                  decoration: InputDecoration(
                    hintText: "HH:MM",
                    suffixIcon: Icon(Iconsax.clock),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, barbarList);
                },
                child: Text(context.localization.apply),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
