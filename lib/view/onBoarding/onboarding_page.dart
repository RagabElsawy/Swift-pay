import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:recharge_ticket_booking_and_bill_app/res/theme/controller/theme_controller.dart';
import '../../data/app_data.dart';
import '../../data/pref_data.dart';
import '../../res/common/app_button.dart';
import '../../res/common/app_methods.dart';
import '../../res/constant/app_routes_path.dart';
import '../../res/constant/app_strings.dart';
import '../../res/theme/app_theme.dart';
import 'controller/onboarding_controller.dart';
import 'model/onboarding_model.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  OnBoardingController onBoardingController = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (themeController) {
        return Scaffold(
          appBar: CommonMethods.nullAppBar(
            context,
            statusBarColor: Colors.transparent,
            statusBarBrightness: themeController.isDarkMode.value
                ? Brightness.light
                : Brightness.dark,
            statusBarIconBrightness: themeController.isDarkMode.value
                ? Brightness.light
                : Brightness.dark,
          ),
          body: GetBuilder(
            builder: (onBoardingController) {
              return Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: onBoardingController.controller,
                      onPageChanged: (value) {
                        onBoardingController.changeIndex(value);
                      },
                      itemCount: onBoardingData.length,
                      itemBuilder: (BuildContext context, int index) {
                        OnBoardModel data =  onBoardingData[index];
                        return Column(
                          children: [
                            Expanded(
                              child: CommonMethods.imagesOfApp(
                                data.image!,
                                fit: BoxFit.fill,
                                width: double.infinity,
                              ),
                            ),
                            CommonMethods.sizedBox(height: 78.h),
                            CommonMethods.appTexts(
                              context,
                              data.onboardTag!,
                              textAlign: TextAlign.center,
                              color: AppTheme.getTextColor(context),
                              fontSize: 28.sp,
                              fontWeight: FontWeight.w700,
                            ),
                            CommonMethods.sizedBox(height: 16.h),
                            CommonMethods.appTexts(
                              context,
                              AppText.obDes,
                              textAlign: TextAlign.center,
                              color: AppTheme.getTextColor(context),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  CommonMethods.sizedBox(height: 24.h),
                  Obx(
                        () {
                      return DotsIndicator(
                        dotsCount: 3,
                        position: onBoardingController.pageIndex.value,
                        decorator: DotsDecorator(
                          color: const Color(0xFFDBE5F2),
                          activeColor: AppTheme.getPrimaryColor(context),
                          size: Size(8.h, 8.h),
                          activeSize: Size(8.h, 8.h),
                          spacing: EdgeInsets.only(right: 8.w),
                        ),
                      );
                    },
                  ),
                  // ignore: unrelated_type_equality_checks
                  CommonMethods.sizedBox(height: onBoardingController.pageIndex  == onBoardingData.length-1?57.h: 38.h),
                  Padding(
                    padding: CommonMethods.appPadding(),
                    child: GestureDetector(
                      onTap: () {
                        if (onBoardingController.pageIndex.value <
                            (onBoardingData.length - 1)) {
                          onBoardingController.controller.jumpToPage(
                              ++onBoardingController.pageIndex.value);
                        } else {
                          PrefData.setIntro(false);
                          CommonMethods.sendToNextScreen(
                              context, RoutesPath.loginPage);
                        }
                      },
                      child: AppButton(
                        text: onBoardingController.pageIndex.value <
                            (onBoardingData.length - 1)
                            ? AppText.next
                            : AppText.getStart,
                      ),
                    ),
                  ),
                  CommonMethods.sizedBox(height: 20.h),
                  onBoardingController.pageIndex.value <
                      (onBoardingData.length - 1)
                      ? GestureDetector(
                    onTap: () {
                      PrefData.setIntro(false);
                      CommonMethods.sendToNextScreen(
                          context, RoutesPath.loginPage);
                    },
                    child: CommonMethods.appTexts(
                      context,
                      AppText.skip,
                      color: AppTheme.getTextColor(context),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                      : const SizedBox(),
                  CommonMethods.sizedBox(height: 40.h),
                ],
              );
            },
            init: OnBoardingController(),
          ),
        );
      },
      init: ThemeController(),
    );
  }
}
