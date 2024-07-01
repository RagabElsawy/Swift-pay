import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../res/common/app_methods.dart';
import '../../../res/constant/app_routes_path.dart';
import '../../../res/constant/app_strings.dart';
import '../../../res/theme/app_theme.dart';
import '../../../res/theme/controller/theme_controller.dart';
import '../common/profile_common.dart';
import '../others/logout/logout_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (themeController) {
        return Scaffold(
          appBar: AppBar(
            leading: const SizedBox(),
            backgroundColor: AppTheme.getScaffoldColor(context),
            title: CommonMethods.appTexts(
              context,
              AppText.profile,
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
            child: Column(
              children: [
                Divider(
                  color: AppTheme.getDividerColor(context),
                ),
                CommonMethods.sizedBox(height: 10.h),
                Padding(
                  padding: CommonMethods.appPadding(),
                  child: Column(
                    children: [
                      CommonMethods.imagesOfApp(
                        AppImages.blankProfile,
                        width: 140.h,
                        height: 104.h,
                      ),
                      CommonMethods.sizedBox(height: 8.h),
                      CommonMethods.appTexts(
                        context,
                        AppText.johnAbram,
                        color: AppTheme.getTextColor(context),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      CommonMethods.appTexts(
                        context,
                        AppText.johnMail,
                        color: AppTheme.getTextColor(context),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      CommonMethods.sizedBox(height: 24.h),
                       ProfileCommon(
                        title: AppText.personalInfo,
                        image: AppImages.unselectUser,
                        onTap: () {
                          CommonMethods.sendToNextScreen(context, RoutesPath.myProfilePage);
                        },
                      ),
                      CommonMethods.sizedBox(height: 16.h),
                       ProfileCommon(
                        title: AppText.addCard,
                        image: AppImages.card,
                        onTap: () {
                          CommonMethods.sendToNextScreen(context, RoutesPath.myCardsPage);
                        },
                      ),
                      CommonMethods.sizedBox(height: 16.h),
                       ProfileCommon(
                        title: AppText.termsAndConditions,
                        image: AppImages.security,
                        onTap: () {
                          CommonMethods.sendToNextScreen(context, RoutesPath.termsAndConditionPage);
                        },
                      ),
                      CommonMethods.sizedBox(height: 16.h),
                       ProfileCommon(
                        title: AppText.help,
                        image: AppImages.help,
                        onTap: () {
                          CommonMethods.sendToNextScreen(context, RoutesPath.helpPage);
                        },
                      ),
                      CommonMethods.sizedBox(height: 16.h),
                       ProfileCommon(
                        title: AppText.logout,
                        image: AppImages.loggingOut,
                        onTap: () {
                          showDialog(

                            context: context,
                            builder: (BuildContext context) {
                              return const LogoutPage();
                            },
                          );
                        },
                      ),
                      CommonMethods.sizedBox(height: 16.h),
                      Container(
                        height: 54.h,
                        decoration: CommonMethods.getBoxDecoration(
                          cornerRadius: 20.r,
                          color: AppTheme.getCardColor(context),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 16.w,
                            right: 17.71.w,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.light_mode_outlined,
                                color: AppTheme.getTextColor(context),
                                size: 20,
                              ),
                              CommonMethods.sizedBox(width: 12.w),
                              Expanded(
                                child: CommonMethods.appTexts(
                                  context,
                                  AppText.theme,
                                  color: AppTheme.getTextColor(context),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              GetBuilder(
                                builder: (controller) {
                                  return SizedBox(
                                    height: 20.h,
                                    width: 36.w,
                                    child: CupertinoSwitch(
                                      value: controller.isDarkMode.value,
                                      onChanged: (value) {
                                        controller.changeTheme();
                                      },
                                      thumbColor: CupertinoColors.white,
                                      activeColor:
                                          AppTheme.getPrimaryColor(context),
                                    ),
                                  );
                                },
                                init: ThemeController(),
                              ),
                            ],
                          ),
                        ),
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
