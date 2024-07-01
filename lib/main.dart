//developer by: Ragab Elsawy
// E-mail: ragabelsawy92@gmail.com

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:recharge_ticket_booking_and_bill_app/res/constant/app_routes_path.dart';
import 'package:recharge_ticket_booking_and_bill_app/res/theme/app_theme.dart';
import 'package:recharge_ticket_booking_and_bill_app/res/theme/controller/theme_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetBuilder(
          builder: (themeController) {
            return GetMaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              darkTheme: AppTheme.getDarkTheme(context),
              themeMode: themeController.isDarkMode.value
                  ? ThemeMode.dark
                  : ThemeMode.light,
              theme: themeController.isDarkMode.value
                  ? AppTheme.getDarkTheme(context)
                  : AppTheme.getLightTheme(context),
              routes: RoutesPath.routes,
              initialRoute: RoutesPath.splashPage,
              onGenerateRoute: (settings) {
                return RoutesPath.routesFactory(settings);
              },
            );
          },
          init: ThemeController(),
        );
      },
    );
  }
}
