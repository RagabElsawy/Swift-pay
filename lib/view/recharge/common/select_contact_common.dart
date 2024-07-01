import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../res/common/app_methods.dart';
import '../../../res/theme/app_theme.dart';
import '../model/select_contact_model.dart';

// ignore: must_be_immutable
class SelectContactCommon extends StatefulWidget {
   SelectContactCommon({super.key,  required this.modelData});
   SelectContactModel modelData;

  @override
  State<SelectContactCommon> createState() => _SelectContactCommonState();
}

class _SelectContactCommonState extends State<SelectContactCommon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.h,
      width: double.infinity,
      decoration: CommonMethods.getBoxDecoration(
        color: AppTheme.getCardColor(context),
        cornerRadius: 12.r,
      ),
      child: Padding(
        padding: CommonMethods.appPadding(),
        child: Row(
          children: [
            Container(
              height: 54.h,
              width: 54.h,
              decoration:  BoxDecoration(
                shape: BoxShape.circle,
                color: widget.modelData.color,
              ),
              child: Center(
                child: CommonMethods.appTexts(
                  context,
                  widget.modelData.title!,
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w400,
                  color: widget.modelData.textColor,
                ),
              ),
            ),
            CommonMethods.sizedBox(width: 16.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonMethods.appTexts(
                  context,
                  widget.modelData.name!,
                  color: AppTheme.getTextColor(context),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                ),
                CommonMethods.sizedBox(height: 8.h),
                CommonMethods.appTexts(
                  context,
                  widget.modelData.number!,
                  color: AppTheme.getTextColor(context),
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
