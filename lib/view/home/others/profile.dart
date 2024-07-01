import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../res/common/app_methods.dart';
import '../../../res/constant/app_strings.dart';
import '../../../res/theme/app_theme.dart';

class ProfileRow extends StatelessWidget {
  const ProfileRow({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: CommonMethods.appPadding(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonMethods.sizedBox(height: 16.h),
          CommonMethods.appTexts(
            context,
            AppText.hi,
            color: AppTheme.getTextColor(context),
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
          CommonMethods.appTexts(
            context,
            AppText.russia,
            color: AppTheme.getTextColor(context),
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
