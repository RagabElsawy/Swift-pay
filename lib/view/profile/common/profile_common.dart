import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../res/common/app_methods.dart';
import '../../../res/constant/app_strings.dart';
import '../../../res/theme/app_theme.dart';
import '../../../res/theme/controller/theme_controller.dart';

class ProfileCommon extends StatelessWidget {
  final String? title;
  final String? image;
  final Function()? onTap;
  const ProfileCommon({
    super.key,
    this.title,
    this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (themeController) {
        return GestureDetector(
          onTap: () {
            if (onTap != null) {
              onTap!();
            }
          },
          child: Container(
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
                  CommonMethods.imagesOfApp(
                    image!,
                    width: 20.h,
                    height: 20.h,
                    color: themeController.isDarkMode.value
                        ? Colors.white
                        : Colors.black,
                  ),
                  CommonMethods.sizedBox(width: 12.w),
                  Expanded(
                    child: CommonMethods.appTexts(
                      context,
                      title!,
                      color: AppTheme.getTextColor(context),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  CommonMethods.imagesOfApp(
                    AppImages.nextArrow,
                    width: 20.h,
                    height: 20.h,
                    color: themeController.isDarkMode.value
                        ? Colors.white
                        : Colors.black,
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
