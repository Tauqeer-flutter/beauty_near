import 'package:beauty_near/route_generator.dart';
import 'package:beauty_near/utils/assets.dart';
import 'package:beauty_near/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../view_models/language_view_model.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen>
//     with TickerProviderStateMixin {
//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//
//     // Listening to changes in SplashViewModel
//     return Consumer<SplashViewModel>(
//       builder: (context, splashViewModel, child) {
//         // Check if the language is already fetched or not
//         if (splashViewModel.isLanguageFetched) {
//           // If language is fetched, navigate to the next screen
//           WidgetsBinding.instance.addPostFrameCallback((_) {
//             Navigator.pushReplacementNamed(context, loginScreen);
//           });
//         }
//
//         return Scaffold(
//           appBar: AppBar(backgroundColor: Colors.transparent),
//           extendBodyBehindAppBar: true,
//           backgroundColor: AppColors.kPrimaryColor,
//           body: Center(
//             child: AnimatedBuilder(
//               animation: splashViewModel.animationController,
//               builder: (context, child) {
//                 final value = splashViewModel.animationController.value;
//                 return Transform.scale(
//                   scale: value,
//                   child: SizedBox(
//                     height: 180.h,
//                     width: width * 0.6,
//                     child: SvgPicture.asset(
//                       SvgAssets.logo,
//                       colorFilter: ColorFilter.mode(
//                         Colors.white,
//                         BlendMode.srcIn,
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

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
      appBar: AppBar(backgroundColor: Colors.transparent),
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.kPrimaryColor,
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
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
