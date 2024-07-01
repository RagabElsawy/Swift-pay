import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:recharge_ticket_booking_and_bill_app/res/constant/app_strings.dart';
import 'package:recharge_ticket_booking_and_bill_app/res/theme/controller/theme_controller.dart';
import 'package:recharge_ticket_booking_and_bill_app/view/login/controller/login_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/pref_data.dart';
import '../../../res/common/app_button.dart';
import '../../../res/common/app_methods.dart';
import '../../../res/common/app_textfield.dart';
import '../../../res/constant/app_routes_path.dart';
import '../../../res/theme/app_theme.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  LogInController logInController = Get.put(LogInController());
  final formKey = GlobalKey<FormState>();

  Future<void> signup() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("email", logInController.emailController.text);
    prefs.setString("password", logInController.passwordController.text);
  }

  @override
  void initState() {
    // TODO: implement initState
    signup();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return exit(0);
      },
      child: GetBuilder(
        builder: (themeController) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: CommonMethods.nullAppBar(
              context,
              statusBarColor: AppTheme.getScaffoldColor(context),
              statusBarBrightness: themeController.isDarkMode.value
                  ? Brightness.light
                  : Brightness.dark,
              statusBarIconBrightness: themeController.isDarkMode.value
                  ? Brightness.light
                  : Brightness.dark,
            ),
            body: SafeArea(
              child: Form(
                key: formKey,
                child: Padding(
                  padding:  EdgeInsets.only(bottom: 40.h,left: 16.h,right: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          CommonMethods.sizedBox(height: 38.h),
                          CommonMethods.appTexts(
                            context,
                            AppText.login,
                            color: AppTheme.getTextColor(context),
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          CommonMethods.sizedBox(height: 11.h),
                          CommonMethods.appTexts(
                            context,
                            AppText.please,
                            color: AppTheme.getTextColor(context),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          CommonMethods.sizedBox(height: 38.h),
                          AppTextFieldScreen(
                            controller: logInController.emailController,
                            isDense: true,
                            hintText: AppText.emailHint,
                            label: CommonMethods.appTexts(
                              context,
                              AppText.emailHint,
                            ),
                            textInputType: TextInputType.emailAddress,
                            keyboardType: TextInputAction.next,
                            validator: (val) {
                              if (val!.isNotEmpty) {
                                if (!RegExp(
                                    r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                    .hasMatch(val)) {
                                  return "Please enter a valid email address";
                                }
                                return null;
                              }
                              return "Please enter a valid email address";
                            },
                          ),
                          CommonMethods.sizedBox(height: 24.h),
                          GetBuilder<LogInController>(
                            init: LogInController(),
                            builder: (controller) => AppTextFieldScreen(
                              isDense: true,
                              controller: controller.passwordController,
                              hintText: AppText.password,
                              label: CommonMethods.appTexts(
                                context,
                                AppText.password,
                              ),
                              textInputType: TextInputType.visiblePassword,
                              keyboardType: TextInputAction.done,
                              obscureText: controller.obSecureText.value,
                              maxLines: 1,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controller.obSecureText.value =
                                  !controller.obSecureText.value;
                                  controller.update();
                                },
                                hoverColor: Colors.black,
                                icon: CommonMethods.imagesOfApp(
                                  controller.obSecureText.value
                                      ? AppImages.hidePass
                                      : AppImages.eyeLogin,
                                  color: themeController.isDarkMode.value
                                      ? Colors.white
                                      : Colors.black,
                                  height: 24.h,
                                  width: 24.h,
                                ),
                              ),
                              validator: (val) {
                                if (val!.trim().isNotEmpty) {
                                  if (val.trim().isEmpty) {
                                    return "Please enter a valid password";
                                  }
                                  return null;
                                }
                                return "Please enter a valid password";
                              },
                            ),
                          ),
                          CommonMethods.sizedBox(height: 16.h),
                          GestureDetector(
                            onTap: () {
                              CommonMethods.sendToNextScreen(
                                  context, RoutesPath.forgotPassPage);
                            },
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: CommonMethods.appTexts(
                                context,
                                AppText.forgot,
                                color: AppTheme.getTextColor(context),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          CommonMethods.sizedBox(height: 30.h),
                          GestureDetector(
                            onTap: () {
                              debugPrint(
                                  "formKey-- ${formKey.currentState!.validate()}");
                              if (formKey.currentState!
                                  .validate()) {
                                debugPrint("Success");
                                logInController.clearText();
                                signup();
                                PrefData.setLogin(false);
                                CommonMethods.sendToNextScreen(
                                    context, RoutesPath.bottomBarPage);
                              }
                            },
                            child: const AppButton(
                              text: AppText.login,
                            ),
                          ),
                          CommonMethods.sizedBox(height: 16.h),
                          CommonMethods.appTexts(
                            context,
                            AppText.or,
                            color: AppTheme.getTextColor(context),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          CommonMethods.sizedBox(height: 16.h),
                          Row(
                            children: [
                              Container(
                                height: 54.h,
                                width: 190.w,
                                decoration: CommonMethods.getBoxDecoration(
                                  cornerRadius: 30.r,
                                  color: AppTheme.getCardColor(context),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CommonMethods.imagesOfApp(
                                      AppImages.google,
                                      height: 24.h,
                                      width: 24.h,
                                    ),
                                    CommonMethods.sizedBox(width: 16.w),
                                    CommonMethods.appTexts(
                                      context,
                                      AppText.google,
                                      color: AppTheme.getTextColor(context),
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ],
                                ),
                              ),
                              CommonMethods.sizedBox(width: 16.w),
                              Container(
                                height: 54.h,
                                width: 190.w,
                                decoration: CommonMethods.getBoxDecoration(
                                  cornerRadius: 30.r,
                                  color: AppTheme.getCardColor(context),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CommonMethods.imagesOfApp(
                                      AppImages.apple,
                                      height: 24.h,
                                      width: 24.h,
                                    ),
                                    CommonMethods.sizedBox(width: 16.w),
                                    CommonMethods.appTexts(
                                      context,
                                      AppText.apple,
                                      color: AppTheme.getTextColor(context),
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: RichText(
                          text: TextSpan(
                            text: AppText.account,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'SF Pro Display',
                              color: AppTheme.getTextColor(context),
                            ),
                            children: [
                              TextSpan(
                                text: AppText.signup,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    debugPrint('SUCCESS======');
                                    CommonMethods.sendToNextScreen(
                                        context, RoutesPath.signupPage);
                                  },
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: "SF Pro Display",
                                  fontWeight: FontWeight.w400,
                                  color: AppTheme.getPrimaryColor(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        init: ThemeController(),
      ),
    );
  }
}
