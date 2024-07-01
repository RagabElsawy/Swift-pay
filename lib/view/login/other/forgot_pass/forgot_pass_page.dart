import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:recharge_ticket_booking_and_bill_app/res/theme/controller/theme_controller.dart';
import 'package:recharge_ticket_booking_and_bill_app/view/login/controller/login_controller.dart';
import '../../../../res/common/app_button.dart';
import '../../../../res/common/app_methods.dart';
import '../../../../res/common/app_textfield.dart';
import '../../../../res/constant/app_routes_path.dart';
import '../../../../res/constant/app_strings.dart';
import '../../../../res/theme/app_theme.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final forgotFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (themeController) {
        return Scaffold(
            appBar: CommonMethods.appBar(
              onTap: () {
                CommonMethods.jumpOutFromScreen(context);
              },
              title: CommonMethods.appTexts(
                context,
                AppText.forgotPass,
                color: AppTheme.getTextColor(context),
                fontSize: 28.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            body: GetBuilder(
              builder: (loginController) {
                return SafeArea(
                  child: Form(
                    key: forgotFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Divider(
                          color: AppTheme.getDividerColor(context),
                        ),
                        CommonMethods.sizedBox(height: 16.h),
                        CommonMethods.appTexts(
                          context,
                          AppText.forgotDes,
                          textAlign: TextAlign.center,
                          color: AppTheme.getTextColor(context),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        CommonMethods.sizedBox(height: 44.h),
                        Padding(
                          padding: CommonMethods.appPadding(),
                          child: Column(
                            children: [
                              AppTextFieldScreen(
                                isDense: true,
                                controller: loginController.forgotEmailController,
                                hintText: AppText.emailHint,
                                label: CommonMethods.appTexts(
                                  context,
                                  AppText.emailHint,
                                ),
                                textInputType: TextInputType.emailAddress,
                                keyboardType: TextInputAction.done,
                                validator: (val) {
                                  if (val!.isNotEmpty) {
                                    if (!RegExp(
                                            r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                        .hasMatch(val)) {
                                      return "Please enter valid email";
                                    }
                                    return null;
                                  }
                                  return "Please enter email";
                                },
                              ),
                              CommonMethods.sizedBox(height: 30.h),
                              GestureDetector(
                                onTap: () {
                                  if (forgotFormKey.currentState!
                                      .validate()) {
                                    CommonMethods.sendToNextScreen(
                                      context,
                                      RoutesPath.verificationPage,
                                    );
                                  }
                                },
                                child: const AppButton(
                                  text: AppText.send,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              init: LogInController(),
            ));
      },
      init: ThemeController(),
    );
  }
}
