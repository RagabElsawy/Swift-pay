import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:recharge_ticket_booking_and_bill_app/res/theme/controller/theme_controller.dart';

import '../../../../res/common/app_methods.dart';
import '../../../../res/constant/app_routes_path.dart';
import '../../../../res/constant/app_strings.dart';
import '../../../../res/theme/app_theme.dart';
import '../../common/myprofile_common.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (themeController) {
        return Scaffold(
          appBar: CommonMethods.appBar(
              onTap: () {
                CommonMethods.jumpOutFromScreen(context);
              },
              backgroundColor: AppTheme.getScaffoldColor(context),
              title: CommonMethods.appTexts(
                context,
                AppText.myProfile,
                color: AppTheme.getTextColor(context),
                fontSize: 28.sp,
                fontWeight: FontWeight.w700,
              ),
              actions: [
                GetBuilder(
                  builder: (themeController) {
                    return GestureDetector(
                      onTap: () {
                        CommonMethods.sendToNextScreen(
                            context, RoutesPath.editProfilePage);
                      },
                      child: Padding(
                        padding: EdgeInsets.all(14.h),
                        child: CommonMethods.imagesOfApp(
                          AppImages.edit,
                          width: 24.h,
                          height: 24.h,
                          color: themeController.isDarkMode.value
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    );
                  },
                  init: ThemeController(),
                ),
              ]),
          body: SafeArea(
            child: Column(
              children: [
                Divider(
                  color: AppTheme.getDividerColor(context),
                ),
                CommonMethods.sizedBox(height: 10.h),
                Center(
                  child: Container(
                    height: 104.h,
                    width: 104.h,
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        CommonMethods.imagesOfApp(
                          AppImages.blankProfile,
                          height: 104.h,
                          width: 104.h,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            height: 34.h,
                            width: 34.h,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x40000000),
                                    spreadRadius: 0,
                                    blurRadius: 4,
                                    offset: Offset(0, 4),
                                  )
                                ]),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(6.h),
                                child: CommonMethods.imagesOfApp(
                                  AppImages.camera,
                                  // color: AppTheme.getTextColor(context),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                CommonMethods.sizedBox(height: 34.h),
                Padding(
                  padding: CommonMethods.appPadding(),
                  child: Column(
                    children: [
                      const MyProfileCommon(
                        title: AppText.name,
                        info: AppText.johnAbram,
                      ),
                      CommonMethods.sizedBox(height: 16.h),
                      const MyProfileCommon(
                        title: AppText.email,
                        info: AppText.johnMail,
                      ),
                      CommonMethods.sizedBox(height: 16.h),
                      const MyProfileCommon(
                        title: AppText.phone,
                        info: AppText.phoneNum,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
      init: ThemeController(),
    );
  }
}
