import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:getx_sample/generated/locales.g.dart';
import 'package:getx_sample/styles/theme_extensions.dart';

class MenuView extends StatelessWidget {
  const MenuView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.themeExtensions.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            color: context.themeExtensions.white,
            height: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: AutoSizeText(
                  LocaleKeys.homePage.tr.toUpperCase(),
                  style: context.themeExtensions.paragraphSemiBold
                      .copyWith(color: context.themeExtensions.white),
                ),
              ),
              Container(
                width: 2,
                color: context.themeExtensions.white,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: AutoSizeText(
                  LocaleKeys.publicService.tr.toUpperCase(),
                  style: context.themeExtensions.paragraphSemiBold
                      .copyWith(color: context.themeExtensions.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: AutoSizeText(
                  LocaleKeys.docManagementSystem.tr.toUpperCase(),
                  style: context.themeExtensions.paragraphSemiBold
                      .copyWith(color: context.themeExtensions.white),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
