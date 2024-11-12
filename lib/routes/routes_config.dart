import 'package:get/get.dart';
import 'package:my_tailor/routes/routes_name.dart';
import 'package:my_tailor/view/forgetPassword_screen.dart';
import 'package:my_tailor/view/login_screen.dart';
import 'package:my_tailor/view/pswrd_rcvr_successfully.dart';
import 'package:my_tailor/view/screens/addFromGallery_screen.dart';
import 'package:my_tailor/view/screens/addNewClient_screen.dart';
import 'package:my_tailor/view/screens/languages_screen.dart';
import 'package:my_tailor/view/screens/notificatiions_screen.dart';
import 'package:my_tailor/view/screens/orders_screen.dart';
import 'package:my_tailor/view/screens/profile_screen.dart';
import 'package:my_tailor/view/screens/rootPage.dart';
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
      ),
      GetPage(
        name: RouteNames.rootPage,
        page: () => RootPage(),
      ),
      GetPage(
        name: RouteNames.signUpScreen,
        page: () => SignUpScreen(),
      ),
      GetPage(
        name: RouteNames.forgetPassword,
        page: () => ForgetpasswordScreen(),
      ),
      GetPage(
        name: RouteNames.setNewPassword,
        page: () => const SetNewPassword(),
      ),

      GetPage(
        name: RouteNames.profileScreen,
        page: () => ProfileScreen(),
      ),
      GetPage(
        name: RouteNames.notification,
        page: () => NotificatiionsScreen(),
      ),
      GetPage(
        name: RouteNames.language,
        page: () => LanguagesScreen(),
      ),
      // GetPage(
      //   name: RouteNames.otpVerficarion,

      //   ///need some changes
      //   page: () => Otpverification(
      //     userModel: UserModel(),
      //     isForSignup: false,
      //   ),
      //   middlewares: [MyMiddelware()],
      // ),
      GetPage(
        name: RouteNames.addFromGallery,
        page: () => const AddfromgalleryScreen(),
      ),
      GetPage(
        name: RouteNames.addNewClient,
        page: () => const AddnewclientScreen(),
      ),
      GetPage(
        name: RouteNames.passwordRecoverScreen,
        page: () => PswrdRcvrSuccessfully(),
      ),
      GetPage(
        name: RouteNames.ordersScreen,
        page: () => OrdersScreen(),
      ),
    ];
