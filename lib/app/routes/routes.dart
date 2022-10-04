import 'package:get/get.dart';
import 'package:getx_sample/screens/dashboard/dashboard_binding.dart';
import 'package:getx_sample/screens/dashboard/dashboard_page.dart';
import 'package:getx_sample/screens/home/home_binding.dart';
import 'package:getx_sample/screens/home/home_page.dart';
import 'package:getx_sample/screens/login/login_binding.dart';
import 'package:getx_sample/screens/login/login_page.dart';
import 'package:getx_sample/screens/splash/splash_page.dart';

import 'links.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: AppLinks.splash, page: () => const SplashPage()),
    GetPage(
        name: AppLinks.dashboard,
        page: () => DashboardPage(),
        binding: DashboardBinding()),
    GetPage(
        name: AppLinks.home,
        page: () => HomePage(),
        binding: HomeBinding()),
    GetPage(
        name: AppLinks.login,
        page: () => LoginPage(),
        binding: LoginBinding()),
  ];
}
