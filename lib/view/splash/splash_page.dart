import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:recharge_ticket_booking_and_bill_app/res/common/app_methods.dart';
import 'package:recharge_ticket_booking_and_bill_app/res/constant/app_strings.dart';

import '../../res/theme/app_theme.dart';
import 'controller/splash_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.getScaffoldColor(context),
      appBar: CommonMethods.nullAppBar(
        context,
        statusBarColor: Colors.white,
      ),
      body: Center(
        child: CommonMethods.imagesOfApp(
          AppImages.splashLogo,
          height: 147.h,
          width: 147.h,
        ),
      ),
    );
  }
}
