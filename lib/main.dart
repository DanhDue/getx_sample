// Copyright (c) 2023, one of the D3F outsourcing projects. All rights reserved.

import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:getx_sample/app/app_global_bindings.dart';
import 'package:getx_sample/generated/locales.g.dart';
import 'package:getx_sample/styles/theme_extensions.dart';
import 'package:getx_sample/utils/constants.dart';
import 'package:getx_sample/widgets/no_thumb_scroll_behavior.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/routes/app_pages.dart';
import 'widgets/easy_loading_animation.dart';

Future<void> main() async {
  Fimber.plantTree(DebugTree(useColors: true));
  Fimber.plantTree(DebugTree.elapsed());

  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(GetMaterialApp(
            color: Colors.transparent,
            theme: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                focusColor: Colors.transparent,
                brightness: Brightness.light,
                extensions: [ThemeExtensions.light]),
            darkTheme: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                focusColor: Colors.transparent,
                brightness: Brightness.dark,
                extensions: [ThemeExtensions.dark]),
            themeMode: ThemeMode.light,
            debugShowCheckedModeBanner: false,
            translationsKeys: AppTranslation.translations,
            locale: LMSLocale.enUS,
            initialBinding: AppGlobalBindings(),
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
            builder: EasyLoading.init(),
            scrollBehavior: NoThumbScrollBehavior().copyWith(scrollbars: false),
          )));
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..loadingStyle = EasyLoadingStyle.light
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false
    ..customAnimation = EasyLoadingCustomAnimation();
}
