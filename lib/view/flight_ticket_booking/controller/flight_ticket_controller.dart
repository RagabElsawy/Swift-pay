import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlightTicketController extends GetxController {
  RxInt selected = 0.obs;
  int select = 0;
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController passController =
      TextEditingController(text: "1 Passenger");
  TextEditingController classController =
      TextEditingController(text: "Economy");
  TextEditingController startController = TextEditingController();
  TextEditingController endController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String formattedDate = "";
  bool isNavigationBookingDetail = false;

  getDate(String format) {
    formattedDate = format;
    dateController.text = formattedDate;
    update();
  }

  getStartDate(String format) {
    formattedDate = format;
    startController.text = formattedDate;
    update();
  }

  getEndDate(String format) {
    formattedDate = format;
    endController.text = formattedDate;
    update();
  }

  setCurrentIndex(value) {
    select = value;
    update();
  }

  void setNavigation(bool value) {
    isNavigationBookingDetail = value;
    update();
  }
}
