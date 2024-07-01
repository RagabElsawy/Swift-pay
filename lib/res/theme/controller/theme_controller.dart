import 'package:get/get.dart';
import '../../../data/pref_data.dart';

class ThemeController extends GetxController {
  RxBool isDarkMode = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    setThemeData();
    super.onInit();
  }

  setThemeData() async {
    isDarkMode.value = await PrefData.getDarkMode();
  }

  changeTheme() async {
    isDarkMode.value = !isDarkMode.value;
    update();
  }
}
