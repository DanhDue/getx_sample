import 'package:get/get.dart';

import '../modules/checkin/bindings/checkin_binding.dart';
import '../modules/checkin/views/checkin_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/infiniteListSample/bindings/infinite_list_sample_binding.dart';
import '../modules/infiniteListSample/views/infinite_list_sample_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/personal/bindings/personal_binding.dart';
import '../modules/personal/views/personal_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/tea_home/bindings/tea_home_binding.dart';
import '../modules/tea_home/views/tea_home_view.dart';

// Copyright (c) 2023, one of the D3F outsourcing projects. All rights reserved.

// coverage:ignore-file

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(bindingCreator: () => HomeBinding()),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.CHECKIN,
      page: () => CheckinView(bindingCreator: () => CheckinBinding()),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.PERSONAL,
      page: () => PersonalView(bindingCreator: () => PersonalBinding()),
    ),
    GetPage(
      name: _Paths.INFINITE_LIST_SAMPLE,
      page: () => InfiniteListSampleView(),
      binding: InfiniteListSampleBinding(),
    ),
    GetPage(
      name: _Paths.TEA_HOME,
      page: () => TeaHomeView(),
      binding: TeaHomeBinding(),
    ),
  ];
}
