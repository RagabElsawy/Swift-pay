import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../res/common/app_button.dart';
import '../../../res/common/app_methods.dart';
import '../../../res/constant/app_routes_path.dart';
import '../../../res/constant/app_strings.dart';
import '../../../res/theme/app_theme.dart';

class SelectSeatPage extends StatefulWidget {
  const SelectSeatPage({super.key});

  @override
  State<SelectSeatPage> createState() => _SelectSeatPageState();
}

class _SelectSeatPageState extends State<SelectSeatPage> {
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
          AppText.selectSeat,
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
                children: [
                  Container(
                    height: 68.h,
                    decoration: CommonMethods.getBoxDecoration(
                      cornerRadius: 16.r,
                      color: AppTheme.getCardColor(context),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 12.h,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: CommonMethods.appTexts(
                                  context,
                                  AppText.oneRonald,
                                  color: AppTheme.getTextColor(context),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              CommonMethods.imagesOfApp(
                                AppImages.icSuccess,
                                width: 20.h,
                                height: 20.h,
                              ),
                            ],
                          ),
                          CommonMethods.sizedBox(height: 2.5.h),
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
                  ),
                  CommonMethods.sizedBox(height: 24.5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          CommonMethods.imagesOfApp(
                            AppImages.seat,
                            width: 24.h,
                            height: 24.h,
                          ),
                          CommonMethods.sizedBox(width: 12.w),
                          CommonMethods.appTexts(
                            context,
                            AppText.available,
                            color: AppTheme.getTextColor(context),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CommonMethods.imagesOfApp(AppImages.seat,
                              width: 24.h,
                              height: 24.h,
                              color: const Color(0xFFACBED8)),
                          CommonMethods.sizedBox(width: 12.w),
                          CommonMethods.appTexts(
                            context,
                            AppText.selected,
                            color: AppTheme.getTextColor(context),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CommonMethods.imagesOfApp(
                            AppImages.seat,
                            width: 24.h,
                            height: 24.h,
                            color: AppTheme.getPrimaryColor(context),
                          ),
                          CommonMethods.sizedBox(width: 12.w),
                          CommonMethods.appTexts(
                            context,
                            AppText.filled,
                            color: AppTheme.getTextColor(context),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ],
                  ),
                  CommonMethods.sizedBox(height: 16.5.h),
                  Container(
                    // height: 544.h,
                    padding: EdgeInsets.all(16.r),
                    decoration: CommonMethods.getBoxDecoration(
                      color: AppTheme.getScaffoldColor(context),
                      cornerRadius: 16.r,
                      shadows: [
                        const BoxShadow(
                            color: Color(0x14000000),
                            offset: Offset(0, 6),
                            blurRadius: 15,
                            spreadRadius: 0),
                      ],
                    ),
                    child: Center(
                      child: CommonMethods.imagesOfApp(
                        AppImages.seats,
                        height: 512.h,
                      ),
                    ),
                  ),
                  CommonMethods.sizedBox(height: 18.h),
                  GestureDetector(
                    onTap: () {
                      CommonMethods.sendToNextScreen(
                          context, RoutesPath.paymentDetailPage);
                    },
                    child: const AppButton(
                      text: AppText.continueBooking,
                    ),
                  ),
                  CommonMethods.sizedBox(height: 5.h),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
