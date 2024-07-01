import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  RxBool obSecureText = true.obs;

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
  }


  void clearText() {
    emailController.clear();
    passwordController.clear();
    nameController.clear();
    update();
  }
}
