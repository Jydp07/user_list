import 'package:get/route_manager.dart';
import 'package:user_test/constant/app_routes.dart';
import 'package:user_test/views/screen/home/user_home_screen.dart';
import 'package:user_test/views/screen/splash/splash_screen.dart';
import 'package:user_test/views/screen/user_detail/user_details_screen.dart';

class AppRouter {
  static final pageList = [
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.userHomeScreen,
      page: () => UserHomeScreen(),
    ),
    GetPage(
      name: AppRoutes.userDetailsScreen,
      page: () => UserDetailsScreen(),
    )
  ];
}
