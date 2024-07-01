import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../res/common/app_methods.dart';
import '../../../res/theme/app_theme.dart';
import '../model/recent_recharge_model.dart';

// ignore: must_be_immutable
class RecentRechargeCommon extends StatefulWidget {
  RecentRechargeCommon({super.key, required this.modelData});
  RecentRechargeModel modelData;

  @override
  State<RecentRechargeCommon> createState() => _RecentRechargeCommonState();
}

class _RecentRechargeCommonState extends State<RecentRechargeCommon> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 54.h,
          width: 54.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.modelData.color,
          ),
          child: Center(
            child: CommonMethods.appTexts(
              context,
              widget.modelData.name!,
              fontSize: 26.sp,
              fontWeight: FontWeight.w400,
              color: widget.modelData.textColor,
            ),
          ),
        ),
        CommonMethods.sizedBox(height: 8.h),
        CommonMethods.appTexts(
          context,
          widget.modelData.title!,
          color: AppTheme.getTextColor(context),
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }
}
