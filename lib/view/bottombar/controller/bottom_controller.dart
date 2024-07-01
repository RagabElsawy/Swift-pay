import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../home/main/home_page.dart';
import '../../notification/main/notification_page.dart';
import '../../profile/main/profile_page.dart';
import '../../transaction/main/transaction_page.dart';

class BottomController extends GetxController {
  RxInt selectedIndex = 0.obs;
  List<Widget> screenList = <Widget>[];

  getData() {
    screenList = <Widget>[
      const HomePage(),
      const TransactionPage(),
      const NotificationPage(),
      const ProfilePage(),
    ];
    selectedIndex.value = 0;
  }

  void onItemTapped(int index) {
    selectedIndex.value = index;
    update();
  }

  onExit() {
    if (selectedIndex.value != 0) {
      selectedIndex.value = 0;
      update();
    } else {
      if (Platform.isIOS) {
        exit(0);
      } else {
        SystemNavigator.pop();
      }
    }
  }
}
