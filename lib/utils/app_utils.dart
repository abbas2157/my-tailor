import 'package:get/get.dart';

class AppUtils {
  static void showSnackBar(String message) {
    Get.showSnackbar(GetSnackBar(
      message: message,
    ));
  }
}
