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
    return Scaffold(appBar: _buildAppBar(), body: _buildBody(context));
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
          _buildSectionHeading(
            title: 'Top Rated Barbers',
            link: 'See All',
            onLinkTap: () {},
          ),
          SizedBox(height: 15.h),
          SizedBox(
            height: 217.h,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) => Center(
                child: Padding(
                  padding: EdgeInsets.only(right: 12.w),
                  child: SizedBox(width: 168.w, child: ServiceProviderCard()),
                ),
              ),
            ),
          ),
          SizedBox(height: 25.h),
          _buildSectionHeading(title: 'Barber you need'),
          SizedBox(height: 15.h),
          _buildServiceFilter(),
          SizedBox(height: 20.h),
          for (int i = 0; i < 4; i++)
            Padding(
              padding: EdgeInsets.only(bottom: 12.h, left: 20.w, right: 20.w),
              child: DetailedServiceProviderCard(),
            ),
          SizedBox(height: context.notchAwareBottomPadding),
        ],
      ),
    );
  }

  Padding _buildSectionHeading({
    required String title,
    String? link,
    VoidCallback? onLinkTap,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
          ),
          if (link != null)
            GestureDetector(
              onTap: onLinkTap,
              child: LinkText(text: link),
            ),
        ],
      ),
    );
  }

  Widget _buildServiceFilter() {
    return Consumer<HomeViewModel>(
      builder: (context, viewModel, child) {
        final selectedService = viewModel.selectedService;
        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: TextFormField(
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
      ),
    );
  }
}
