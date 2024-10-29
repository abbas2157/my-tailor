import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:my_tailor/models/user_model.dart';
import 'package:my_tailor/routes/routes_name.dart';
import 'package:my_tailor/view/forgetPassword_screen.dart';
import 'package:my_tailor/view/login_screen.dart';
import 'package:my_tailor/view/otpVerification.dart';
import 'package:my_tailor/view/pswrd_rcvr_successfully.dart';
import 'package:my_tailor/view/screens/addFromGallery_screen.dart';
import 'package:my_tailor/view/screens/addNewClient_screen.dart';
import 'package:my_tailor/view/screens/orders_screen.dart';
import 'package:my_tailor/view/set_new_password.dart';
import 'package:my_tailor/view/signUp_screen.dart';
import 'package:my_tailor/view/splash_screen.dart';

appRoutes() => [
      GetPage(
        name: RouteNames.splashScreen,
        page: () => const SplashScreen(),
      ),
      GetPage(
        name: RouteNames.loginScreen,
        page: () => LoginScreen(),
        middlewares: [MyMiddelware()],
      ),
      GetPage(
        name: RouteNames.signUpScreen,
        page: () => SignUpScreen(),
        middlewares: [MyMiddelware()],
      ),
      GetPage(
        name: RouteNames.forgetPassword,
        page: () => ForgetpasswordScreen(),
        middlewares: [MyMiddelware()],
      ),
      GetPage(
        name: RouteNames.setNewPassword,
        page: () => const SetNewPassword(),
        middlewares: [MyMiddelware()],
      ),
      GetPage(
        name: RouteNames.otpVerficarion,

        ///need some changes
        page: () => Otpverification(
          userModel: UserModel(),
          isForSignup: false,
        ),
        middlewares: [MyMiddelware()],
      ),
      GetPage(
        name: RouteNames.addFromGallery,
        page: () => const AddfromgalleryScreen(),
        middlewares: [MyMiddelware()],
      ),
      GetPage(
        name: RouteNames.addNewClient,
        page: () => const AddnewclientScreen(),
        middlewares: [MyMiddelware()],
      ),
      GetPage(
        name: RouteNames.passwordRecoverScreen,
        page: () => PswrdRcvrSuccessfully(),
        middlewares: [MyMiddelware()],
      ),
      GetPage(
        name: RouteNames.ordersScreen,
        page: () => OrdersScreen(),
        middlewares: [MyMiddelware()],
      ),
    ];

class MyMiddelware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    if (kDebugMode) {
      print(page?.name);
    }
    return super.onPageCalled(page);
  }
}
