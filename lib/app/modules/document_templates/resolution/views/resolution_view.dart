import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:getx_sample/app/modules/base/base.dart';
import 'package:getx_sample/app/modules/base/binding_creator.dart';
import 'package:getx_sample/app/modules/document_templates/resolution/bindings/resolution_binding.dart';
import 'package:getx_sample/styles/theme_extensions.dart';

import '../controllers/resolution_controller.dart';

class ResolutionView extends BaseBindingCreatorView<ResolutionBinding, ResolutionController> {
  ResolutionView({Key? key, required BindingCreator<ResolutionBinding>? bindingCreator})
      : super(key: key, bindingCreator: bindingCreator);

  @override
  Widget? onCreateViews(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          _buildHeaderViews(context),
          _buildDocumentTitle(context),
        ],
      ),
    );
  }

  _buildHeaderViews(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          height: 1,
          color: context.themeExtensions.bgGrey,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                AutoSizeText(
                  "Tên CQ, TC Chủ quản".toUpperCase(),
                  style: context.themeExtensions.heading2
                      .copyWith(color: context.themeExtensions.black),
                ),
                AutoSizeText(
                  "Tên cơ quan, tổ chức".toUpperCase(),
                  style: context.themeExtensions.heading2
                      .copyWith(color: context.themeExtensions.black),
                ),
                Container(
                  height: 1,
                  color: context.themeExtensions.bgGrey,
                ),
                const SizedBox(height: 7),
                AutoSizeText("Số:   /NQ-.......")
              ],
            )
          ],
        )
      ],
    );
  }

  _buildDocumentTitle(BuildContext context) {}
}
