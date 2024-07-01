import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../res/common/app_button.dart';
import '../../../res/common/app_methods.dart';
import '../../../res/constant/app_routes_path.dart';
import '../../../res/constant/app_strings.dart';
import '../../../res/theme/app_theme.dart';

class RecieptPage extends StatefulWidget {
  const RecieptPage({super.key});

  @override
  State<RecieptPage> createState() => _RecieptPageState();
}

class _RecieptPageState extends State<RecieptPage> {
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
            CommonMethods.sizedBox(height: 24.h),
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
                          Container(
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
                                color: AppTheme.getPrimaryColor(context),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  CommonMethods.sizedBox(height: 20.h),
                  CommonMethods.appTexts(
                    context,
                    AppText.movieTicketDetails,
                    color: AppTheme.getTextColor(context),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  CommonMethods.sizedBox(height: 20.h),
                  Row(
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
                              AppText.cinema,
                              color: AppTheme.getHintTextColor(context),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            CommonMethods.sizedBox(height: 8.h),
                            CommonMethods.appTexts(
                              context,
                              AppText.pullmanCinemax,
                              color: AppTheme.getTextColor(context),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            CommonMethods.sizedBox(height: 16.h),
                            CommonMethods.appTexts(
                              context,
                              AppText.iD,
                              color: AppTheme.getHintTextColor(context),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            CommonMethods.sizedBox(height: 8.h),
                            CommonMethods.appTexts(
                              context,
                              AppText.iDNum,
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
                            AppText.movieTime,
                            color: AppTheme.getHintTextColor(context),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          CommonMethods.sizedBox(height: 8.h),
                          CommonMethods.appTexts(
                            context,
                            AppText.mTime,
                            color: AppTheme.getTextColor(context),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          CommonMethods.sizedBox(height: 16.h),
                          CommonMethods.appTexts(
                            context,
                            AppText.spot,
                            color: AppTheme.getHintTextColor(context),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          CommonMethods.sizedBox(height: 8.h),
                          CommonMethods.appTexts(
                            context,
                            AppText.spotNum,
                            color: AppTheme.getTextColor(context),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          CommonMethods.sizedBox(height: 16.h),
                          CommonMethods.appTexts(
                            context,
                            AppText.phone,
                            color: AppTheme.getHintTextColor(context),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          CommonMethods.sizedBox(height: 8.h),
                          CommonMethods.appTexts(
                            context,
                            AppText.phoneNum,
                            color: AppTheme.getTextColor(context),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ],
                  ),
                  CommonMethods.sizedBox(height: 20.h),
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
                  CommonMethods.sizedBox(height: 200.h),
                  GestureDetector(
                    onTap: () {
                      CommonMethods.sendToNextScreen(
                          context, RoutesPath.bookingSuccessPage);
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
