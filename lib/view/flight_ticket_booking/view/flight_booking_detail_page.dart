import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../res/common/app_button.dart';
import '../../../res/common/app_methods.dart';
import '../../../res/constant/app_routes_path.dart';
import '../../../res/constant/app_strings.dart';
import '../../../res/theme/app_theme.dart';
import '../controller/flight_ticket_controller.dart';

class FlightBookingDetailPage extends StatefulWidget {
  const FlightBookingDetailPage({super.key});

  @override
  State<FlightBookingDetailPage> createState() =>
      _FlightBookingDetailPageState();
}

class _FlightBookingDetailPageState extends State<FlightBookingDetailPage> {
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
          AppText.bookingDetails,
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
            Padding(
              padding: CommonMethods.appPadding(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonMethods.appTexts(
                    context,
                    AppText.passenger,
                    color: AppTheme.getTextColor(context),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  CommonMethods.sizedBox(height: 16.h),
                  Container(
                    height: 78.h,
                    decoration: CommonMethods.getBoxDecoration(
                      cornerRadius: 8.r,
                      color: AppTheme.getCardColor(context),
                    ),
                    child: Padding(
                      padding: CommonMethods.appPadding(),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonMethods.appTexts(
                                  context,
                                  AppText.cameronWilliamson,
                                  color: AppTheme.getTextColor(context),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                CommonMethods.sizedBox(height: 8.h),
                                Row(
                                  children: [
                                    CommonMethods.appTexts(
                                      context,
                                      AppText.economy,
                                      color: const Color(0xFF808080),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    CommonMethods.sizedBox(width: 12.w),
                                    Container(
                                      height: 4.h,
                                      width: 4.h,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFF808080),
                                      ),
                                    ),
                                    CommonMethods.sizedBox(width: 12.w),
                                    CommonMethods.appTexts(
                                      context,
                                      AppText.eightD,
                                      color: const Color(0xFF808080),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          GetBuilder<FlightTicketController>(
                              builder: (flightTicketController) {
                                return GestureDetector(
                                  onTap: () {
                                    flightTicketController.setNavigation(true);
                                    CommonMethods.sendToNextScreen(context,
                                        RoutesPath.flightSelectSeatPage);
                                  },
                                  child: Container(
                                    height: 28.h,
                                    width: 82.w,
                                    decoration: CommonMethods.getBoxDecoration(
                                      color: Colors.white,
                                      cornerRadius: 8.r,
                                    ),
                                    child: Center(
                                      child: CommonMethods.appTexts(
                                        context,
                                        AppText.changeSeat,
                                        color:
                                            AppTheme.getPrimaryColor(context),
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              init: FlightTicketController()),
                        ],
                      ),
                    ),
                  ),
                  CommonMethods.sizedBox(height: 20.h),
                  CommonMethods.appTexts(
                    context,
                    AppText.yourTrip,
                    color: AppTheme.getTextColor(context),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  CommonMethods.sizedBox(height: 19.h),
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
                  CommonMethods.sizedBox(height: 28.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonMethods.appTexts(
                              context,
                              AppText.dateAndTime,
                              color: AppTheme.getHintTextColor(context),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            CommonMethods.sizedBox(height: 8.h),
                            CommonMethods.appTexts(
                              context,
                              AppText.dateTime,
                              color: AppTheme.getTextColor(context),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            CommonMethods.sizedBox(height: 16.h),
                            CommonMethods.appTexts(
                              context,
                              AppText.passenger,
                              color: AppTheme.getHintTextColor(context),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            CommonMethods.sizedBox(height: 8.h),
                            CommonMethods.appTexts(
                              context,
                              AppText.oneAdult,
                              color: AppTheme.getTextColor(context),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            CommonMethods.sizedBox(height: 16.h),
                            CommonMethods.appTexts(
                              context,
                              AppText.gateNum,
                              color: AppTheme.getHintTextColor(context),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            CommonMethods.sizedBox(height: 8.h),
                            CommonMethods.appTexts(
                              context,
                              AppText.gateDTwo,
                              color: AppTheme.getTextColor(context),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            CommonMethods.sizedBox(height: 16.h),
                            CommonMethods.appTexts(
                              context,
                              AppText.baggageDetail,
                              color: AppTheme.getHintTextColor(context),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            CommonMethods.sizedBox(height: 8.h),
                            CommonMethods.appTexts(
                              context,
                              AppText.baggageWight,
                              color: AppTheme.getTextColor(context),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            CommonMethods.sizedBox(height: 16.h),
                            CommonMethods.appTexts(
                              context,
                              AppText.flightClass,
                              color: AppTheme.getHintTextColor(context),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            CommonMethods.sizedBox(height: 8.h),
                            CommonMethods.appTexts(
                              context,
                              AppText.economy,
                              color: AppTheme.getTextColor(context),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonMethods.appTexts(
                            context,
                            AppText.arrivalTime,
                            color: AppTheme.getHintTextColor(context),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          CommonMethods.sizedBox(height: 8.h),
                          CommonMethods.appTexts(
                            context,
                            AppText.arrivalDate,
                            color: AppTheme.getTextColor(context),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          CommonMethods.sizedBox(height: 16.h),
                          CommonMethods.appTexts(
                            context,
                            AppText.arrivalTime,
                            color: AppTheme.getHintTextColor(context),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          CommonMethods.sizedBox(height: 8.h),
                          CommonMethods.appTexts(
                            context,
                            AppText.arrivalDate,
                            color: AppTheme.getTextColor(context),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          CommonMethods.sizedBox(height: 16.h),
                          CommonMethods.appTexts(
                            context,
                            AppText.terminal,
                            color: AppTheme.getHintTextColor(context),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          CommonMethods.sizedBox(height: 8.h),
                          CommonMethods.appTexts(
                            context,
                            AppText.terminalNum,
                            color: AppTheme.getTextColor(context),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          CommonMethods.sizedBox(height: 16.h),
                          CommonMethods.appTexts(
                            context,
                            AppText.flightNum,
                            color: AppTheme.getHintTextColor(context),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          CommonMethods.sizedBox(height: 8.h),
                          CommonMethods.appTexts(
                            context,
                            AppText.flightNumber,
                            color: AppTheme.getTextColor(context),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ],
                  ),
                  CommonMethods.sizedBox(height: 16.h),
                  CommonMethods.appTexts(
                    context,
                    AppText.paymentDetails,
                    color: AppTheme.getTextColor(context),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  CommonMethods.sizedBox(height: 16.h),
                  Container(
                    height: 76.h,
                    decoration: CommonMethods.getBoxDecoration(
                      cornerRadius: 16.r,
                      color: AppTheme.getCardColor(context),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 26.w),
                      child: Row(
                        children: [
                          Container(
                            width: 36.h,
                            height: 36.h,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Center(
                              child: CommonMethods.imagesOfApp(
                                AppImages.visa,
                                height: 24.h,
                                width: 24.h,
                              ),
                            ),
                          ),
                          CommonMethods.sizedBox(width: 12.w),
                          CommonMethods.appTexts(
                            context,
                            AppText.visa,
                            color: AppTheme.getTextColor(context),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ],
                      ),
                    ),
                  ),
                  CommonMethods.sizedBox(height: 30.h),
                  GestureDetector(
                    onTap: () {
                      CommonMethods.sendToNextScreen(
                          context, RoutesPath.paymentSuccessPage);
                    },
                    child: const AppButton(
                      text: AppText.continueBooking,
                    ),
                  ),
                  CommonMethods.sizedBox(height: 20.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
