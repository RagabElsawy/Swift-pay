import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:recharge_ticket_booking_and_bill_app/res/theme/controller/theme_controller.dart';
import '../../../../../data/app_data.dart';
import '../../../../../res/common/app_button.dart';
import '../../../../../res/common/app_methods.dart';
import '../../../../../res/constant/app_routes_path.dart';
import '../../../../../res/constant/app_strings.dart';
import '../../../../../res/theme/app_theme.dart';
import 'common/cards_common.dart';

class MyCardsPage extends StatefulWidget {
  const MyCardsPage({super.key});

  @override
  State<MyCardsPage> createState() => _MyCardsPageState();
}

class _MyCardsPageState extends State<MyCardsPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (themeController) {
        return Scaffold(
          appBar: CommonMethods.appBar(
            onTap: () {
              CommonMethods.jumpOutFromScreen(context);
            },
             backgroundColor: AppTheme.getScaffoldColor(context),
            title: CommonMethods.appTexts(
              context,
              AppText.myCards,
              color: AppTheme.getTextColor(context),
              fontSize: 28.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: CommonMethods.appPadding(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonMethods.sizedBox(height: 16.h),
                  CommonMethods.appTexts(
                    context,
                    AppText.paymentMethod,
                    color: AppTheme.getTextColor(context),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  CommonMethods.sizedBox(height: 16.h),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return animationFunction(
                          index,
                          CardsCommon(
                            image: cardDataList[index].image,
                            card: cardDataList[index].card,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          CommonMethods.sizedBox(height: 16.h),
                      itemCount: 4,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      CommonMethods.sendToNextScreen(context, RoutesPath.addNewCardPage);
                    },
                    child: const AppButton(
                      text: AppText.addCard,
                    ),
                  ),
                  CommonMethods.sizedBox(height: 40.h),
                ],
              ),
            ),
          ),
        );
      },
      init: ThemeController(),
    );
  }
}
