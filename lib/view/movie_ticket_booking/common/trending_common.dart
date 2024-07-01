import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../res/common/app_methods.dart';
import '../../../res/constant/app_strings.dart';
import '../../../res/theme/app_theme.dart';
import '../model/trending_model.dart';

// ignore: must_be_immutable
class TrendingCommon extends StatefulWidget {
  TrendingCommon({super.key, required this.modelData});
  TrendingMovieModel modelData;

  @override
  State<TrendingCommon> createState() => _TrendingCommonState();
}

class _TrendingCommonState extends State<TrendingCommon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: CommonMethods.getBoxDecoration(
        color: AppTheme.getCardColor(context),
        cornerRadius: 12.r,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CommonMethods.imagesOfApp(
              widget.modelData.image!,
              height: 97.h,
              width: 97.h,
            ),
            CommonMethods.sizedBox(width: 16.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonMethods.appTexts(
                  context,
                  widget.modelData.title!,
                  color: AppTheme.getTextColor(context),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),
                CommonMethods.sizedBox(height: 8.h),
                Row(
                  children: [
                    CommonMethods.imagesOfApp(
                      AppImages.star,
                      height: 20.h,
                      width: 20.w,
                    ),
                    CommonMethods.sizedBox(width: 8.w),
                    CommonMethods.appTexts(
                      context,
                      AppText.fastRate,
                      color: AppTheme.getTextColor(context),
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
                CommonMethods.sizedBox(height: 8.h),
                CommonMethods.appTexts(
                  context,
                  AppText.action,
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
