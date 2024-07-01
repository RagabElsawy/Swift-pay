import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/app_data.dart';
import '../../../res/common/app_methods.dart';
import '../../../res/constant/app_routes_path.dart';
import '../../../res/constant/app_strings.dart';
import '../../../res/theme/app_theme.dart';

class SearchFlightPage extends StatefulWidget {
  const SearchFlightPage({super.key});

  @override
  State<SearchFlightPage> createState() => _SearchFlightPageState();
}

class _SearchFlightPageState extends State<SearchFlightPage> {
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
        AppText.searchResult,
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
            CommonMethods.sizedBox(height: 24.h),
            Expanded(
              child: ListView.separated(
                padding: CommonMethods.appPadding(),
                itemBuilder: (context, index) {
                  return animationFunction(
                    index,
                     GestureDetector(
                      onTap: () {
                        CommonMethods.sendToNextScreen(context, RoutesPath.flightDetailPage);
                      },
                      child: Container(
                        width: double.infinity,
                        // height: 182.h,
                        decoration: CommonMethods.getBoxDecoration(
                          color: AppTheme.getCardColor(context),
                          cornerRadius: 16.r,
                        ),
                        padding: EdgeInsets.all(16.h),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CommonMethods.imagesOfApp(
                                  searchFlightDataList[index].image!,
                                  width: 52.22.h,
                                  height: 32.h,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    CommonMethods.appTexts(
                                      context,
                                      AppText.flightPrice,
                                      color: AppTheme.getPrimaryColor(context),
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    CommonMethods.sizedBox(height: 5.h),
                                    CommonMethods.appTexts(
                                      context,
                                      searchFlightDataList[index].status!,
                                      color: searchFlightDataList[index].statusColor!,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            CommonMethods.sizedBox(height: 19.h),
                            const DottedLine(
                              direction: Axis.horizontal,
                              lineLength: double.infinity,
                              lineThickness: 1.5,
                              dashColor: Color(0xFFC5C5C5),
                              dashLength: 8.0,
                            ),
                            CommonMethods.sizedBox(height: 17.5.h),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CommonMethods.appTexts(
                                      context,
                                      AppText.san,
                                      color: AppTheme.getHintTextColor(context),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    CommonMethods.sizedBox(height: 8.h),
                                    CommonMethods.appTexts(
                                      context,
                                      AppText.flightTime,
                                      color: AppTheme.getTextColor(context),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    CommonMethods.sizedBox(height: 5.h),
                                    CommonMethods.appTexts(
                                      context,
                                      AppText.flightDate,
                                      color: AppTheme.getHintTextColor(context),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    CommonMethods.imagesOfApp(
                                      AppImages.duration,
                                      width: 195.w,
                                      height: 20.h,
                                    ),
                                    CommonMethods.sizedBox(height: 5.h),
                                    CommonMethods.appTexts(
                                      context,
                                      AppText.duration,
                                      color: AppTheme.getPrimaryColor(context),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    CommonMethods.appTexts(
                                      context,
                                      AppText.los,
                                      color: AppTheme.getHintTextColor(context),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    CommonMethods.sizedBox(height: 8.h),
                                    CommonMethods.appTexts(
                                      context,
                                      AppText.returnTime,
                                      color: AppTheme.getTextColor(context),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    CommonMethods.sizedBox(height: 5.h),
                                    CommonMethods.appTexts(
                                      context,
                                      AppText.returnDate,
                                      color: AppTheme.getHintTextColor(context),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    CommonMethods.sizedBox(height: 16.h),
                itemCount: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
