import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/app_data.dart';
import '../../../res/common/app_methods.dart';
import '../../../res/constant/app_strings.dart';
import '../../../res/theme/app_theme.dart';
import '../../home/model/categoires_model.dart';
import '../common/categories_common.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
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
          AppText.categories,
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
            CommonMethods.sizedBox(height: 16.h),
            Padding(
              padding: CommonMethods.appPadding(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonMethods.appTexts(
                    context,
                    AppText.rechargePhone,
                    textAlign: TextAlign.center,
                    color: AppTheme.getTextColor(context),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  CommonMethods.sizedBox(height: 16.h),
                  GridView.builder(
                    primary: false,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: rechargeDataList.length,
                    itemBuilder: (context, index) {
                      CategoriesModel model = rechargeDataList[index];
                      return animationFunction(
                        index,
                        // ignore: prefer_const_constructors
                        slideDuration: Duration(milliseconds: 200),
                        // listAnimation: Duration(milliseconds: 200),
                        CategoriesCommon(
                          modelData: model,
                        ),
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisExtent: 115.h,
                    ),
                  ),
                  CommonMethods.sizedBox(height: 30.h),
                  CommonMethods.appTexts(
                    context,
                    AppText.bills,
                    textAlign: TextAlign.center,
                    color: AppTheme.getTextColor(context),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  CommonMethods.sizedBox(height: 16.h),
                  GridView.builder(
                    primary: false,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: billsDataList.length,
                    itemBuilder: (context, index) {
                      CategoriesModel billData = billsDataList[index];
                      return animationFunction(
                        index,
                        // ignore: prefer_const_constructors
                        slideDuration: Duration(milliseconds: 250),
                        CategoriesCommon(
                          modelData: billData,
                        ),
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisExtent: 115.h,
                    ),
                  ),
                  CommonMethods.sizedBox(height: 35.h),
                  CommonMethods.appTexts(
                    context,
                    AppText.booking,
                    textAlign: TextAlign.center,
                    color: AppTheme.getTextColor(context),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  CommonMethods.sizedBox(height: 16.h),
                  GridView.builder(
                    primary: false,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: bookingDataList.length,
                    itemBuilder: (context, index) {
                      CategoriesModel bookingData = bookingDataList[index];
                      return animationFunction(
                        index,
                        // ignore: prefer_const_constructors
                        slideDuration: Duration(milliseconds: 300),
                        CategoriesCommon(
                          modelData: bookingData,
                        ),
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisExtent: 115.h,
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
