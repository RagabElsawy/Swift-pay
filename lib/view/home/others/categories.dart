import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:recharge_ticket_booking_and_bill_app/data/app_data.dart';
import 'package:recharge_ticket_booking_and_bill_app/view/home/controller/home_controller.dart';
import '../../../res/common/app_methods.dart';
import '../../../res/constant/app_routes_path.dart';
import '../../../res/constant/app_strings.dart';
import '../../../res/theme/app_theme.dart';
import '../../categories/common/categories_common.dart';
import '../model/categoires_model.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
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
                      AppText.categories,
                      color: AppTheme.getTextColor(context),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      CommonMethods.sendToNextScreen(
                          context, RoutesPath.categoriesPage);
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
              SizedBox(
                height: 115.h,
                child: GridView.builder(
                  primary: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: categoriesDataList.length,
                  itemBuilder: (context, index) {
                    CategoriesModel categoriesData = categoriesDataList[index];
                    return animationFunction(
                      index,
                      CategoriesCommon(
                        modelData: categoriesData,
                      ),
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisExtent: 115.h,
                  ),
                ),
              ),
              CommonMethods.sizedBox(height: 24.h),
            ],
          ),
        );
      },
      init: HomeController(),
    );
  }
}
