import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:getx_sample/generated/assets.gen.dart';
import 'package:getx_sample/generated/locales.g.dart';
import 'package:getx_sample/styles/theme_extensions.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.themeExtensions.red,
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Assets.images.communistParty.image(width: 120, height: 120),
          const SizedBox(width: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              AutoSizeText(
                LocaleKeys.communityDocumentSystem.tr.toUpperCase(),
                style: context.themeExtensions.heading3
                    .copyWith(color: context.themeExtensions.subYellow, fontSize: 18),
              ),
              const SizedBox(height: 10),
              AutoSizeText(
                LocaleKeys.qnCommunity.tr.toUpperCase(),
                style: context.themeExtensions.heading1
                    .copyWith(color: context.themeExtensions.subYellow, fontSize: 26),
              )
            ],
          ),
          Expanded(
              child:
                  Align(alignment: Alignment.centerRight, child: Assets.images.qnSlogan.image()))
        ],
      ),
    );
  }
}
