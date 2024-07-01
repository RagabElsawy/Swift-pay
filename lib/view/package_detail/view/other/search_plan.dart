import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:recharge_ticket_booking_and_bill_app/res/theme/controller/theme_controller.dart';

import '../../../../res/common/app_methods.dart';
import '../../../../res/constant/app_strings.dart';
import '../../../../res/theme/app_theme.dart';
import '../../controller/package_detail_controller.dart';

class SearchPlanPage extends StatelessWidget {
  const SearchPlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (packageDetailController) {
        return GetBuilder(
          builder: (themeController) {
            return Padding(
              padding: CommonMethods.appPadding(),
              child: TextFormField(
                controller: packageDetailController.searchController,
                style: TextStyle(
                  color: AppTheme.getTextColor(context),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w300,
                ),
                decoration: InputDecoration(
                  filled: true,
                  isDense: true,
                  fillColor: AppTheme.getCardColor(context),
                  hintText: AppText.searchHint,
                  hintStyle: TextStyle(
                    color: const Color(0xFF808080),
                    fontSize: 16.sp,
                    height: 1.5.h,
                    fontWeight: FontWeight.w400,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(13.h),
                    child: CommonMethods.imagesOfApp(
                      AppImages.searchMember,
                      height: 24.h,
                      width: 24.h,
                      color: themeController.isDarkMode.value
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              ),
            );
          },
          init: ThemeController(),
        );
      },
      init: PackageDetailController(),
    );
  }
}
