import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:recharge_ticket_booking_and_bill_app/res/theme/controller/theme_controller.dart';

import '../../../data/app_data.dart';
import '../../../res/common/app_methods.dart';
import '../../../res/constant/app_strings.dart';
import '../../../res/theme/app_theme.dart';
import '../common/notification_common.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (themeController) {
      return Scaffold(
        appBar: AppBar(
          leading: const SizedBox(),
          backgroundColor: AppTheme.getScaffoldColor(context),
          title: CommonMethods.appTexts(
            context,
            AppText.notifications,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(
                color: AppTheme.getDividerColor(context),
              ),
              CommonMethods.sizedBox(height: 10.h),
              Padding(
                padding: CommonMethods.appPadding(),
                child: CommonMethods.appTexts(
                  context,
                  AppText.today,
                  color: AppTheme.getTextColor(context),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              CommonMethods.sizedBox(height: 16.h),
              Expanded(
                child: ListView.separated(
                  padding: CommonMethods.appPadding(),
                  itemBuilder: (context, index) {
                    return animationFunction(
                      index,
                       NotificationCommon(
                        title: notificationDataList[index].title,
                        time: notificationDataList[index].time,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      CommonMethods.sizedBox(height: 16.h),
                  itemCount: notificationDataList.length,
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
