import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample/app/modules/base/base.dart';
import 'package:getx_sample/app/modules/documents/controllers/documents_controller.dart';
import 'package:getx_sample/generated/assets.gen.dart';
import 'package:getx_sample/styles/theme_extensions.dart';

class DocumentsView extends BaseView<DocumentsController> {
  DocumentsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          headerView(context),
          menuView(context),
          const SizedBox(height: 20),
          contentViews(context),
        ],
      ),
    );
  }

  Widget headerView(BuildContext context) {
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
                "hệ thống hỗ trợ soạn thảo văn bản công".toUpperCase(),
                style: context.themeExtensions.heading3
                    .copyWith(color: context.themeExtensions.subYellow, fontSize: 18),
              ),
              const SizedBox(height: 10),
              AutoSizeText(
                "Ủy ban nhân dân tỉnh Quảng Nghãi".toUpperCase(),
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

  Widget menuView(BuildContext context) {
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
                  "trang chủ".toUpperCase(),
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
                  "Dịch vụ công".toUpperCase(),
                  style: context.themeExtensions.paragraphSemiBold
                      .copyWith(color: context.themeExtensions.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: AutoSizeText(
                  "Hệ thống văn bản".toUpperCase(),
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

  contentViews(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          children: [
            buildDocumentTemplate(context),
            buildLeftMenus(context),
            buildSuggestions(context),
          ],
        ),
      ),
    );
  }

  buildLeftMenus(BuildContext context) {
    return Align(
      alignment: FractionalOffset.topLeft,
      child: Container(
        width: 269,
        height: double.infinity,
        color: context.themeExtensions.bgGrey,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Obx(() {
                return ExpansionTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      AutoSizeText(
                        '#',
                        style: context.themeExtensions.heading2
                            .copyWith(color: context.themeExtensions.black),
                      ),
                      const SizedBox(width: 7),
                      Expanded(
                        flex: 1,
                        child: AutoSizeText(
                          "Thể loại văn bản",
                          style: context.themeExtensions.paragraphSemiBold
                              .copyWith(color: context.themeExtensions.mainGreen),
                        ),
                      )
                    ],
                  ),
                  iconColor: context.themeExtensions.semiGrey,
                  collapsedIconColor: context.themeExtensions.semiGrey,
                  children: [
                    for (var category in controller.lstCategories)
                      _buildCategoryOrSavedDocumentMenuItem(context, category)
                  ],
                );
              }),
              Obx(() {
                return ExpansionTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      AutoSizeText(
                        '#',
                        style: context.themeExtensions.heading2
                            .copyWith(color: context.themeExtensions.black),
                      ),
                      const SizedBox(width: 7),
                      Expanded(
                        flex: 1,
                        child: AutoSizeText(
                          "Văn bản đã soạn thảo",
                          style: context.themeExtensions.paragraphSemiBold
                              .copyWith(color: context.themeExtensions.mainGreen),
                        ),
                      )
                    ],
                  ),
                  iconColor: context.themeExtensions.semiGrey,
                  collapsedIconColor: context.themeExtensions.semiGrey,
                  children: [
                    for (var document in controller.savedDocuments)
                      _buildCategoryOrSavedDocumentMenuItem(context, document)
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  buildDocumentTemplate(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Expanded(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          buildDocumentPage(context),
          const SizedBox(height: 45),
          buildDocumentPage(context),
          const SizedBox(height: 300),
        ],
      )),
    );
  }

  buildDocumentPage(BuildContext context) {
    return Center(
      child: Container(
        width: 820,
        height: 1160,
        padding: const EdgeInsets.all(8), // Border width
        decoration: BoxDecoration(
            color: context.themeExtensions.transparent,
            borderRadius: const BorderRadius.all(Radius.zero),
            border: Border.all(color: context.themeExtensions.bgGrey)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            for (var suggestion in controller.suggestions)
              _buildSuggestionItem(context,
                  suggestion: suggestion, isFirst: controller.suggestions.first == suggestion)
          ],
        ),
      ).paddingSymmetric(horizontal: 20),
    );
  }

  buildSuggestions(BuildContext context) {
    return Align(
      alignment: FractionalOffset.topRight,
      child: Container(
        width: 269,
        height: double.infinity,
        decoration: BoxDecoration(
            color: context.themeExtensions.transparent,
            borderRadius: const BorderRadius.all(Radius.zero),
            border: Border.all(color: context.themeExtensions.bgGrey)),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(height: 7),
              Center(
                child: AutoSizeText(
                  "Danh sách gợi ý",
                  style: context.themeExtensions.heading2
                      .copyWith(color: context.themeExtensions.mainGreen),
                ),
              ),
              Container(
                height: 1,
                color: context.themeExtensions.bgGrey,
              ),
              for (var suggestion in controller.suggestions)
                _buildSuggestionItem(context,
                    suggestion: suggestion, isFirst: controller.suggestions.first == suggestion)
            ],
          ),
        ),
      ),
    );
  }

  _buildCategoryOrSavedDocumentMenuItem(BuildContext context, String category) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Assets.images.icDocument.svg(width: 20, height: 20),
        const SizedBox(width: 7),
        Expanded(
          child: AutoSizeText(
            category,
            style: context.themeExtensions.paragraphSemiBold.copyWith(
              color: context.themeExtensions.red,
            ),
          ),
        )
      ],
    ).paddingSymmetric(horizontal: 20, vertical: 10);
  }

  _buildSuggestionItem(BuildContext context, {String? suggestion, bool? isFirst, bool? isLast}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          isFirst == false
              ? Container(
                  height: 1,
                  color: context.themeExtensions.bgGrey,
                ).marginSymmetric(horizontal: 20)
              : const SizedBox(),
          const SizedBox(height: 10),
          AutoSizeText(
            suggestion ?? "",
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: context.themeExtensions.subTexMedium
                .copyWith(color: context.themeExtensions.black),
          ),
          const SizedBox(height: 10)
        ],
      ),
    );
  }
}
