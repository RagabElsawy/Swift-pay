import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:recharge_ticket_booking_and_bill_app/res/theme/controller/theme_controller.dart';
import '../../res/common/app_methods.dart';
import '../../res/constant/app_strings.dart';
import '../../res/theme/app_theme.dart';
import 'controller/bottom_controller.dart';

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({super.key});

  @override
  State<BottomBarPage> createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  BottomController bottomController = Get.put(BottomController());

  @override
  void initState() {
    bottomController.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bottomController.onExit();
        return false;
      },
      child: GetBuilder(
        init: BottomController(),
        builder: (bottomBarController) {
          return GetBuilder(
            builder: (themeController) {
              return Scaffold(
                resizeToAvoidBottomInset: false,
                body: bottomController.screenList.isNotEmpty
                    ? bottomController.screenList
                    .elementAt(bottomController.selectedIndex.value)
                    : Container(),
                bottomNavigationBar: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  selectedFontSize: 0,
                  unselectedFontSize: 0,
                  elevation: 5,
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: EdgeInsets.symmetric(vertical: 22.h),
                        child: Column(
                          children: [
                            CommonMethods.imagesOfApp(
                              AppImages.unselectHome,
                              height: 24.h,
                              width: 24.h,
                              color: themeController.isDarkMode.value
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            CommonMethods.sizedBox(height: 11.h),
                            CommonMethods.appTexts(
                              context ,
                              AppText.home,
                              color: AppTheme.getTextColor(context),
                              fontWeight: FontWeight.w400,
                              fontSize: 13.sp,
                            ),
                          ],
                        ),
                      ),
                      label: '',
                      activeIcon: Padding(
                        padding: EdgeInsets.symmetric(vertical: 22.h),
                        child: Column(
                          children: [
                            CommonMethods.imagesOfApp(
                              AppImages.selectHome,
                              height: 24.h,
                              width: 24.h,
                            ),
                            CommonMethods.sizedBox(height: 11.h),
                            CommonMethods.appTexts(
                              context,
                              AppText.home,
                              color: AppTheme.getPrimaryColor(context),
                              fontWeight: FontWeight.w400,
                              fontSize: 13.sp,
                            ),
                          ],
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: EdgeInsets.symmetric(vertical: 22.h),
                        child: Column(
                          children: [
                            CommonMethods.imagesOfApp(
                              AppImages.unselectTrans,
                              height: 24.h,
                              width: 24.h,
                              color: themeController.isDarkMode.value
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            CommonMethods.sizedBox(height: 11.h),
                            CommonMethods.appTexts(
                              context,
                              AppText.transaction,
                              color: AppTheme.getTextColor(context),
                              fontWeight: FontWeight.w400,
                              fontSize: 13.sp,
                            ),
                          ],
                        ),
                      ),
                      label: '',
                      activeIcon: Padding(
                        padding: EdgeInsets.symmetric(vertical: 22.h),
                        child: Column(
                          children: [
                            CommonMethods.imagesOfApp(
                              AppImages.selectTrans,
                              height: 24.h,
                              width: 24.h,
                            ),
                            CommonMethods.sizedBox(height: 11.h),
                            CommonMethods.appTexts(
                              context ,
                              AppText.transaction,
                              color: AppTheme.getPrimaryColor(context ),
                              fontWeight: FontWeight.w400,
                              fontSize: 13.sp,
                            ),
                          ],
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: EdgeInsets.symmetric(vertical: 22.h),
                        child: Column(
                          children: [
                            CommonMethods.imagesOfApp(
                              AppImages.unselectNotification,
                              height: 24.h,
                              width: 24.h,
                              color: themeController.isDarkMode.value
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            CommonMethods.sizedBox(height: 11.h),
                            CommonMethods.appTexts(
                              context ,
                              AppText.notifications,
                              color: AppTheme.getTextColor(context ),
                              fontWeight: FontWeight.w400,
                              fontSize: 13.sp,
                            ),
                          ],
                        ),
                      ),
                      label: '',
                      activeIcon: Padding(
                        padding: EdgeInsets.symmetric(vertical: 22.h),
                        child: Column(
                          children: [
                            CommonMethods.imagesOfApp(
                              AppImages.selectNotification,
                              height: 24.h,
                              width: 24.h,
                            ),
                            CommonMethods.sizedBox(height: 11.h),
                            CommonMethods.appTexts(
                              context,
                              AppText.notifications,
                              color: AppTheme.getPrimaryColor(context),
                              fontWeight: FontWeight.w400,
                              fontSize: 13.sp,
                            ),
                          ],
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: EdgeInsets.symmetric(vertical: 22.h),
                        child: Column(
                          children: [
                            CommonMethods.imagesOfApp(
                              AppImages.unselectUser,
                              height: 24.h,
                              width: 24.h,
                              color: themeController.isDarkMode.value
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            CommonMethods.sizedBox(height: 11.h),
                            CommonMethods.appTexts(
                              context ,
                              AppText.profile,
                              color: AppTheme.getTextColor(context),
                              fontWeight: FontWeight.w400,
                              fontSize: 13.sp,
                            ),
                          ],
                        ),
                      ),
                      label: "",
                      activeIcon: Padding(
                        padding: EdgeInsets.symmetric(vertical: 22.h),
                        child: Column(
                          children: [
                            CommonMethods.imagesOfApp(
                              AppImages.selectUser,
                              height: 24.h,
                              width: 24.h,
                            ),
                            CommonMethods.sizedBox(height: 11.h),
                            CommonMethods.appTexts(
                              context ,
                              AppText.profile,
                              color: AppTheme.getPrimaryColor(context ),
                              fontWeight: FontWeight.w400,
                              fontSize: 13.sp,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                  currentIndex: bottomController.selectedIndex.value,
                  unselectedItemColor: const Color(0xFFA7AEC1),
                  selectedItemColor: AppTheme.getPrimaryColor(context),
                  onTap: bottomController.onItemTapped,
                ),
              );
            },
            init: ThemeController(),
          );
        }
      ),
    );
  }
}
