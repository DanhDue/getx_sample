import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample/generated/assets.gen.dart';
import 'package:getx_sample/generated/colors.gen.dart';
import 'package:getx_sample/generated/locales.g.dart';

class BotNavItem {
  BotNavItem({this.title, this.icon, this.activeColor, this.inactiveColor});
  String? title;
  SvgGenImage? icon;
  Color? activeColor;
  Color? inactiveColor;
}

final botNavItems = <BotNavItem>[
  BotNavItem(
      title: LocaleKeys.homePage.tr,
      icon: Assets.images.icHome,
      activeColor: LMSColors.mainGreen,
      inactiveColor: LMSColors.textGrey),
  BotNavItem(
      title: LocaleKeys.notification.tr,
      icon: Assets.images.icNotification,
      activeColor: LMSColors.mainGreen,
      inactiveColor: LMSColors.textGrey),
  BotNavItem(
      title: LocaleKeys.settings.tr,
      icon: Assets.images.icSettings,
      activeColor: LMSColors.mainGreen,
      inactiveColor: LMSColors.textGrey),
  BotNavItem(
      title: LocaleKeys.personal.tr,
      icon: Assets.images.icProfile,
      activeColor: LMSColors.mainGreen,
      inactiveColor: LMSColors.textGrey)
];

const notificationTabIndex = 1;
const checkInTabIndex = 2;
