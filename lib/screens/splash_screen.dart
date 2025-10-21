import 'package:beauty_near/route_generator.dart';
import 'package:beauty_near/utils/assets.dart';
import 'package:beauty_near/utils/color_constant.dart';
import 'package:beauty_near/view_models/language_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
      lowerBound: 0,
      upperBound: 1,
    );
    _controller.forward(from: 0);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.read<LanguageViewModel>().fetchInitialLocale();
      _controller.addStatusListener((status) {
        if (status.isCompleted) {
          Navigator.pushReplacementNamed(context, loginScreen);
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.widthOf(context);
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final value = _controller.value;
            return Transform.scale(
              scale: value,
              child: SizedBox(
                height: 180.h,
                width: width * 0.6,
                child: SvgPicture.asset(
                  SvgAssets.logo,
                  colorFilter: ColorFilter.mode(
                    AppColors.kPrimaryColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) async {
//       await context.read<LanguageViewModel>().fetchInitialLocale();
//       await Future.delayed(Duration(seconds: 2));
//       Navigator.pushReplacementNamed(context, loginScreen);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.kPrimaryColor,
//       body: Center(
//         child: SvgPicture.asset(
//           SvgAssets.logo,
//           colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
//         ),
//       ),
//     );
//   }
// }
