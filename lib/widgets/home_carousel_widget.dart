import 'package:beauty_near/widgets/page_dot_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/assets.dart';

class HomeCarouselWidget extends StatefulWidget {
  const HomeCarouselWidget({super.key});

  @override
  State<HomeCarouselWidget> createState() => _HomeCarouselWidgetState();
}

class _HomeCarouselWidgetState extends State<HomeCarouselWidget> {
  int _current = 0;
  final int _carouselItems = 4;
  final CarouselSliderController _controller = CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CarouselSlider(
          items: List.generate(
            _carouselItems,
            (_) => _buildCarouselItem(context),
          ),
          carouselController: _controller,
          disableGesture: true,
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 1,

            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        SizedBox(height: 5.h),
        PageDotIndicator(
          length: _carouselItems,
          current: _current,
          onDotTap: (index) => _controller.animateToPage(index),
        ),
      ],
    );
  }

  Widget _buildCarouselItem(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width - 45.w,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        image: DecorationImage(
          image: AssetImage(PngAssets.carouselBackground),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
