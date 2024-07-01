import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../res/common/app_button.dart';
import '../../../../res/common/app_methods.dart';
import '../../../../res/common/app_textfield.dart';
import '../../../../res/constant/app_routes_path.dart';
import '../../../../res/constant/app_strings.dart';
import '../../../../res/theme/app_theme.dart';
import '../../controller/electricity_controller.dart';

class MaharashtraElectricityPage extends StatefulWidget {
  const MaharashtraElectricityPage({super.key});

  @override
  State<MaharashtraElectricityPage> createState() =>
      _MaharashtraElectricityPageState();
}

class _MaharashtraElectricityPageState
    extends State<MaharashtraElectricityPage> {
  ElectricityController electricityController = Get.put(ElectricityController());

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
          AppText.maharashtraElectricity,
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
            Container(
              height: 354.h,
              width: double.infinity,
              margin: CommonMethods.appPadding(),
              decoration: CommonMethods.getBoxDecoration(
                cornerRadius: 16.r,
                color: AppTheme.getScaffoldColor(context),
                shadows: [
                  const BoxShadow(
                      color: Color(0x14000000),
                      spreadRadius: 0,
                      blurRadius: 17,
                      offset: Offset(0, 1))
                ],
              ),
              child: Padding(
                padding: CommonMethods.appPadding(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonMethods.sizedBox(height: 24.h),
                    CommonMethods.appTexts(
                      context,
                      AppText.link,
                      color: AppTheme.getTextColor(context),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                    CommonMethods.sizedBox(height: 32.h),
                    AppTextFieldScreen(
                      controller: electricityController.accountNameController,
                      isDense: true,
                      hintText: AppText.accountName,
                      label: CommonMethods.appTexts(
                        context,
                        AppText.accountName,
                      ),
                      textInputType: TextInputType.name,
                      keyboardType: TextInputAction.next,
                      validator: (val) {
                        if (val!.trim().isNotEmpty) {
                          if (val.trim().isEmpty) {
                            return "Enter Account Number";
                          }
                          return null;
                        }
                        return "enter account number";
                      },
                    ),
                    CommonMethods.sizedBox(height: 24.h),
                    AppTextFieldScreen(
                      controller: electricityController.nickNameController,
                      isDense: true,
                      hintText: AppText.nickName,
                      label: CommonMethods.appTexts(
                        context,
                        AppText.nickName,
                      ),
                      textInputType: TextInputType.name,
                      keyboardType: TextInputAction.done,
                      validator: (val) {
                        if (val!.trim().isNotEmpty) {
                          if (val.trim().isEmpty) {
                            return "Enter Nick Name";
                          }
                          return null;
                        }
                        return "enter nick name";
                      },
                    ),
                    CommonMethods.sizedBox(height: 48.h),
                    GestureDetector(
                      onTap: () {
                        CommonMethods.sendToNextScreen(
                            context, RoutesPath.paymentSuccessPage);
                      },
                      child: const AppButton(
                        text: AppText.payBill,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
