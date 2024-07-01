import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../res/common/app_methods.dart';
import '../../../../../../res/theme/app_theme.dart';

class CardsCommon extends StatelessWidget {
  final String? image;
  final String? card;
  const CardsCommon({super.key, this.image, this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76.h,
      decoration: CommonMethods.getBoxDecoration(
        cornerRadius: 16.r,
        color: AppTheme.getCardColor(context),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 26.w),
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
                  image!,
                  height: 24.h,
                  width: 24.h,
                ),
              ),
            ),
            CommonMethods.sizedBox(width: 12.w),
            CommonMethods.appTexts(
              context,
              card!,
              color: AppTheme.getTextColor(context),
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
      ),
    );
  }
}
