import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../res/common/app_methods.dart';
import '../../../res/constant/app_routes_path.dart';
import '../../../res/constant/app_strings.dart';
import '../../../res/theme/app_theme.dart';
import '../common/baggage_detail_common.dart';

class FlightDetailPage extends StatefulWidget {
  const FlightDetailPage({super.key});

  @override
  State<FlightDetailPage> createState() => _FlightDetailPageState();
}

class _FlightDetailPageState extends State<FlightDetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonMethods.appBar(
        onTap: () {
          CommonMethods.jumpOutFromScreen(context);
        },
        backgroundColor: AppTheme.getScaffoldColor(context),
        title: CommonMethods.appTexts(
          context,
          AppText.flightDetail,
          color: AppTheme.getTextColor(context),
          fontSize: 28.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Divider(
              color: AppTheme.getDividerColor(context),
            ),
            CommonMethods.sizedBox(height: 15.h),
            Padding(
              padding: CommonMethods.appPadding(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonMethods.appTexts(
                    context,
                    AppText.flightDetail,
                    color: AppTheme.getTextColor(context),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  CommonMethods.sizedBox(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonMethods.appTexts(
                            context,
                            AppText.nYC,
                            color: AppTheme.getTextColor(context),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          CommonMethods.sizedBox(height: 8.h),
                          CommonMethods.appTexts(
                            context,
                            AppText.newyork,
                            color: AppTheme.getTextColor(context),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CommonMethods.imagesOfApp(
                            AppImages.duration,
                            width: 200.w,
                            height: 20.h,
                          ),
                          CommonMethods.sizedBox(height: 5.h),
                          CommonMethods.appTexts(
                            context,
                            AppText.duration,
                            color: AppTheme.getPrimaryColor(context),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CommonMethods.appTexts(
                            context,
                            AppText.ind,
                            color: AppTheme.getTextColor(context),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          CommonMethods.sizedBox(height: 8.h),
                          CommonMethods.appTexts(
                            context,
                            AppText.mumbai,
                            color: AppTheme.getTextColor(context),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ],
                  ),
                  CommonMethods.sizedBox(height: 24.h),
                  CommonMethods.appTexts(
                    context,
                    AppText.baggage,
                    color: AppTheme.getTextColor(context),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  CommonMethods.sizedBox(height: 14.h),
                  const BaggageDetailCommon(
                    title: AppText.saver,
                    des: AppText.saverDes,
                    price: AppText.saverPrice,
                  ),
                  const BaggageDetailCommon(
                    title: AppText.flexi,
                    des: AppText.flexiDes,
                    price: AppText.flexiPrice,
                  ),
                  CommonMethods.sizedBox(height: 20.h),
                  Container(
                    width: double.infinity,
                    height: 255.h,
                    decoration: CommonMethods.getBoxDecoration(
                      cornerRadius: 12.r,
                      color: AppTheme.getCardColor(context),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.0.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonMethods.appTexts(
                            context,
                            AppText.change,
                            color: AppTheme.getTextColor(context),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          CommonMethods.sizedBox(height: 16.h),
                          CommonMethods.appTexts(
                            context,
                            AppText.changeDes,
                            color: AppTheme.getTextColor(context),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          CommonMethods.sizedBox(height: 16.h),
                          CommonMethods.appTexts(
                            context,
                            AppText.fare,
                            color: AppTheme.getTextColor(context),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          CommonMethods.sizedBox(height: 16.h),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CommonMethods.appTexts(
                                      context,
                                      AppText.adultTwo,
                                      color: AppTheme.getTextColor(context),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    CommonMethods.sizedBox(height: 16.h),
                                    CommonMethods.appTexts(
                                      context,
                                      AppText.airport,
                                      color: AppTheme.getTextColor(context),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    CommonMethods.sizedBox(height: 18.h),
                                    CommonMethods.appTexts(
                                      context,
                                      AppText.gst,
                                      color: AppTheme.getTextColor(context),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  CommonMethods.appTexts(
                                    context,
                                    AppText.adultTwoCharge,
                                    color: AppTheme.getTextColor(context),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  CommonMethods.sizedBox(height: 16.h),
                                  CommonMethods.appTexts(
                                    context,
                                    AppText.airportCharge,
                                    color: AppTheme.getTextColor(context),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  CommonMethods.sizedBox(height: 18.h),
                                  CommonMethods.appTexts(
                                    context,
                                    AppText.gstCharge,
                                    color: AppTheme.getTextColor(context),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  CommonMethods.sizedBox(height: 30.h),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonMethods.appTexts(
                              context,
                              AppText.totalFare,
                              color: const Color(0xFF808080),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            CommonMethods.sizedBox(height: 8.h),
                            CommonMethods.appTexts(
                              context,
                              AppText.totalFarePrice,
                              color: AppTheme.getTextColor(context),
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          CommonMethods.sendToNextScreen(context, RoutesPath.flightSelectSeatPage);
                        },
                        child: Container(
                          height: 54.h,
                          width: 190.w,
                          decoration: CommonMethods.getBoxDecoration(
                            cornerRadius: 30.r,
                            color: AppTheme.getPrimaryColor(context),
                          ),
                          child: Center(
                            child: CommonMethods.appTexts(
                              context,
                              AppText.continueBooking,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 18.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
