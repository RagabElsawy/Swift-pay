import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../res/common/app_methods.dart';
import '../../../res/constant/app_strings.dart';
import '../../../res/theme/app_theme.dart';
import '../model/latest_movie_model.dart';

// ignore: must_be_immutable
class LatestMovieCommon extends StatefulWidget {
  LatestMovieCommon({super.key, required this.modelData});

  LatestMovieModel modelData;

  @override
  State<LatestMovieCommon> createState() => _LatestMovieCommonState();
}

class _LatestMovieCommonState extends State<LatestMovieCommon> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonMethods.imagesOfApp(
          widget.modelData.image!,
        ),
        CommonMethods.sizedBox(height: 10.h),
        CommonMethods.appTexts(
          context,
          widget.modelData.title!,
          color: AppTheme.getTextColor(context),
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ),
        CommonMethods.sizedBox(height: 5.h),
        Row(
          children: [
            CommonMethods.imagesOfApp(
              AppImages.star,
              height: 20.h,
              width: 20.w,
            ),
            CommonMethods.appTexts(
              context,
              widget.modelData.rate!,
              color: AppTheme.getTextColor(context),
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      ],
    );
  }
}
