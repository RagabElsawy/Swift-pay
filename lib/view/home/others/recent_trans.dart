import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:recharge_ticket_booking_and_bill_app/view/home/controller/home_controller.dart';
import '../../../res/common/app_methods.dart';
import '../../../res/constant/app_strings.dart';
import '../../../res/theme/app_theme.dart';
import '../../bottombar/controller/bottom_controller.dart';
import '../common/trans_common.dart';

class RecentTransaction extends StatelessWidget {
  const RecentTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomController>(
      init: BottomController(),
      builder: (controller) => GetBuilder(
        builder: (homeController) {
          return Padding(
            padding: CommonMethods.appPadding(),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CommonMethods.appTexts(
                        context,
                        AppText.recent,
                        color: AppTheme.getTextColor(context),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.selectedIndex.value = 1;
                        controller.update();
                        // CommonMethods.sendToNextScreen(
                        //     context, RoutesPath.transactionPage);
                      },
                      child: CommonMethods.appTexts(
                        context,
                        AppText.viewAll,
                        color: AppTheme.getTextColor(context),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                CommonMethods.sizedBox(height: 16.h),
                ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  primary: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return animationFunction(
                      index,
                      // ignore: prefer_const_constructors
                      slideDuration: Duration(seconds: 2),
                      TransactionsCommon(
                        title: homeController.transactionList[index].title,
                        image: homeController.transactionList[index].image,
                        price: homeController.transactionList[index].price,
                        color: homeController.transactionList[index].color,
                        des: homeController.transactionList[index].des,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      CommonMethods.sizedBox(height: 16.h),
                  itemCount: homeController.transactionList.length,
                ),
                CommonMethods.sizedBox(height: 20.h),
              ],
            ),
          );
        },
        init: HomeController(),
      ),
    );
  }
}
