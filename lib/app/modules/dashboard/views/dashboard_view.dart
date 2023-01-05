// Copyright (c) 2023, one of the D3F outsourcing projects. All rights reserved.

// coverage:ignore-file

import 'dart:async';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:getx_sample/app/modules/base/keep_alive_widget.dart';
import 'package:getx_sample/app/modules/checkin/views/checkin_view.dart';
import 'package:getx_sample/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:getx_sample/app/modules/dashboard/models/bot_nav_items.dart';
import 'package:getx_sample/app/modules/home/bindings/home_binding.dart';
import 'package:getx_sample/app/modules/home/views/home_view.dart';
import 'package:getx_sample/app/modules/notification/views/notification_view.dart';
import 'package:getx_sample/app/modules/personal/bindings/personal_binding.dart';
import 'package:getx_sample/app/modules/personal/views/personal_view.dart';
import 'package:getx_sample/app/modules/settings/views/settings_view.dart';
import 'package:getx_sample/generated/assets.gen.dart';
import 'package:getx_sample/generated/colors.gen.dart';
import 'package:getx_sample/generated/locales.g.dart';
import 'package:getx_sample/styles/theme_extensions.dart';

class DashboardView extends StatefulHookWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  late PageController pageController;
  final autoSizeGroup = AutoSizeGroup();
  late StreamSubscription<bool> keyboardSubscription;

  final DashboardController dashboardController = Get.put(DashboardController(), permanent: false);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    pageController = usePageController(keepPage: true, initialPage: checkInTabIndex);
    return Stack(
      children: [
        Scaffold(
          extendBody: true,
          body: PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (index) {
              if (index < checkInTabIndex) dashboardController.currentTabIndex.value = index;
              if (index == checkInTabIndex) dashboardController.currentTabIndex.value = -1;
              if (index > checkInTabIndex) dashboardController.currentTabIndex.value = index - 1;
            },
            children: <Widget>[
              KeepAliveWidget(child: HomeView(bindingCreator: () => HomeBinding())),
              KeepAliveWidget(child: NotificationView()),
              KeepAliveWidget(child: CheckinView()),
              KeepAliveWidget(child: SettingsView()),
              KeepAliveWidget(child: PersonalView(bindingCreator: () => PersonalBinding())),
            ],
          ),
          floatingActionButton: InkWell(
            child: Assets.images.icCheckin.image(width: 56, height: 56, fit: BoxFit.cover),
            onTap: () {
              pageController.jumpToPage(checkInTabIndex);
            },
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: buildBottomNavigationBar(context),
        ),
        SafeArea(
          bottom: true,
          child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  pageController.jumpToPage(checkInTabIndex);
                },
                child: Obx(() => Container(
                      padding: const EdgeInsets.only(top: 32, bottom: 8),
                      child: AutoSizeText(
                        LocaleKeys.checkin.tr,
                        maxLines: 1,
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 14,
                            color: (dashboardController.currentTabIndex.value == -1)
                                ? LMSColors.mainGreen
                                : LMSColors.textGrey),
                      ),
                    )),
              ),
            ),
          ),
        )
      ],
    );
  }

  buildBottomNavigationBar(BuildContext context) {
    return Obx(() => AnimatedBottomNavigationBar.builder(
          height: 68,
          itemCount: botNavItems.length,
          tabBuilder: (int index, bool isActive) {
            final botNavItem = botNavItems[index];
            final color = (isActive && dashboardController.currentTabIndex.value != -1)
                ? botNavItem.activeColor
                : botNavItem.inactiveColor;
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 9, top: 7, right: 9),
                      child: botNavItems[index]
                              .icon
                              ?.svg(width: 25, height: 25, fit: BoxFit.cover, color: color) ??
                          const SizedBox.shrink(),
                    ),
                    index == notificationTabIndex
                        ? Positioned(
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              constraints: const BoxConstraints(minWidth: 10, minHeight: 10),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  dashboardController.notiCount.value,
                                  style: context.themeExtensions.subTexMedium.copyWith(
                                      color: context.themeExtensions.white, fontSize: 12),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: AutoSizeText(
                    botNavItem.title ?? "",
                    maxLines: 1,
                    style: TextStyle(color: color),
                    group: autoSizeGroup,
                  ),
                )
              ],
            );
          },
          backgroundColor: Colors.white,
          activeIndex: dashboardController.currentTabIndex.value,
          splashSpeedInMilliseconds: 68,
          notchSmoothness: NotchSmoothness.defaultEdge,
          gapLocation: GapLocation.center,
          leftCornerRadius: 20,
          rightCornerRadius: 20,
          onTap: (index) => {
            dashboardController.currentTabIndex.value = index,
            if (index < checkInTabIndex) {pageController.jumpToPage(index)},
            if (index >= checkInTabIndex) {pageController.jumpToPage(index + 1)}
          },
          shadow: BoxShadow(
              offset: const Offset(0, 1),
              blurRadius: 12,
              spreadRadius: 0.5,
              color: context.themeExtensions.lightSilver),
        ));
  }
}
