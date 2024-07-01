import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:recharge_ticket_booking_and_bill_app/view/home/controller/home_controller.dart';

import '../../../res/common/app_methods.dart';
import '../../../res/constant/app_strings.dart';
import '../../../res/theme/app_theme.dart';
import '../model/offer_model.dart';

class OffersList extends StatelessWidget {
  const OffersList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (homeController) {
        return Column(
          children: [
            CommonMethods.sizedBox(height: 16.h),
            CarouselSlider.builder(
              carouselController: homeController.carouselController,
              itemCount: homeController.list.length,
              itemBuilder: (context, index, realIndex) {
                OfferModel data = homeController.list[index];
                return Padding(
                  padding: EdgeInsets.only(
                      left: index == 0 ? 16 : 8,
                      right: index == homeController.list.length - 1 ? 16 : 8),
                  child: Container(
                    // height: 150.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        image: DecorationImage(
                            image: AssetImage(data.image!), fit: BoxFit.fill)),
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: 15.h, bottom: 27.h, left: 24.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonMethods.appTexts(
                            context,
                            homeController.list[index].title!,
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          Container(
                            height: 34.h,
                            width: 122.w,
                            decoration: CommonMethods.getBoxDecoration(
                              cornerRadius: 18.r,
                              color: Colors.white,
                            ),
                            child: Center(
                              child: CommonMethods.appTexts(
                                context,
                                AppText.bookNow,
                                color: Colors.black,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                height: 150.h,
                viewportFraction: 0.85,
                padEnds: false,
                enableInfiniteScroll: false,
                autoPlay: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 500),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  homeController.i.value = index;
                  homeController.update();
                },
              ),
            ),

            // CarouselSlider(
            //   items: List.generate(
            //     3,
            //     (index) => Stack(
            //       children: [
            //         CommonMethods.imagesOfApp(homeController.list[index].image!),
            //         Padding(
            //           padding: EdgeInsets.only(left: 24.w, top: 16.h),
            //           child: Column(
            //             mainAxisSize: MainAxisSize.min,
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               CommonMethods.appTexts(
            //                 context,
            //                 homeController.list[index].title!,
            //                 color: Colors.white,
            //                 fontSize: 20.sp,
            //                 fontWeight: FontWeight.w700,
            //               ),
            //               CommonMethods.sizedBox(height: 26.h),
            //               Container(
            //                 height: 34.h,
            //                 width: 122.w,
            //                 decoration: CommonMethods.getBoxDecoration(
            //                   cornerRadius: 18.r,
            //                   color: Colors.white,
            //                 ),
            //                 child: Center(
            //                   child: CommonMethods.appTexts(
            //                     context,
            //                     AppText.bookNow,
            //                     color: Colors.black,
            //                     fontSize: 15.sp,
            //                     fontWeight: FontWeight.w700,
            //                   ),
            //                 ),
            //               )
            //             ],
            //           ),
            //         )
            //       ],
            //     ),
            //   ),
            //   carouselController: homeController.carouselController,
            //   options: CarouselOptions(
            //     height: 150,
            //     viewportFraction: 0.85,
            //     aspectRatio: 1.5,
            //     padEnds: false,
            //     enableInfiniteScroll: false,
            //     autoPlay: true,
            //     autoPlayAnimationDuration: const Duration(milliseconds: 500),
            //     autoPlayCurve: Curves.fastOutSlowIn,
            //     scrollDirection: Axis.horizontal,
            //     onPageChanged: (index, reason) {
            //       homeController.i.value = index;
            //       homeController.update();
            //     },
            //   ),
            // ),
            CommonMethods.sizedBox(height: 15.h),
            Obx(() {
              return Center(
                child: DotsIndicator(
                  dotsCount: 3,
                  position: homeController.i.value,
                  decorator: DotsDecorator(
                    color: const Color(0xFFA7AEC1),
                    activeColor: AppTheme.getPrimaryColor(context),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    size: Size(8.w, 8.h),
                    activeSize: Size(21.33.w, 8.h),
                    spacing: EdgeInsets.only(right: 5.w),
                  ),
                ),
              );
            }),
          ],
        );
      },
      init: HomeController(),
    );
  }
}
