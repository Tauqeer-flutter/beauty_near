import 'package:beauty_near/utils/enums.dart';
import 'package:beauty_near/utils/extensions.dart';
import 'package:beauty_near/view_models/create_booking_view_model.dart';
import 'package:beauty_near/widgets/custom_app_bar.dart';
import 'package:beauty_near/widgets/detailed_service_provider_card.dart';
import 'package:beauty_near/widgets/logo_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_search_bar.dart';

class BarbarList extends StatelessWidget {
  const BarbarList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: context.localization.createBooking),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            CustomSearchBar(),
            SizedBox(height: 20.h),
            _buildServiceFilter(),
            SizedBox(height: 30.h),
            Text(
              context.localization.barbersNearYou,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20.h),

            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 15.h),
                    child: DetailedServiceProviderCard(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceFilter() {
    return Consumer<CreateBookingViewModel>(
      builder: (context, viewModel, child) {
        final selectedService = viewModel.selectedService;
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 10.w,
            children: BarbarServiceType.values.map((serviceType) {
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
}
