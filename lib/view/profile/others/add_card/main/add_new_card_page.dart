import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:recharge_ticket_booking_and_bill_app/view/bottombar/controller/bottom_controller.dart';

import '../../../../../res/common/app_button.dart';
import '../../../../../res/common/app_methods.dart';
import '../../../../../res/common/app_textfield.dart';
import '../../../../../res/constant/app_strings.dart';
import '../../../../../res/theme/app_theme.dart';
import '../../../controller/profile_controller.dart';

class AddNewCardPage extends StatefulWidget {
  const AddNewCardPage({super.key});

  @override
  State<AddNewCardPage> createState() => _AddNewCardPageState();
}

class _AddNewCardPageState extends State<AddNewCardPage> {
  ProfileController profileController = Get.put(ProfileController());

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
          AppText.addCard,
          color: AppTheme.getTextColor(context),
          fontSize: 28.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: GetBuilder<BottomController>(builder: (bottomController) {
        return SafeArea(
          child: Form(
            key: profileController.addCardFormKey,
            child: Padding(
              padding: CommonMethods.appPadding(),
              child: Column(
                children: [
                  CommonMethods.sizedBox(height: 16.h),
                  AppTextFieldScreen(
                    controller: profileController.cardNumberController,
                    hintText: AppText.cardNum,
                    isDense: true,
                    label: CommonMethods.appTexts(
                      context,
                      AppText.cardNum,
                    ),
                    keyboardType: TextInputAction.next,
                    textInputType: TextInputType.number,
                    inputFormatter: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(16),
                    ],
                    validator: (val) {
                      if (val!.trim().isNotEmpty) {
                        if (val
                            .trim()
                            .isEmpty) {
                          return "Enter Card Number";
                        }
                        return null;
                      }
                      return "enter correct card number";
                    },
                  ),
                  CommonMethods.sizedBox(height: 16.h),
                  Row(
                    children: [
                      Expanded(
                        child: AppTextFieldScreen(
                          controller: profileController.cardExpiryController,
                          hintText: AppText.expDateHint,
                          keyboardType: TextInputAction.next,
                          textInputType: TextInputType.datetime,

                          label: CommonMethods.appTexts(
                            context,
                            AppText.expDate,
                          ),
                          inputFormatter: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(04),
                            CardMonthInputFormatter(),
                          ],
                          validator: (val) {
                            if (val!.trim().isNotEmpty) {
                              if (val
                                  .trim()
                                  .isEmpty) {
                                return "Enter Expiry Date";
                              }
                              return null;
                            }
                            return "enter expiry date";
                          },
                        ),
                      ),
                      CommonMethods.sizedBox(width: 16.w),
                      Expanded(
                        child: AppTextFieldScreen(
                          controller: profileController.cardCvvController,
                          hintText: AppText.cvv,
                          keyboardType: TextInputAction.done,
                          textInputType: TextInputType.number,
                          label: CommonMethods.appTexts(
                            context,
                            AppText.cvv,
                          ),
                          inputFormatter: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(3),
                          ],
                          validator: (val) {
                            if (val!.trim().isNotEmpty) {
                              if (val
                                  .trim()
                                  .isEmpty) {
                                return "Enter Cvv Code";
                              }
                              return null;
                            }
                            return "enter cvv code";
                          },
                        ),
                      ),
                    ],
                  ),
                  CommonMethods.sizedBox(height: 30.h),
                  GestureDetector(
                    onTap: () {
                      if (profileController.addCardFormKey.currentState!
                          .validate()) {
                        bottomController.selectedIndex.value  = 3;
                        bottomController.update();
                      }
                    },
                    child: const AppButton(
                      text: AppText.addCard,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
