import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../data/app_data.dart';
import '../../../res/common/app_button.dart';
import '../../../res/common/app_methods.dart';
import '../../../res/constant/app_routes_path.dart';
import '../../../res/constant/app_strings.dart';
import '../../../res/theme/app_theme.dart';
import '../controller/movie_ticket_controller.dart';

class PaymentDetailPage extends StatefulWidget {
  const PaymentDetailPage({super.key});

  @override
  State<PaymentDetailPage> createState() => _PaymentDetailPageState();
}

class _PaymentDetailPageState extends State<PaymentDetailPage> {
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
          AppText.paymentDetails,
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
            CommonMethods.sizedBox(height: 30.h),
            Padding(
              padding: CommonMethods.appPadding(),
              child: CommonMethods.appTexts(
                context,
                AppText.paymentMethod,
                color: AppTheme.getTextColor(context),
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            CommonMethods.sizedBox(height: 16.h),
            GetBuilder(
              builder: (movieTicketController) {
                return SizedBox(
                  height: 352.h,
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: CommonMethods.appPadding(),
                    itemBuilder: (context, index) {
                      return animationFunction(
                        index,
                        GestureDetector(
                          onTap: () {
                            movieTicketController.selected.value = index;
                            movieTicketController.update();
                          },
                          child: Container(
                            height: 76.h,
                            decoration: CommonMethods.getBoxDecoration(
                              cornerRadius: 16.r,
                              color: movieTicketController.selected.value == index
                                  ? const Color(0xFFDBE5F2)
                                  : AppTheme.getCardColor(context),
                              borderColor:
                                  movieTicketController.selected.value == index
                                      ? AppTheme.getPrimaryColor(context)
                                      : Colors.transparent,
                            ),
                            child: Padding(
                              padding: CommonMethods.appPadding(),
                              child: Row(
                                children: [
                                  Container(
                                    width: 36.h,
                                    height: 36.h,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: Center(
                                      child: CommonMethods.imagesOfApp(
                                        paymentDetailDataList[index].image!,
                                        height: 24.h,
                                        width: 24.h,
                                      ),
                                    ),
                                  ),
                                  CommonMethods.sizedBox(width: 12.w),
                                  Expanded(
                                    child: CommonMethods.appTexts(
                                      context,
                                      paymentDetailDataList[index].name!,
                                      color: Colors.black,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Container(
                                    height: 24.h,
                                    width: 24.h,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: movieTicketController
                                                      .selected.value ==
                                                  index
                                              ? AppTheme.getPrimaryColor(context)
                                              : const Color(0x33ACAFB5),
                                          width: 1.5,
                                        )),
                                    child: movieTicketController.selected.value ==
                                            index
                                        ? Container(
                                            height: 10.h,
                                            width: 10.h,
                                            margin: EdgeInsets.all(3.5.w),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: movieTicketController
                                                          .selected.value ==
                                                      index
                                                  ? AppTheme.getPrimaryColor(
                                                      context)
                                                  : const Color(0x33ACAFB5),
                                            ),
                                          )
                                        : const SizedBox(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        CommonMethods.sizedBox(height: 16.h),
                    itemCount: paymentDetailDataList.length,
                  ),
                );
              },
              init: MovieTicketController(),
            ),
            CommonMethods.sizedBox(height: 16.h),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.add,
                    size: 24.h,
                    color: AppTheme.getTextColor(context),
                  ),
                  CommonMethods.appTexts(
                    context,
                    AppText.adACard,
                    color: AppTheme.getTextColor(context),
                    fontSize: 16.sp,
                    height: 1.5.h,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                CommonMethods.sendToNextScreen(
                    context, RoutesPath.recieptPage);
              },
              child: Padding(
                padding: CommonMethods.appPadding(),
                child: const AppButton(
                  text: AppText.payNow,
                ),
              ),
            ),
            CommonMethods.sizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
