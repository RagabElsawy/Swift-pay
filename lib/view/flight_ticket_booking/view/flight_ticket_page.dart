import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:recharge_ticket_booking_and_bill_app/res/common/app_methods.dart';
import 'package:recharge_ticket_booking_and_bill_app/res/theme/app_theme.dart';

import '../../../data/app_data.dart';
import '../../../res/common/app_button.dart';
import '../../../res/common/app_textfield.dart';
import '../../../res/constant/app_routes_path.dart';
import '../../../res/constant/app_strings.dart';
import '../controller/flight_ticket_controller.dart';

class FlightTicketPage extends StatefulWidget {
  const FlightTicketPage({super.key});

  @override
  State<FlightTicketPage> createState() => _FlightTicketPageState();
}

class _FlightTicketPageState extends State<FlightTicketPage> {
  FlightTicketController flightTicketController =
      Get.put(FlightTicketController());

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
          AppText.flightTicket,
          color: AppTheme.getTextColor(context),
          fontSize: 28.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: SafeArea(
        child: GetBuilder<FlightTicketController>(
          init: FlightTicketController(),
          builder: (controller) => Column(
            children: [
              Divider(
                color: AppTheme.getDividerColor(context),
              ),
              CommonMethods.sizedBox(height: 16.h),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: CommonMethods.appPadding(),
                      padding: EdgeInsets.all(16.h),
                      decoration: CommonMethods.getBoxDecoration(
                        cornerRadius: 16.r,
                        color: AppTheme.getScaffoldColor(context),
                        shadows: [
                          const BoxShadow(
                            color: Color(0x14000000),
                            blurRadius: 17,
                            spreadRadius: 0,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Form(
                        key: controller.formKey,
                        child: Column(
                          children: [
                            GetBuilder<FlightTicketController>(
                              builder: (controller) {
                                return SizedBox(
                                  height: 24.h,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return GetBuilder<FlightTicketController>(
                                        builder: (flightTicketController) {
                                          return GestureDetector(
                                            onTap: () {
                                              flightTicketController
                                                  .setCurrentIndex(index);
                                            },
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 24.h,
                                                  width: 24.h,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color: flightTicketController
                                                                    .select ==
                                                                index
                                                            ? AppTheme
                                                                .getPrimaryColor(
                                                                    context)
                                                            : const Color(
                                                                0xFFC5C5C5),
                                                        width: 1.5,
                                                      )),
                                                  child: flightTicketController
                                                              .select ==
                                                          index
                                                      ? Container(
                                                          height: 10.h,
                                                          width: 10.h,
                                                          margin:
                                                              EdgeInsets.all(
                                                                  3.5.w),
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: flightTicketController
                                                                        .select ==
                                                                    index
                                                                ? AppTheme
                                                                    .getPrimaryColor(
                                                                        context)
                                                                : const Color(
                                                                    0x33ACAFB5),
                                                          ),
                                                        )
                                                      : const SizedBox(),
                                                ),
                                                CommonMethods.sizedBox(
                                                    width: 5.w),
                                                CommonMethods.appTexts(
                                                  context,
                                                  flightTicketDataList[index]
                                                      .name!,
                                                  color: flightTicketController
                                                              .select ==
                                                          index
                                                      ? AppTheme
                                                          .getPrimaryColor(
                                                              context)
                                                      : const Color(0xFF808080),
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                        init: FlightTicketController(),
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        CommonMethods.sizedBox(width: 16.w),
                                    itemCount: 2,
                                  ),
                                );
                              },
                              init: FlightTicketController(),
                            ),
                            CommonMethods.sizedBox(height: 40.h),
                            Column(
                              children: [
                                Stack(
                                  children: [
                                    Column(
                                      children: [
                                        AppTextFieldScreen(
                                          controller: controller.fromController,
                                          isDense: true,
                                          hintText: AppText.from,
                                          label: CommonMethods.appTexts(
                                            context,
                                            AppText.from,
                                          ),
                                          textInputType: TextInputType.name,
                                          keyboardType: TextInputAction.next,
                                          validator: (val) {
                                            if (val!.trim().isNotEmpty) {
                                              if (val.trim().isEmpty) {
                                                return "Enter From Destination";
                                              }
                                              return null;
                                            }
                                            return "enter from destination";
                                          },
                                        ),
                                        CommonMethods.sizedBox(height: 16.h),
                                        AppTextFieldScreen(
                                          controller: controller.toController,
                                          isDense: true,
                                          hintText: AppText.to,
                                          label: CommonMethods.appTexts(
                                            context,
                                            AppText.to,
                                          ),
                                          textInputType: TextInputType.name,
                                          keyboardType: TextInputAction.next,
                                          validator: (val) {
                                            if (val!.trim().isNotEmpty) {
                                              if (val.trim().isEmpty) {
                                                return "Enter To Destination";
                                              }
                                              return null;
                                            }
                                            return "enter to destination";
                                          },
                                        ),
                                      ],
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        height: 49.h,
                                        width: 49.h,
                                        margin: EdgeInsets.only(top: 35.h),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                              AppTheme.getPrimaryColor(context),
                                        ),
                                        child: Center(
                                          child: CommonMethods.imagesOfApp(
                                            AppImages.icSwap,
                                            height: 20.h,
                                            width: 20.w,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                CommonMethods.sizedBox(height: 16.h),
                                controller.select == 0
                                    ? Column(
                                        children: [
                                          GetBuilder(
                                            builder: (flightTicketController) {
                                              return AppTextFieldScreen(
                                                isDense: true,
                                                controller:
                                                    flightTicketController
                                                        .dateController,
                                                hintText: AppText.date,
                                                label: CommonMethods.appTexts(
                                                  context,
                                                  AppText.date,
                                                ),
                                                textInputType:
                                                    TextInputType.phone,
                                                keyboardType:
                                                    TextInputAction.next,
                                                prefixIcon: Padding(
                                                  padding: EdgeInsets.all(10.h),
                                                  child:
                                                      CommonMethods.imagesOfApp(
                                                    AppImages.calendar,
                                                    color: AppTheme
                                                        .getPrimaryColor(
                                                            context),
                                                    height: 24.h,
                                                    width: 24.w,
                                                  ),
                                                ),
                                                validator: (val) {
                                                  if (val!.trim().isNotEmpty) {
                                                    if (val.trim().isEmpty) {
                                                      return "Select Date";
                                                    }
                                                    return null;
                                                  }
                                                  return "select date";
                                                },
                                                readOnly: true,
                                                onTap: () async {
                                                  DateTime? pickedDate =
                                                      await showDatePicker(
                                                          context: context,
                                                          initialDate:
                                                              DateTime.now(),
                                                          firstDate:
                                                              DateTime(2023),
                                                          lastDate:
                                                              DateTime(2101));
                                                  if (pickedDate != null) {
                                                    flightTicketController
                                                        .getDate(DateFormat
                                                                .yMMMMd()
                                                            .format(
                                                                pickedDate));
                                                  } else {
                                                    debugPrint(
                                                        "Date is not selected");
                                                  }
                                                },
                                              );
                                            },
                                            init: FlightTicketController(),
                                          ),
                                          CommonMethods.sizedBox(height: 16.h),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: AppTextFieldScreen(
                                                  controller:
                                                      controller.passController,
                                                  isDense: true,
                                                  hintText: AppText.pass,
                                                  label: CommonMethods.appTexts(
                                                    context,
                                                    AppText.pass,
                                                  ),
                                                  prefixIcon: Padding(
                                                    padding:
                                                        EdgeInsets.all(10.h),
                                                    child: CommonMethods
                                                        .imagesOfApp(
                                                      AppImages.user,
                                                      color: AppTheme
                                                          .getPrimaryColor(
                                                              context),
                                                      height: 24.h,
                                                      width: 24.w,
                                                    ),
                                                  ),
                                                  readOnly: true,
                                                  keyboardType:
                                                      TextInputAction.next,
                                                ),
                                              ),
                                              CommonMethods.sizedBox(
                                                  width: 16.w),
                                              Expanded(
                                                child: AppTextFieldScreen(
                                                  controller: controller
                                                      .classController,
                                                  isDense: true,
                                                  hintText: AppText.flightClass,
                                                  label: CommonMethods.appTexts(
                                                    context,
                                                    AppText.flightClass,
                                                  ),
                                                  prefixIcon: Padding(
                                                    padding:
                                                        EdgeInsets.all(12.h),
                                                    child: CommonMethods
                                                        .imagesOfApp(
                                                      AppImages.classSeat,
                                                      color: AppTheme
                                                          .getPrimaryColor(
                                                              context),
                                                      height: 24.h,
                                                      width: 24.w,
                                                    ),
                                                  ),
                                                  readOnly: true,
                                                  keyboardType:
                                                      TextInputAction.next,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    : Row(
                                        children: [
                                          Expanded(
                                            child: GetBuilder(
                                              builder:
                                                  (flightTicketController) {
                                                return AppTextFieldScreen(
                                                  isDense: true,
                                                  controller:
                                                      flightTicketController
                                                          .startController,
                                                  hintText: AppText.date,
                                                  label: CommonMethods.appTexts(
                                                    context,
                                                    AppText.date,
                                                  ),
                                                  textInputType:
                                                      TextInputType.phone,
                                                  keyboardType:
                                                      TextInputAction.next,
                                                  prefixIcon: Padding(
                                                    padding:
                                                        EdgeInsets.all(10.h),
                                                    child: CommonMethods
                                                        .imagesOfApp(
                                                      AppImages.calendar,
                                                      color: AppTheme
                                                          .getPrimaryColor(
                                                              context),
                                                      height: 24.h,
                                                      width: 24.w,
                                                    ),
                                                  ),
                                                  validator: (val) {
                                                    if (val!
                                                        .trim()
                                                        .isNotEmpty) {
                                                      if (val.trim().isEmpty) {
                                                        return "Select Date";
                                                      }
                                                      return null;
                                                    }
                                                    return "select date";
                                                  },
                                                  readOnly: true,
                                                  onTap: () async {
                                                    DateTime? pickedDate =
                                                        await showDatePicker(
                                                            context: context,
                                                            initialDate:
                                                                DateTime.now(),
                                                            firstDate:
                                                                DateTime(2023),
                                                            lastDate:
                                                                DateTime(2101));
                                                    if (pickedDate != null) {
                                                      flightTicketController
                                                          .getStartDate(DateFormat
                                                                  .yMMMMd()
                                                              .format(
                                                                  pickedDate));
                                                    } else {
                                                      debugPrint(
                                                          "Date is not selected");
                                                    }
                                                  },
                                                );
                                              },
                                              init: FlightTicketController(),
                                            ),
                                          ),
                                          CommonMethods.sizedBox(width: 16.w),
                                          Expanded(
                                            child: GetBuilder(
                                              builder:
                                                  (flightTicketController) {
                                                return AppTextFieldScreen(
                                                  isDense: true,
                                                  controller:
                                                      flightTicketController
                                                          .endController,
                                                  hintText: AppText.date,
                                                  label: CommonMethods.appTexts(
                                                    context,
                                                    AppText.date,
                                                  ),
                                                  textInputType:
                                                      TextInputType.phone,
                                                  keyboardType:
                                                      TextInputAction.next,
                                                  prefixIcon: Padding(
                                                    padding:
                                                        EdgeInsets.all(10.h),
                                                    child: CommonMethods
                                                        .imagesOfApp(
                                                      AppImages.calendar,
                                                      color: AppTheme
                                                          .getPrimaryColor(
                                                              context),
                                                      height: 24.h,
                                                      width: 24.w,
                                                    ),
                                                  ),
                                                  validator: (val) {
                                                    if (val!
                                                        .trim()
                                                        .isNotEmpty) {
                                                      if (val.trim().isEmpty) {
                                                        return "Select Date";
                                                      }
                                                      return null;
                                                    }
                                                    return "select date";
                                                  },
                                                  readOnly: true,
                                                  onTap: () async {
                                                    DateTime? pickedDate =
                                                        await showDatePicker(
                                                            context: context,
                                                            initialDate:
                                                                DateTime.now(),
                                                            firstDate:
                                                                DateTime(2023),
                                                            lastDate:
                                                                DateTime(2101));
                                                    if (pickedDate != null) {
                                                      flightTicketController
                                                          .getEndDate(DateFormat
                                                                  .yMMMMd()
                                                              .format(
                                                                  pickedDate));
                                                    } else {
                                                      debugPrint(
                                                          "Date is not selected");
                                                    }
                                                  },
                                                );
                                              },
                                              init: FlightTicketController(),
                                            ),
                                          ),
                                        ],
                                      ),
                                CommonMethods.sizedBox(height: 24.h),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                if (controller.formKey.currentState!
                                    .validate()) {
                                  CommonMethods.sendToNextScreen(
                                      context, RoutesPath.searchFlightPage);
                                }
                              },
                              child: const AppButton(
                                text: AppText.search,
                              ),
                            ),
                            CommonMethods.sizedBox(height: 8.h),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
