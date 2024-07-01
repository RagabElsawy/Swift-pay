import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/app_data.dart';
import '../../../res/common/app_methods.dart';
import '../../../res/constant/app_routes_path.dart';
import '../../../res/constant/app_strings.dart';
import '../../../res/theme/app_theme.dart';
import '../../home/common/trans_common.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonMethods.appBar(
        onTap: () {
          Navigator.pushNamedAndRemoveUntil(
              context, RoutesPath.bottomBarPage, (route) => false);
        },
        backgroundColor: AppTheme.getScaffoldColor(context),
        title: CommonMethods.appTexts(
          context,
          AppText.recent,
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
              child: ListView.separated(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.only(
                  bottom: 16.r,
                  right: 16.r,
                  left: 16.r,
                ),
                itemBuilder: (context, index) {
                  return animationFunction(
                    index,
                     TransactionsCommon(
                      title: recentTransDataList[index].title,
                      image: recentTransDataList[index].image,
                      price: recentTransDataList[index].price,
                      color: recentTransDataList[index].color,
                      des: recentTransDataList[index].des,
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    CommonMethods.sizedBox(height: 16.h),
                itemCount: recentTransDataList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
