import 'package:beauty_near/utils/enums.dart';
import 'package:beauty_near/utils/extensions.dart';
import 'package:beauty_near/widgets/logo_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../utils/assets.dart';
import '../utils/color_constant.dart';
import '../view_models/bot_nav_view_model.dart';
import '../view_models/home_view_model.dart';
import '../widgets/detailed_service_provider_card.dart';
import '../widgets/home_carousel_widget.dart';
import '../widgets/link_text.dart';
import '../widgets/service_provider_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: _buildBody(context),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      forceMaterialTransparency: true,
      elevation: 0,
      automaticallyImplyLeading: false,
      toolbarHeight: 80.h,
      leadingWidth: 70.w,
      leading: Padding(
        padding: EdgeInsets.only(left: 20.w),
        child: Center(child: ClipOval(child: Image.asset(PngAssets.person))),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Hello Kelly',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              color: AppColors.textPrimaryColor,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Good Morning!',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18.sp,
              color: AppColors.textPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 27.h),
          _buildSearchBar(context),
          SizedBox(height: 30.h),
          HomeCarouselWidget(),
          SizedBox(height: 30.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Top Rated Barbers',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
              LinkText(text: 'See All'),
            ],
          ),
          SizedBox(height: 15.h),
          Container(
            color: Colors.yellow,
            height: 212.h,
            child: PageView.builder(
              controller: context.read<HomeViewModel>().pageController,
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) => SizedBox(
                width: MediaQuery.sizeOf(context).width - 40.w,
                child: Row(
                  children: [
                    Expanded(child: ServiceProviderCard()),
                    SizedBox(width: 12.w),
                    if (index != 2) ...{
                      Expanded(child: ServiceProviderCard()),
                      SizedBox(width: 12.w),
                    } else
                      Spacer(),
                  ],
                ),
              ),
            ),
          ),
          // SizedBox(height: 15.h),
          // ListenableBuilder(
          //   listenable: context.read<HomeViewModel>().pageController,
          //   builder: (context, child) {
          //     final current =
          //         context.read<HomeViewModel>().pageController.page ?? 0;
          //     return PageDotIndicator(
          //       length: (5 / 2).ceil(),
          //       current: current.round(),
          //       onDotTap: (index) {},
          //     );
          //   },
          // ),
          SizedBox(height: 30.h),
          Text(
            'Barber you need',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
          ),
          SizedBox(height: 15.h),
          _buildServiceFilter(),
          SizedBox(height: 20.h),
          for (int i = 0; i < 4; i++)
            Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: DetailedServiceProviderCard(),
            ),
          SizedBox(height: context.notchAwareBottomPadding),
        ],
      ),
    );
  }

  Widget _buildServiceFilter() {
    return Consumer<HomeViewModel>(
      builder: (context, viewModel, child) {
        final selectedService = viewModel.selectedService;
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 10.w,
            children: ServiceType.values.map((serviceType) {
              return LogoButton(
                asset: serviceType.asset,
                label: serviceType.label,
                onTap: () => viewModel.setSelectedService(serviceType),
                enabled: selectedService == serviceType,
              );
            }).toList(),
          ),
        );
      },
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return TextFormField(
      focusNode: Provider.of<BotNavViewModel>(context).focusNode,
      decoration: InputDecoration(
        prefixIcon: Icon(Iconsax.search_normal),
        hintText: 'Search',
        hintStyle: TextStyle(color: AppColors.iconColor, fontSize: 16.sp),
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 24.h,
              width: 2.w,
              child: VerticalDivider(
                thickness: 1.w,
                color: AppColors.iconColor,
              ),
            ),
            IconButton(onPressed: () {}, icon: Icon(Iconsax.sort)),
            SizedBox(width: 5.w),
          ],
        ),
      ),
    );
  }
}
