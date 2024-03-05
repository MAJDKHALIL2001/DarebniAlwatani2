import 'package:carousel_slider/carousel_slider.dart';
import 'package:darrebni_exam/ui/shared/colors.dart';
import 'package:darrebni_exam/ui/shared/utils.dart';
import 'package:flutter/material.dart';

class CustomCarous extends StatelessWidget {
  final double? height;
  final double? width;
  final void Function(int, CarouselPageChangedReason)? onPageChanged;
  final List<String> images;
  CustomCarous(
      {super.key,
      required this.images,
      this.height,
      this.width,
      this.onPageChanged});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: height,

        aspectRatio: 16 / 9,
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        // autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        // autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        onPageChanged: onPageChanged,

        scrollDirection: Axis.horizontal,
      ),
      items: images
          .map((item) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.blueColor,
              ),
              width: width,
              child: Center(
                child: Image.asset(
                  "assets/images/pngs/${item}.png",
                  fit: BoxFit.fill,
                  width: double.infinity,
                ),
              )))
          .toList(),
    );
  }
}
