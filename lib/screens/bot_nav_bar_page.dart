import 'dart:math';

import 'package:beauty_near/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../route_generator.dart';
import '../utils/color_constant.dart';
import '../view_models/bot_nav_view_model.dart';
import '../widgets/bottom_nav_bar.dart';

class BotNavPage extends StatelessWidget {
  static const String routeName = '/bot_nav_page';

  const BotNavPage({super.key});

  @override
  Widget build(BuildContext context) {
    final BotNavViewModel viewModel = context.watch<BotNavViewModel>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          viewModel.currentChild,
          Positioned(
            left: 0,
            right: 0,
            bottom: context.bottomNotch > 0
                ? 62.5.h + context.bottomNotch
                : 62.5.h,
            child: Center(
              child: Transform.rotate(
                angle: pi / 4,
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(14.r),
                    onTap: () {
                      Navigator.pushNamed(context, createBookingGender);
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        color: AppColors.kPrimaryColor,
                        gradient: AppColors.primaryGradient,
                        border: Border.all(
                          color: AppColors.kPrimaryColor,
                          width: 1.h,
                        ),
                        borderRadius: BorderRadius.circular(14.r),
                        boxShadow: kElevationToShadow[2],
                      ),
                      width: 60.h,
                      height: 60.h,
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 24.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(),
      extendBody: true,
      extendBodyBehindAppBar: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(
        currentIndex: viewModel.currentPage,
        onTap: (index) {
          viewModel.currentPage = index;
        },
      ),
    );
  }
}
