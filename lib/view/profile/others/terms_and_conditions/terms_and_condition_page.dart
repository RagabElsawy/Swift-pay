import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:recharge_ticket_booking_and_bill_app/res/theme/controller/theme_controller.dart';

import '../../../../res/common/app_methods.dart';
import '../../../../res/constant/app_strings.dart';
import '../../../../res/theme/app_theme.dart';

class TermsAndConditionPage extends StatefulWidget {
  const TermsAndConditionPage({super.key});

  @override
  State<TermsAndConditionPage> createState() => _TermsAndConditionPageState();
}

class _TermsAndConditionPageState extends State<TermsAndConditionPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (themeController) {
        return Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () {
                CommonMethods.jumpOutFromScreen(context);
              },
              child: Padding(
                padding: EdgeInsets.only(left: 16.h, top: 17.h, bottom: 20.h),
                child: CommonMethods.imagesOfApp(
                  AppImages.arrowBack,
                  width: 24.h,
                  height: 24.h,
                  color: themeController.isDarkMode.value
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
            backgroundColor: AppTheme.getScaffoldColor(context),
            title: CommonMethods.appTexts(
              context,
              AppText.termsAndConditions,
              color: AppTheme.getTextColor(context),
              fontSize: 28.sp,
              fontWeight: FontWeight.w700,
            ),
            centerTitle: true,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: AppTheme.getScaffoldColor(context),
              statusBarBrightness: themeController.isDarkMode.value
                  ? Brightness.light
                  : Brightness.dark,
              statusBarIconBrightness: themeController.isDarkMode.value
                  ? Brightness.light
                  : Brightness.dark,
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: CommonMethods.appPadding(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonMethods.sizedBox(height: 16.h),
                  CommonMethods.appTexts(
                    context,
                    AppText.queOne,
                    color: AppTheme.getTextColor(context),
                    fontSize: 18.sp,
                    height: 1.5,
                    fontWeight: FontWeight.w700,
                  ),
                  CommonMethods.sizedBox(height: 8.h),
                  Container(
                    child: CommonMethods.appTexts(
                      context,
                      AppText.ansOne,
                      style: TextStyle(
                    wordSpacing: 2.8,
                    color: AppTheme.getTextColor(context),
                    fontSize: 16.sp,
                    height: 1.2,
                    fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  CommonMethods.sizedBox(height: 16.h),
                  CommonMethods.appTexts(
                    context,
                    AppText.queTwo,
                    color: AppTheme.getTextColor(context),
                    fontSize: 18.sp,
                    height: 1.5,
                    fontWeight: FontWeight.w700,
                  ),
                  CommonMethods.sizedBox(height: 8.h),
                 Container(
                   child:  CommonMethods.appTexts(
                     context,
                     AppText.ansTwo,
                     style: TextStyle(
                       wordSpacing: 2.8,
                       color: AppTheme.getTextColor(context),
                       fontSize: 16.sp,
                       height: 1.2,
                       fontWeight: FontWeight.w400,
                     ),
                   ),
                 ),
                  CommonMethods.sizedBox(height: 16.h),
                  CommonMethods.appTexts(
                    context,
                    AppText.queThree,
                    color: AppTheme.getTextColor(context),
                    fontSize: 18.sp,
                    height: 1.5,
                    fontWeight: FontWeight.w700,
                  ),
                  CommonMethods.sizedBox(height: 8.h),
                  Container(
                    child: CommonMethods.appTexts(
                      context,
                      AppText.ansThree,
                      style: TextStyle(
                        wordSpacing: 2.8,
                        color: AppTheme.getTextColor(context),
                        fontSize: 16.sp,
                        height: 1.2,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      init: ThemeController(),
    );
  }
}
