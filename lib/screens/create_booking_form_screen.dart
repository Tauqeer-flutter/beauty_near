import 'package:beauty_near/route_generator.dart';
import 'package:beauty_near/utils/color_constant.dart';
import 'package:beauty_near/widgets/custom_app_bar.dart';
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
      appBar: CustomAppBar(title: "Create Booking"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            Center(
              child: Text(
                "Fill This Form",
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
                "Please fill this form to proceed further",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textGreyColor,
                ),
              ),
            ),
            SizedBox(height: 32.h),
            Text(
              "Number of Adults",
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
              "Number of Kids",
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
              "Select Date",
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
              "Select Time",
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
                child: Text("Apply"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
