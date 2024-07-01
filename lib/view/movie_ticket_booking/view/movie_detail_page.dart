import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../res/common/app_button.dart';
import '../../../res/common/app_methods.dart';
import '../../../res/constant/app_routes_path.dart';
import '../../../res/constant/app_strings.dart';
import '../../../res/theme/app_theme.dart';

class MovieDetailPage extends StatefulWidget {
  const MovieDetailPage({super.key});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonMethods.appBar(
        onTap: () {
          CommonMethods.jumpOutFromScreen(context);
        },
        backgroundColor: AppTheme.getScaffoldColor(context),
        title: CommonMethods.appTexts(
          context,
          AppText.movieDetails,
          color: AppTheme.getTextColor(context),
          fontSize: 28.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Divider(
              color: AppTheme.getDividerColor(context),
            ),
            CommonMethods.sizedBox(height: 15.h),
            Padding(
              padding: CommonMethods.appPadding(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonMethods.imagesOfApp(
                    AppImages.missionDetail,
                    height: 410.h,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  CommonMethods.sizedBox(height: 16.h),
                  Row(
                    children: [
                      Expanded(
                        child: CommonMethods.appTexts(
                          context,
                          AppText.mission,
                          color: AppTheme.getTextColor(context),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      CommonMethods.imagesOfApp(
                        AppImages.star,
                        height: 20.h,
                        width: 20.w,
                      ),
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
                  CommonMethods.sizedBox(height: 16.h),
                  CommonMethods.appTexts(
                    context,
                    AppText.movieDetailsDes,
                    color: const Color(0xFF808080),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  CommonMethods.sizedBox(height: 85.h),
                  GestureDetector(
                    onTap: () {
                      CommonMethods.sendToNextScreen(
                          context, RoutesPath.selectSeatPage);
                    },
                    child: const AppButton(
                      text: AppText.book,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
