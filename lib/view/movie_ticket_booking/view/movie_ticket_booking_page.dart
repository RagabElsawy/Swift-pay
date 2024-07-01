import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:recharge_ticket_booking_and_bill_app/res/theme/controller/theme_controller.dart';
import '../../../data/app_data.dart';
import '../../../res/common/app_methods.dart';
import '../../../res/constant/app_routes_path.dart';
import '../../../res/constant/app_strings.dart';
import '../../../res/theme/app_theme.dart';
import '../common/latest_movie_common.dart';
import '../common/trending_common.dart';
import '../model/latest_movie_model.dart';
import '../model/trending_model.dart';

class MovieTicketBookingPage extends StatefulWidget {
  const MovieTicketBookingPage({super.key});

  @override
  State<MovieTicketBookingPage> createState() => _MovieTicketBookingPageState();
}

class _MovieTicketBookingPageState extends State<MovieTicketBookingPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (themeController) {
        return Scaffold(
          appBar: CommonMethods.appBar(
            onTap: () {
              CommonMethods.jumpOutFromScreen(context);
            },
            backgroundColor: AppTheme.getScaffoldColor(context),
            title: CommonMethods.appTexts(
              context,
              AppText.movieTicket,
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
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: CommonMethods.appPadding(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            style: TextStyle(
                              color: AppTheme.getTextColor(context),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w300,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              isDense: true,
                              fillColor: AppTheme.getCardColor(context),
                              hintText: AppText.searchMovie,
                              hintStyle: TextStyle(
                                color: AppTheme.getHintTextColor(context),
                                fontSize: 16.sp,
                                height: 1.5.h,
                                fontWeight: FontWeight.w400,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.r),
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.r),
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.r),
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
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
                          CommonMethods.sizedBox(height: 24.h),
                          CommonMethods.appTexts(
                            context,
                            AppText.latest,
                            color: AppTheme.getTextColor(context),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          CommonMethods.sizedBox(height: 24.h),
                          SizedBox(
                            height: 336.h,
                            child: GridView.builder(
                              primary: true,
                              itemCount: latestMovieDataList.length,
                              itemBuilder: (context, index) {
                                LatestMovieModel latestData =
                                    latestMovieDataList[index];
                                return animationFunction(
                                  index,
                                   GestureDetector(
                                    onTap: () {
                                      CommonMethods.sendToNextScreen(context, RoutesPath.movieDetailPage);
                                    },
                                    child: LatestMovieCommon(
                                      modelData: latestData,
                                    ),
                                  ),
                                );
                              },
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 16.w,
                                      // childAspectRatio: 0.8,
                                      mainAxisExtent: 336.h),
                            ),
                          ),
                          CommonMethods.appTexts(
                            context,
                            AppText.trending,
                            color: AppTheme.getTextColor(context),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          CommonMethods.sizedBox(height: 16.h),
                          GestureDetector(
                            onTap: () {
                              CommonMethods.sendToNextScreen(context, RoutesPath.movieDetailPage);
                            },
                            child: Expanded(
                              child: ListView.separated(
                                shrinkWrap: true,
                                primary: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  TrendingMovieModel trendingData =
                                      trendingMovieDataList[index];
                                  return animationFunction(
                                    index,
                                    TrendingCommon(
                                      modelData: trendingData,
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    CommonMethods.sizedBox(height: 16.h),
                                itemCount: trendingMovieDataList.length,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                CommonMethods.sizedBox(height: 24.h),
              ],
            ),
          ),
        );
      },
      init: ThemeController(),
    );
  }
}
