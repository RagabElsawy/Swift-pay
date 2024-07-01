import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../res/common/app_button.dart';
import '../../../res/common/app_methods.dart';
import '../../../res/constant/app_routes_path.dart';
import '../../../res/constant/app_strings.dart';
import '../../../res/theme/app_theme.dart';

class BookingSuccessPage extends StatefulWidget {
  const BookingSuccessPage({super.key});

  @override
  State<BookingSuccessPage> createState() => _BookingSuccessPageState();
}

class _BookingSuccessPageState extends State<BookingSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return CommonMethods.sendToNextScreen(context,RoutesPath.bottomBarPage);
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CommonMethods.imagesOfApp(
                  AppImages.paymentSuccess,
                  width: 154.h,
                  height: 154.h,
                ),
                CommonMethods.sizedBox(height: 30.h),
                CommonMethods.appTexts(
                  context,
                  AppText.bookingSuccess,
                  textAlign: TextAlign.center,
                  color: AppTheme.getTextColor(context),
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                ),
                CommonMethods.sizedBox(height: 8.h),
                CommonMethods.appTexts(
                  context,
                  AppText.congrates,
                  textAlign: TextAlign.center,
                  color: AppTheme.getTextColor(context),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
                CommonMethods.sizedBox(height: 40.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 89.w),
                  child: GestureDetector(
                    onTap: () {
                      CommonMethods.sendToNextScreen(
                          context, RoutesPath.bottomBarPage);
                    },
                    child: const AppButton(
                      text: AppText.goToHome,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
