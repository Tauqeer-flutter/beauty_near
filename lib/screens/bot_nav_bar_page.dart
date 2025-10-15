import 'dart:math';

import 'package:beauty_near/route_generator.dart';
import 'package:beauty_near/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

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
      body: Stack(
        children: [
          viewModel.currentChild,
          Positioned(
            left: 0,
            right: 0,
            bottom: context.bottomNotch > 0
                ? 62.5.h + context.bottomNotch
                : 62.5.h,
            child: ListenableBuilder(
              listenable: viewModel.focusNode,
              builder: (context, child) {
                if (viewModel.focusNode.hasFocus) {
                  return SizedBox.shrink();
                }
                return child!;
              },
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, createBookingGender);
                  },
                  child: Transform.rotate(
                    angle: pi / 4,
                    child: Container(
                      width: 60.h,
                      height: 60.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.kPrimaryColor,
                          width: 1.h,
                        ),
                        gradient: AppColors.primaryGradient,
                        borderRadius: BorderRadius.circular(14.r),
                      ),
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
