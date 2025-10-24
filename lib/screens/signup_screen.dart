import 'package:beauty_near/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../route_generator.dart';
import '../utils/assets.dart';
import '../utils/color_constant.dart';
import '../view_models/auth_view_model.dart';
import '../widgets/language_app_bar.dart';
import '../widgets/social_button.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthViewModel(),
      child: Scaffold(
        appBar: const LanguageAppBar(),
        extendBodyBehindAppBar: true,
        body: Consumer<AuthViewModel>(
          builder: (context, viewModel, child) {
            return Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Form(
                      key: viewModel.signupFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 100.h),
                          Center(
                            child: SvgPicture.asset(
                              SvgAssets.logo,
                              width: 145.w,
                              height: 130.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 50.h),
                          Center(
                            child: Text(
                              context.localization.createAnAccount,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textPrimaryColor,
                              ),
                            ),
                          ),
                          if (viewModel.errorMessage != null) ...[
                            SizedBox(height: 16.h),
                            Container(
                              padding: EdgeInsets.all(12.r),
                              decoration: BoxDecoration(
                                color: Colors.red.shade50,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.error_outline,
                                    color: Colors.red,
                                    size: 20.sp,
                                  ),
                                  SizedBox(width: 8.w),
                                  Expanded(
                                    child: Text(
                                      viewModel.errorMessage!,
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.close, size: 18.sp),
                                    onPressed: viewModel.clearError,
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                          SizedBox(height: 32.h),
                          Text(
                            context.localization.fullName,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.textPrimaryColor,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          TextFormField(
                            controller: viewModel.fullNameController,
                            validator: viewModel.validateName,
                            decoration: InputDecoration(
                              hintText: context.localization.yourName,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            context.localization.emailAddress,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.textPrimaryColor,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          TextFormField(
                            controller: viewModel.emailController,
                            validator: viewModel.validateEmail,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: context.localization.yourEmail,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            context.localization.phoneNumber,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.textPrimaryColor,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          TextFormField(
                            controller: viewModel.phoneController,
                            validator: viewModel.validatePhone,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: context.localization.phoneNumber,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            context.localization.password,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.textPrimaryColor,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          TextFormField(
                            controller: viewModel.passwordController,
                            validator: viewModel.validatePassword,
                            obscureText: !viewModel.isPasswordVisible,
                            decoration: InputDecoration(
                              hintText: context.localization.password,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  viewModel.isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: viewModel.togglePasswordVisibility,
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            context.localization.confirmPassword,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.textPrimaryColor,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          TextFormField(
                            controller: viewModel.confirmPasswordController,
                            validator: viewModel.validateConfirmPassword,
                            obscureText: !viewModel.isConfirmPasswordVisible,
                            decoration: InputDecoration(
                              hintText: context.localization.confirmPassword,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  viewModel.isConfirmPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed:
                                    viewModel.toggleConfirmPasswordVisibility,
                              ),
                            ),
                          ),
                          SizedBox(height: 24.h),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: viewModel.isLoading
                                  ? null
                                  : () => viewModel.signup(context),
                              child: viewModel.isLoading
                                  ? SizedBox(
                                      height: 20.h,
                                      width: 20.h,
                                      child: const CircularProgressIndicator(
                                        strokeWidth: 2,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                              Colors.white,
                                            ),
                                      ),
                                    )
                                  : Text(context.localization.next),
                            ),
                          ),
                          SizedBox(height: 24.h),
                          Center(child: SvgPicture.asset(SvgAssets.or)),
                          SizedBox(height: 24.h),
                          SocialButton(
                            text: context.localization.continueWithGoogle,
                            iconPath: SvgAssets.google,
                            onPressed: viewModel.isLoading
                                ? () {}
                                : () => viewModel.signInWithGoogle(context),
                          ),
                          SizedBox(height: 16.h),
                          SocialButton(
                            text: context.localization.continueWithFacebook,
                            iconPath: SvgAssets.facebook,
                            onPressed: viewModel.isLoading
                                ? () {}
                                : () => viewModel.signInWithFacebook(context),
                          ),
                          SizedBox(height: 24.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 5.w,
                            children: [
                              Text(
                                context.localization.alreadyHaveAccount,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: AppColors.darkGreyColor,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, loginScreen);
                                },
                                child: Text(
                                  context.localization.login,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.kPrimaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    ),
                  ),
                ),
                if (viewModel.isLoading)
                  Container(
                    color: Colors.black.withOpacity(0.3),
                    child: const Center(child: CircularProgressIndicator()),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

// class SignupScreen extends StatefulWidget {
//   const SignupScreen({super.key});
//
//   @override
//   State<SignupScreen> createState() => _SignupScreenState();
// }
//
// class _SignupScreenState extends State<SignupScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: LanguageAppBar(),
//       extendBodyBehindAppBar: true,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 20.w),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 100.h),
//               Center(
//                 child: SvgPicture.asset(
//                   SvgAssets.logo,
//                   width: 145.w,
//                   height: 130.h,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               SizedBox(height: 50.h),
//               Center(
//                 child: Text(
//                   context.localization.createAnAccount,
//                   style: TextStyle(
//                     fontSize: 16.sp,
//                     fontWeight: FontWeight.w500,
//                     color: AppColors.textPrimaryColor,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 32.h),
//               Text(
//                 context.localization.fullName,
//                 textAlign: TextAlign.left,
//                 style: TextStyle(
//                   fontSize: 14.sp,
//                   color: AppColors.textPrimaryColor,
//                 ),
//               ),
//               SizedBox(height: 8.h),
//               TextFormField(
//                 decoration: InputDecoration(
//                   hintText: context.localization.yourName,
//                 ),
//               ),
//               SizedBox(height: 20.h),
//               Text(
//                 context.localization.emailAddress,
//                 textAlign: TextAlign.left,
//                 style: TextStyle(
//                   fontSize: 14.sp,
//                   color: AppColors.textPrimaryColor,
//                 ),
//               ),
//               SizedBox(height: 8.h),
//               TextFormField(
//                 decoration: InputDecoration(
//                   hintText: context.localization.yourEmail,
//                 ),
//               ),
//               SizedBox(height: 20.h),
//               Text(
//                 context.localization.phoneNumber,
//                 textAlign: TextAlign.left,
//                 style: TextStyle(
//                   fontSize: 14.sp,
//                   color: AppColors.textPrimaryColor,
//                 ),
//               ),
//               SizedBox(height: 8.h),
//               TextFormField(
//                 keyboardType: TextInputType.phone,
//                 decoration: InputDecoration(
//                   hintText: context.localization.phoneNumber,
//                 ),
//               ),
//               SizedBox(height: 20.h),
//               Text(
//                 context.localization.password,
//                 textAlign: TextAlign.left,
//                 style: TextStyle(
//                   fontSize: 14.sp,
//                   color: AppColors.textPrimaryColor,
//                 ),
//               ),
//               SizedBox(height: 8.h),
//               TextFormField(
//                 decoration: InputDecoration(
//                   hintText: context.localization.password,
//                 ),
//               ),
//               SizedBox(height: 20.h),
//               Text(
//                 context.localization.confirmPassword,
//                 textAlign: TextAlign.left,
//                 style: TextStyle(
//                   fontSize: 14.sp,
//                   color: AppColors.textPrimaryColor,
//                 ),
//               ),
//               SizedBox(height: 8.h),
//               TextFormField(
//                 decoration: InputDecoration(
//                   hintText: context.localization.confirmPassword,
//                 ),
//               ),
//
//               SizedBox(height: 24.h),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.pushNamed(context, otpScreen);
//                     // Navigator.pushNamedAndRemoveUntil(
//                     //   context,
//                     //   locationScreen,
//                     //   arguments: {
//                     //     'onSuccess': () => Navigator.pushNamedAndRemoveUntil(
//                     //       navigatorKey.currentContext!,
//                     //       congratulationsScreen,
//                     //       (_) => false,
//                     //     ),
//                     //   },
//                     //   (_) => false,
//                     // );
//                   },
//                   child: Text(context.localization.next),
//                 ),
//               ),
//               SizedBox(height: 24.h),
//               Center(
//                 child: SvgPicture.asset(
//                   SvgAssets.or,
//                   // width: double.infinity,
//                   // height: 24.h,
//                 ),
//               ),
//               SizedBox(height: 24.h),
//               SocialButton(
//                 text: context.localization.continueWithGoogle,
//                 iconPath: SvgAssets.google,
//                 onPressed: () {},
//               ),
//               SizedBox(height: 16.h),
//               SocialButton(
//                 text: context.localization.continueWithFacebook,
//                 iconPath: SvgAssets.facebook,
//                 onPressed: () {},
//               ),
//               SizedBox(height: 24.h),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 spacing: 5.w,
//                 children: [
//                   Text(
//                     context.localization.alreadyHaveAccount,
//                     style: TextStyle(
//                       fontSize: 14.sp,
//                       color: AppColors.darkGreyColor,
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.pushNamed(context, loginScreen);
//                     },
//                     child: Text(
//                       context.localization.login,
//                       style: TextStyle(
//                         fontSize: 14.sp,
//                         fontWeight: FontWeight.w500,
//                         color: AppColors.kPrimaryColor,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20.h),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
