import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../res/common/app_methods.dart';
import '../../../res/constant/app_strings.dart';
import '../../../res/theme/app_theme.dart';

class BaggageDetailCommon extends StatelessWidget {
  final String? title;
  final String? price;
  final String? des;
  const BaggageDetailCommon({super.key, this.title, this.price, this.des});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(0, 16, 0, 10),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppTheme.getDividerColor(context),
            ),
            borderRadius: BorderRadius.circular(16.r),
            shape: BoxShape.rectangle,
          ),
          child: Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment:  MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    text: price!,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'SF Pro Display',
                      color: AppTheme.getTextColor(context),
                    ),
                    children: [
                      TextSpan(
                        text: AppText.adult,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: "SF Pro Display",
                          fontWeight: FontWeight.w400,
                          color: AppTheme.getHintTextColor(context),
                        ),
                      ),
                    ],
                  ),
                ),
                CommonMethods.sizedBox(height: 8.h),
                CommonMethods.appTexts(
                  context,
                  des!,
                  color: AppTheme.getTextColor(context),
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 15,
          top: 9,
          child: Container(
            padding: const EdgeInsets.only(
                bottom: 10, left: 5, right: 5),
            color: AppTheme.getScaffoldColor(context),
            child: CommonMethods.appTexts(
              context,
              title!,
              color: AppTheme.getTextColor(context),
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
