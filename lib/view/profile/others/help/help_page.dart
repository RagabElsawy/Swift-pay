import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/app_data.dart';
import '../../../../res/common/app_methods.dart';
import '../../../../res/constant/app_strings.dart';
import '../../../../res/theme/app_theme.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
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
          AppText.help,
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
            CommonMethods.sizedBox(height: 24.h),
            Expanded(
              child: ListView.separated(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: CommonMethods.appPadding(),
                itemBuilder: (context, index) {
                  return animationFunction(
                    index,
                   Theme(
                      data: Theme.of(context).copyWith(
                          dividerColor: Colors.transparent,
                          expansionTileTheme: ExpansionTileThemeData(
                            iconColor: AppTheme.getTextColor(context),
                            collapsedIconColor: AppTheme.getTextColor(context),
                          )),
                      child: Container(
                        decoration: CommonMethods.getBoxDecoration(
                          cornerRadius: 12.r,
                          borderColor: AppTheme.getDividerColor(context),
                          color: AppTheme.getScaffoldColor(context),
                        ),
                        child: ExpansionTile(
                          title: CommonMethods.appTexts(
                            context,
                            helpDataList[index].que!,
                            color: AppTheme.getTextColor(context),
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                          ),
                          children: [
                            CommonMethods.appTexts(
                              context,
                              AppText.answer,
                              color: AppTheme.getTextColor(context),
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,
                              height: 1.5.h
                            ),
                            CommonMethods.sizedBox(height: 16.h),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) =>  CommonMethods.sizedBox(height: 16.h),
                itemCount: helpDataList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
