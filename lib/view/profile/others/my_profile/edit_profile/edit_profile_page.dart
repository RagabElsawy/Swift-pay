import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import '../../../../../res/common/app_button.dart';
import '../../../../../res/common/app_methods.dart';
import '../../../../../res/common/app_textfield.dart';
import '../../../../../res/constant/app_strings.dart';
import '../../../../../res/theme/app_theme.dart';
import '../../../../../res/theme/controller/theme_controller.dart';
import '../../../../../utils/custom_country_picker.dart';
import '../../../../../utils/phone_num_field.dart';
import '../../../controller/profile_controller.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    const initialCountryCode = 'US';
    var country =
        countries.firstWhere((element) => element.code == initialCountryCode);
    return Scaffold(
      appBar: CommonMethods.appBar(
        onTap: () {
          CommonMethods.jumpOutFromScreen(context);
        },
        backgroundColor: AppTheme.getScaffoldColor(context),
        title: CommonMethods.appTexts(
          context,
          AppText.editProfile,
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
            CommonMethods.sizedBox(height: 10.h),
            Expanded(
              child: Padding(
                padding: CommonMethods.appPadding(),
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        height: 104.h,
                        width: 104.h,
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            CommonMethods.imagesOfApp(
                              AppImages.editProfile,
                              height: 104.h,
                              width: 104.h,
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                height: 34.h,
                                width: 34.h,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x40000000),
                                        spreadRadius: 0,
                                        blurRadius: 4,
                                        offset: Offset(0, 4),
                                      )
                                    ]),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(6.h),
                                    child: CommonMethods.imagesOfApp(
                                        AppImages.camera),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    CommonMethods.sizedBox(height: 38.h),
                    AppTextFieldScreen(
                      controller: profileController.nameController,
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
                            return "Please enter a valid password";
                          }
                          return null;
                        }
                        return "Please enter a valid password";
                      },
                    ),
                    CommonMethods.sizedBox(height: 24.h),
                    AppTextFieldScreen(
                      controller: profileController.emailController,
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
                    GetBuilder<ThemeController>(builder: (themeController) {
                      return IntlPhoneField(
                        flagsButtonPadding: const EdgeInsets.all(10),
                        style: TextStyle(
                          color: AppTheme.getTextColor(context),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(16),
                        ],
                        dropdownIconPosition: IconPosition.trailing,
                        showCountryFlag: false,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          isDense: true,
                          labelText: 'Phone Number',
                          labelStyle: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: AppTheme.getHintTextColor(context),
                          ),
                          hintText: "Phone Number",
                          hintStyle: TextStyle(
                            color: const Color(0xFFACAFB5),
                            height: 1.5,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w300,
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.r)),
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                style: BorderStyle.solid,
                              )),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.r)),
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
                        dropdownTextStyle:
                            TextStyle(color: AppTheme.getTextColor(context)),
                        disableLengthCheck: true,
                        dropdownIcon: Icon(
                          CupertinoIcons.chevron_down,
                          size: 14,
                          color: AppTheme.getTextColor(context),
                        ),
                        initialCountryCode: 'IN',
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
                        onChanged: (phone) {
                          if (phone.number.length >= country.minLength &&
                              phone.number.length <= country.maxLength) {
                            debugPrint(phone.completeNumber);
                          }
                        },
                      );
                    }),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                CommonMethods.jumpOutFromScreen(context);
              },
              child: Padding(
                padding: CommonMethods.appPadding(),
                child: const AppButton(
                  text: AppText.save,
                ),
              ),
            ),
            CommonMethods.sizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
