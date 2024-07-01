import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:recharge_ticket_booking_and_bill_app/res/theme/controller/theme_controller.dart';

import '../../../data/app_data.dart';
import '../../../res/common/app_methods.dart';
import '../../../res/constant/app_routes_path.dart';
import '../../../res/constant/app_strings.dart';
import '../../../res/theme/app_theme.dart';
import '../common/recent_recharge_common.dart';
import '../common/select_contact_common.dart';
import '../model/recent_recharge_model.dart';
import '../model/select_contact_model.dart';

class RechargePage extends StatefulWidget {
  const RechargePage({super.key});

  @override
  State<RechargePage> createState() => _RechargePageState();
}

class _RechargePageState extends State<RechargePage> {
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
          AppText.rechargePhone,
          color: AppTheme.getTextColor(context),
          fontSize: 28.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              color: AppTheme.getDividerColor(context),
            ),
            CommonMethods.sizedBox(height: 16.h),
            GetBuilder(
              builder: (themeController) {
                return Padding(
                  padding: CommonMethods.appPadding(),
                  child: IntlPhoneField(
                    flagsButtonPadding: const EdgeInsets.all(10),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    dropdownIconPosition: IconPosition.trailing,
                    showCountryFlag: false,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      suffixIcon: Padding(
                        padding: EdgeInsets.all(12.h),
                        child: CommonMethods.imagesOfApp(
                          AppImages.contactBook,
                          width: 24.h,
                          height: 24.h,
                        ),
                      ),
                      isDense: true,
                      hintText: "Enter Phone Number",
                      hintStyle: TextStyle(
                        color: const Color(0xFFACAFB5),
                        height: 1.5,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w300,
                      ),
                      labelText: 'Phone Number',
                      labelStyle: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: AppTheme.getTextColor(context),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16.r)),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            style: BorderStyle.solid,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16.r)),
                          borderSide: const BorderSide(
                            color: Color(0xFFC5C5C5),
                            style: BorderStyle.solid,
                          )),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.r)),
                        borderSide: const BorderSide(
                          color: Color(0xFFC5C5C5),
                          style: BorderStyle.solid,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.r)),
                        borderSide: const BorderSide(
                          color: Colors.red,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                    dropdownTextStyle: TextStyle(
                      color: themeController.isDarkMode.value
                          ? Colors.white
                          : Colors.black,
                    ),
                    disableLengthCheck: true,
                    dropdownIcon: Icon(
                      CupertinoIcons.chevron_down,
                      size: 14,
                      color: themeController.isDarkMode.value
                          ? Colors.white
                          : Colors.black,
                    ),
                    initialCountryCode: 'IN',
                    onChanged: (phone) {
                      debugPrint(phone.completeNumber);
                    },
                  ),
                );
              },
              init: ThemeController(),
            ),
            CommonMethods.sizedBox(height: 24.h),
            Padding(
              padding: CommonMethods.appPadding(),
              child: CommonMethods.appTexts(
                context,
                AppText.recentRecharge,
                color: AppTheme.getTextColor(context),
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            CommonMethods.sizedBox(height: 16.h),
            SizedBox(
              height: 81.h,
              child: GridView.builder(
                primary: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: recentRechargeDataList.length,
                itemBuilder: (context, index) {
                  RecentRechargeModel recentData =
                      recentRechargeDataList[index];
                  return animationFunction(
                   index,
                    RecentRechargeCommon(
                      modelData: recentData,
                    ),
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  mainAxisExtent: 82.h,
                ),
              ),
            ),
            CommonMethods.sizedBox(height: 24.h),
            Padding(
              padding: CommonMethods.appPadding(),
              child: CommonMethods.appTexts(
                context,
                AppText.selectContact,
                color: AppTheme.getTextColor(context),
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            CommonMethods.sizedBox(height: 16.h),
            Expanded(
              child: ListView.separated(
                padding: CommonMethods.appPadding(),
                itemBuilder: (context, index) {
                  SelectContactModel selectData = selectContactDataList[index];
                  return animationFunction(
                    index,
                    GestureDetector(
                      onTap: () {
                        CommonMethods.sendToNextScreen(
                            context, RoutesPath.packageDetailPage);
                      },
                      child: SelectContactCommon(
                        modelData: selectData,
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    CommonMethods.sizedBox(height: 16.h),
                itemCount: selectContactDataList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
