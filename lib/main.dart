import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/default_route.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:getx_sample/screens/splash/splash_view.dart';

import 'controller.dart';

void main() {
  runApp(const GetMaterialApp(home: SplashPage(),));
  // runApp(const GetMaterialApp(home: NestedNavigation(),));
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(context) {

    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    final Controller c = Get.put(Controller());

    return Scaffold(
      // Use Obx(()=> to update Text() whenever count is changed.
        appBar: AppBar(title: Obx(() => Text("Clicks: ${c.count}"))),
        // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
        body: Center(child: ElevatedButton(
            child: const Text("Go to Other"), onPressed: () => Get.to(Other()))),
        floatingActionButton:
        FloatingActionButton(child: const Icon(Icons.add), onPressed: c.increment));
  }
}

class Other extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final Controller c = Get.find();

  Other({Key? key}) : super(key: key);

  @override
  Widget build(context){
    // Access the updated count variable
    return Scaffold(body: Center(child: Text("${c.count}")));
  }
}

class NestedNavigation extends StatelessWidget {
  const NestedNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Nested Navigation - BNB',
      theme: ThemeData(primarySwatch: Colors.blue),
      getPages: <GetPage>[
        GetPage(name: '/settings', page: () => const SettingsWrapper(), fullscreenDialog: true),
        GetPage(name: '/home', page: () => const HomeScreen()),
      ],
      initialRoute: '/home',
      initialBinding: BindingsBuilder.put(() => HomeController()),
    );
  }
}

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: controller.state.value == HomeState.home ? 0 : 1,
        onTap: (index) => index == 0 ? controller.selectHome() : controller.selectSettings(),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
      body: Builder(
        builder: (context) {
          switch (controller.state.value) {
            case HomeState.home:
              return Scaffold(
                appBar: AppBar(title: const Text('BottomNavigationBar')),
                body: const Center(child: Text('Home')),
              );
            case HomeState.settings:
              return const SettingsWrapper();
            default:
              return Scaffold(
              appBar: AppBar(title: const Text('BottomNavigationBar')),
              body: const Center(child: Text('Home')),
              );
          }
        },
      ),
    ));
  }
}

enum HomeState { home, settings }

class HomeController extends GetxController {
  final state = HomeState.home.obs;

  void selectHome() => state.value = HomeState.home;
  Future<void> selectSettings() async {
    if (state.value == HomeState.settings) {
      try {
        await Get.keys[SettingsNavigation.id]!.currentState!.maybePop();
      } catch (e) {
        // error
      }
    }
    state.value = HomeState.settings;
  }
}

class SettingsNavigation {
  SettingsNavigation._();

  static const id = 0;

  static const settings = '/settings';
  static const dialog = '/dialog';
}

class SettingsWrapper extends StatelessWidget {
  const SettingsWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(SettingsNavigation.id),
      onGenerateRoute: (settings) {
        if (settings.name == SettingsNavigation.dialog) {
          return GetPageRoute(
            routeName: SettingsNavigation.dialog,
            page: () => const SettingsScreen(id: SettingsNavigation.id, first: false),
          );
        } else {
          return GetPageRoute(
            routeName: SettingsNavigation.settings,
            page: () => const SettingsScreen(id: SettingsNavigation.id, first: true),
          );
        }
      },
    );
  }
}

class SettingsScreen extends StatelessWidget {
  final int? id;
  final bool first;

  const SettingsScreen({Key? key, this.id, required this.first}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (first) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('Settings'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.toNamed(SettingsNavigation.dialog, id: SettingsNavigation.id),
          child: const Icon(Icons.chevron_right),
        ),
        body: const Center(child: Text('Main Settings')),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('Detail'),
        ),
        body: const Center(child: Text('Detail Settings')),
      );
    }
  }
}