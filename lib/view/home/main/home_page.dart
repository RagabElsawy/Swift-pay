import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recharge_ticket_booking_and_bill_app/res/common/app_methods.dart';
import 'package:recharge_ticket_booking_and_bill_app/res/theme/controller/theme_controller.dart';
import '../../../res/theme/app_theme.dart';
import '../../bottombar/controller/bottom_controller.dart';
import '../others/categories.dart';
import '../others/offers.dart';
import '../others/popular.dart';
import '../others/profile.dart';
import '../others/recent_trans.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BottomController bottomController = Get.put(BottomController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (themeController) {
        return Scaffold(
          appBar: CommonMethods.nullAppBar(
            context,
            statusBarColor: AppTheme.getScaffoldColor(context),
            statusBarBrightness: themeController.isDarkMode.value
                ? Brightness.light
                : Brightness.dark,
            statusBarIconBrightness: themeController.isDarkMode.value
                ? Brightness.light
                : Brightness.dark,
          ),
          body: SafeArea(
            child: ListView(
              children: const [
                ProfileRow(),
                OffersList(),
                Categories(),
                PopularTransaction(),
                RecentTransaction(),
              ],
            ),
          ),
        );
      },
      init: ThemeController(),
    );
  }
}
