import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:getx_sample/app/routes/middle_ware.dart';
import 'package:getx_sample/utils/notification_manager.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'app/app_global_binding.dart';
import 'app/routes/routes.dart';
import 'app/translation/translation.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent, // navigation bar color
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarColor: Colors.transparent, // status bar color
    statusBarIconBrightness: Brightness.dark,
  ));
  Fimber.plantTree(DebugTree(useColors: true));
  Fimber.plantTree(DebugTree.elapsed());

  /// settings for the local notifications: START !!!
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationManager().initialize();

  Hive.init((await getApplicationDocumentsDirectory()).path);

  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    NotificationManager().requestPermissions();
    NotificationManager().configureDidReceiveLocalNotificationSubject();
    NotificationManager().configureSelectNotificationSubject();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      debugShowCheckedModeBanner: false,
      translationsKeys: AppTranslation.translationsKeys,
      locale: const Locale('vi', 'VI'),
      fallbackLocale: const Locale('vi', 'VI'),
      initialBinding: AppGlobalBinding(),
      initialRoute: NotificationManager().initialRoute,
      routingCallback: (routing) => MiddleWare.observer,
      getPages: AppRoutes.pages,
    );
  }

  @override
  void dispose() {
    NotificationManager.didReceiveLocalNotificationSubject.close();
    NotificationManager.selectNotificationSubject.close();
    super.dispose();
  }
}
