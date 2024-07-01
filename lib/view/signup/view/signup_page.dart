import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:recharge_ticket_booking_and_bill_app/res/theme/controller/theme_controller.dart';
import 'package:recharge_ticket_booking_and_bill_app/view/signup/controller/signup_controller.dart';
import '../../../res/common/app_button.dart';
import '../../../res/common/app_methods.dart';
import '../../../res/common/app_textfield.dart';
import '../../../res/constant/app_routes_path.dart';
import '../../../res/constant/app_strings.dart';
import '../../../res/theme/app_theme.dart';
import '../../../utils/custom_country_picker.dart';
import '../../../utils/phone_num_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  SignUpController signUpController = Get.put(SignUpController());
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
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
                padding: EdgeInsets.only(bottom: 40.h,left: 16.h,right: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        CommonMethods.sizedBox(height: 38.h),
                        CommonMethods.appTexts(
                          context,
                          AppText.signup,
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
                          controller: signUpController.nameController,
                          isDense: true,
                          hintText: AppText.name,
                          label: CommonMethods.appTexts(
                            context,
                            AppText.name,
                          ),
                          textInputType: TextInputType.emailAddress,
                          keyboardType: TextInputAction.next,
                          validator: (val) {
                            if (val!.trim().isNotEmpty) {
                              if (val.trim().isEmpty) {
                                return "Please enter your name";
                              }
                              return null;
                            }
                            return "Please enter your name";
                          },
                        ),
                        CommonMethods.sizedBox(height: 24.h),
                        AppTextFieldScreen(
                          controller: signUpController.emailController,
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
                        IntlPhoneField(
                          flagsButtonPadding: const EdgeInsets.all(10),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          dropdownIconPosition: IconPosition.trailing,
                          showCountryFlag: false,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: "Enter Phone Number",
                            hintStyle:  TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              color: AppTheme.getHintTextColor(context),

                            ),
                            labelText: 'Phone Number',
                            labelStyle: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              color: AppTheme.getTextColor(context),
                            ),
                            floatingLabelBehavior:
                            FloatingLabelBehavior.auto,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(16.r)),
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  style: BorderStyle.solid,
                                )),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(16.r)),
                                borderSide: const BorderSide(
                                  color: Color(0xFFC5C5C5),
                                  style: BorderStyle.solid,
                                )),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(16.r)),
                              borderSide: const BorderSide(
                                color: Color(0xFFC5C5C5),
                                style: BorderStyle.solid,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(16.r)),
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
                          dropdownIcon: const Icon(
                              CupertinoIcons.chevron_down,
                              size: 14),
                          initialCountryCode: 'IN',
                          onChanged: (phone) {
                            debugPrint(phone.completeNumber);
                          },
                          pickerDialogStyle: PickerDialogStyle(
                            backgroundColor: Colors.white,
                            countryNameStyle: TextStyle(
                                color: themeController.isDarkMode.value
                                    ? Colors.white
                                    : Colors.black),
                            countryCodeStyle: TextStyle(
                                color: themeController.isDarkMode.value
                                    ? Colors.white
                                    : Colors.black),
                            listTileDivider: Divider(
                                color: themeController.isDarkMode.value
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                        CommonMethods.sizedBox(height: 24.h),
                        GetBuilder<SignUpController>(
                          init: SignUpController(),
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
                        CommonMethods.sizedBox(height: 30.h),
                        GestureDetector(
                          onTap: () {
                            debugPrint(
                                "formKey-- ${formKey.currentState!.validate()}");
                            if (formKey.currentState!
                                .validate()) {
                              debugPrint("Success");
                              signUpController.clearText();
                              CommonMethods.sendToNextScreen(
                                  context, RoutesPath.loginPage);
                            }
                          },
                          child: const AppButton(
                            text: AppText.signup,
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
                                mainAxisAlignment:
                                MainAxisAlignment.center,
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
                                mainAxisAlignment:
                                MainAxisAlignment.center,
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
                          text: AppText.already,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'SF Pro Display',
                            color: AppTheme.getTextColor(context),
                          ),
                          children: [
                            TextSpan(
                              text: AppText.signIn,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  debugPrint('SUCCESS======');
                                  CommonMethods.sendToNextScreen(
                                      context, RoutesPath.loginPage);
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
    );
  }
}
