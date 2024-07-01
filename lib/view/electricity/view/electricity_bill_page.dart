import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:recharge_ticket_booking_and_bill_app/res/theme/controller/theme_controller.dart';
import '../../../data/app_data.dart';
import '../../../res/common/app_methods.dart';
import '../../../res/constant/app_strings.dart';
import '../../../res/theme/app_theme.dart';
import '../common/electricity_common.dart';
import '../model/electricity_model.dart';

class ElectricityBillPage extends StatefulWidget {
  const ElectricityBillPage({super.key});

  @override
  State<ElectricityBillPage> createState() => _ElectricityBillPageState();
}

class _ElectricityBillPageState extends State<ElectricityBillPage> {
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
              AppText.electricityBill,
              color: AppTheme.getTextColor(context),
              fontSize: 28.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: CommonMethods.appPadding(),
              child: Column(
                children: [
                  Divider(
                    color: AppTheme.getDividerColor(context),
                  ),
                  CommonMethods.sizedBox(height: 24.h),
                  TextField(
                    style: TextStyle(
                      color: AppTheme.getTextColor(context),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      fillColor: AppTheme.getCardColor(context),
                      hintText: AppText.typeName,
                      hintStyle: TextStyle(
                        color: AppTheme.getHintTextColor(context),
                        fontSize: 16.sp,
                        height: 1.5.h,
                        fontWeight: FontWeight.w400,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: const BorderSide(color: Colors.transparent),
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
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        ElectricityModel model = electricityDataList[index];
                        return animationFunction(
                          index,
                          ElectricityCommon(
                            modelData: model,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          CommonMethods.sizedBox(height: 16.h),
                      itemCount: electricityDataList.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      init: ThemeController(),
    );
  }
}
