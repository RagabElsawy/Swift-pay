import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/app_data.dart';
import '../../../res/common/app_methods.dart';
import '../../../res/constant/app_strings.dart';
import '../../../res/theme/app_theme.dart';
import '../common/detail_row_common.dart';

class TransactionDetailPage extends StatefulWidget {
  const TransactionDetailPage({super.key});

  @override
  State<TransactionDetailPage> createState() => _TransactionDetailPageState();
}

class _TransactionDetailPageState extends State<TransactionDetailPage> {
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
          AppText.transDetail,
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
            CommonMethods.sizedBox(height: 16.h),
            Padding(
              padding: CommonMethods.appPadding(),
              child: Column(
                children: [
                  Container(
                    height: 94.h,
                    decoration: CommonMethods.getBoxDecoration(
                      color: const Color(0xFFFEEDDA),
                      cornerRadius: 12.r,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 16.h,
                        left: 16.w,
                        right: 9.w,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonMethods.imagesOfApp(AppImages.mobilePhone),
                          CommonMethods.sizedBox(width: 16.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonMethods.appTexts(
                                  context,
                                  AppText.priceTwo,
                                  color: Colors.black,
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                                CommonMethods.sizedBox(height: 8.h),
                                CommonMethods.appTexts(
                                  context,
                                  AppText.cameronWilliamson,
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 35.h,
                            padding: CommonMethods.appPadding(),
                            decoration: CommonMethods.getBoxDecoration(
                              cornerRadius: 12.r,
                              color: Colors.white,
                            ),
                            child: Center(
                              child: CommonMethods.appTexts(
                                context,
                                AppText.recharge,
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  CommonMethods.sizedBox(height: 24.h),
                  Container(
                    height: 224.h,
                    decoration: CommonMethods.getBoxDecoration(
                      cornerRadius: 12.r,
                      color: AppTheme.getCardColor(context),
                    ),
                    child: ListView.separated(
                      primary: true,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.all(16.h),
                      itemBuilder: (context, index) {
                        return DetailRowCommon(
                          type: transactionDetailList[index].type,
                          detail: transactionDetailList[index].detail,
                        );
                      },
                      separatorBuilder: (context, index) =>
                          CommonMethods.sizedBox(height: 24.h),
                      itemCount: transactionDetailList.length,
                    ),
                  ),
                  CommonMethods.sizedBox(height: 24.h),
                  Container(
                    height: 135.h,
                    decoration: CommonMethods.getBoxDecoration(
                      cornerRadius: 12.r,
                      color: AppTheme.getCardColor(context),
                    ),
                    child: ListView.separated(
                      primary: true,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.all(16.h),
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Expanded(
                              child: CommonMethods.appTexts(
                                context,
                                billingDataList[index].type!,
                                color: AppTheme.getHintTextColor(context),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            CommonMethods.appTexts(
                              context,
                              billingDataList[index].detail!,
                              color: AppTheme.getTextColor(context),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) =>
                          CommonMethods.sizedBox(height: 24.h),
                      itemCount:  billingDataList.length,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
