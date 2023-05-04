import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample/app/modules/base/base.dart';
import 'package:getx_sample/app/modules/documents/controllers/documents_controller.dart';
import 'package:getx_sample/data/bean/basis_object/basis_object.dart';
import 'package:getx_sample/data/bean/consumer_object/consumer_object.dart';
import 'package:getx_sample/data/bean/resolution_object/resolution_object.dart';
import 'package:getx_sample/generated/assets.gen.dart';
import 'package:getx_sample/generated/locales.g.dart';
import 'package:getx_sample/styles/theme_extensions.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

class DocumentsView extends BaseView<DocumentsController> {
  DocumentsView({Key? key}) : super(key: key);

  final _editorTextStyle =
      const TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.normal);
  final _hintTextStyle =
      const TextStyle(fontSize: 18, color: Colors.teal, fontWeight: FontWeight.normal);

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
        height: 727,
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
                          LocaleKeys.docCategories.tr,
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
                          LocaleKeys.createdDocuments.tr,
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        _buildQuillToolbar(context),
        const SizedBox(height: 15),
        Expanded(
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                buildDocumentPage(context),
                const SizedBox(height: 300),
              ],
            ),
          ),
        )
      ],
    );
  }

  _buildQuillToolbar(BuildContext context) {
    return SizedBox(
      width: 820,
      child: ToolBar(
        toolBarColor: context.themeExtensions.bgGrey,
        padding: const EdgeInsets.all(8),
        iconSize: 25,
        iconColor: context.themeExtensions.textColor,
        activeIconColor: Colors.purple.shade300,
        controller: controller.quillEditorController,
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.center,
        customButtons: [
          InkWell(
              onTap: () => controller.quillEditorController.unFocus(),
              child: const Icon(
                Icons.favorite,
                color: Colors.black,
              )),
          InkWell(
              onTap: () async {
                var selectedText = await controller.quillEditorController.getSelectedText();
                debugPrint('selectedText $selectedText');
                var selectedHtmlText =
                    await controller.quillEditorController.getSelectedHtmlText();
                debugPrint('selectedHtmlText $selectedHtmlText');
              },
              child: const Icon(
                Icons.add_circle,
                color: Colors.black,
              )),
        ],
      ),
    );
  }

  buildDocumentPage(BuildContext context) {
    return Center(
      child: Container(
        width: 820,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: context.themeExtensions.transparent,
            borderRadius: const BorderRadius.all(Radius.zero),
            border: Border.all(color: context.themeExtensions.black)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: 35),
            _buildDocumentHeaderViews(context),
            const SizedBox(height: 45),
            _buildDocumentContentViews(context),
            _buildDocumentFooterViews(context),
          ],
        ),
      ).paddingSymmetric(horizontal: 20),
    );
  }

  _buildDocumentHeaderViews(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: 15),
          Container(
            height: 2,
            color: context.themeExtensions.textGrey,
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: controller.organizationEditTextController,
                      style: context.themeExtensions.heading2
                          .copyWith(color: context.themeExtensions.black, height: 1.6),
                      maxLines: null,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration.collapsed(
                          hintText: LocaleKeys.organizationNameDiscription.tr.toUpperCase()),
                    ),
                    const SizedBox(height: 7),
                    Container(
                      height: 1,
                      width: 120,
                      color: context.themeExtensions.textGrey,
                    ),
                    const SizedBox(height: 13),
                    TextFormField(
                      controller: controller.docNumberEditTextController,
                      maxLines: null,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration.collapsed(hintText: ""),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    AutoSizeText(
                      LocaleKeys.vietnam.tr.toUpperCase(),
                      style: context.themeExtensions.heading2.copyWith(
                        color: context.themeExtensions.black,
                      ),
                    ),
                    const SizedBox(height: 3),
                    AutoSizeText(
                      LocaleKeys.vietnamSlogan.tr,
                      style: context.themeExtensions.heading2.copyWith(
                        color: context.themeExtensions.black,
                      ),
                    ),
                    const SizedBox(height: 7),
                    Container(
                      height: 1,
                      width: 286,
                      color: context.themeExtensions.textGrey,
                    ),
                    const SizedBox(height: 13),
                    TextFormField(
                      controller: controller.createdAtEditTextController,
                      style: context.themeExtensions.subTexMedium
                          .copyWith(color: context.themeExtensions.black, height: 1.6),
                      maxLines: null,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration.collapsed(hintText: ""),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  _buildDocumentContentViewsWithQuillHTMLEditor(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: QuillHtmlEditor(
        text:
            "<h2 class=\"ql-align-center\">NGHỊ QUYẾT</h2><p class=\"ql-align-center\"><u>............................</u></p><p class=\"ql-align-center\"><br></p><h2 class=\"ql-align-center\">THẨM QUYỀN BAN HÀNH</h2><p class=\"ql-align-center\"><br></p><p>Căn cứ: .................................................................................................................................................</p><p>Căn cứ: .................................................................................................................................................</p><p><br></p><h2 class=\"ql-align-center\">NGHỊ QUYẾT</h2><p class=\"ql-align-center\"><br></p><p>................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................</p><p><br></p><p><br></p><p class=\"ql-align-center\"><br></p>",
        hintText: 'Hint text goes here',
        controller: controller.quillEditorController,
        isEnabled: true,
        minHeight: 300,
        textStyle: _editorTextStyle,
        hintTextStyle: _hintTextStyle,
        hintTextAlign: TextAlign.start,
        padding: const EdgeInsets.only(left: 0, top: 0),
        hintTextPadding: const EdgeInsets.only(left: 20),
        backgroundColor: Colors.white,
        onFocusChanged: (hasFocus) => debugPrint('has focus $hasFocus'),
        onTextChanged: (text) => debugPrint('widget text change $text'),
        onEditorCreated: () => debugPrint('Editor has been loaded'),
        onEditorResized: (height) => debugPrint('Editor resized $height'),
        onSelectionChanged: (sel) => debugPrint('index ${sel.index}, range ${sel.length}'),
      ),
    );
  }

  _buildDocumentFooterViews(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                AutoSizeText(
                  "${LocaleKeys.consumer.tr}:",
                  style: context.themeExtensions.heading2
                      .copyWith(color: context.themeExtensions.black, fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 15),
                for (var consumer in controller.lstConsumers)
                  _buildConsumer(context, consumer: consumer),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: controller.positionEditTextDesController,
                  style: context.themeExtensions.heading2.copyWith(
                      color: context.themeExtensions.textColor, fontWeight: FontWeight.w900),
                  maxLines: null,
                  textAlign: TextAlign.center,
                  decoration:
                      InputDecoration.collapsed(hintText: LocaleKeys.rightPositionOfDelegate.tr),
                ),
                const SizedBox(height: 7),
                TextFormField(
                  controller: controller.positionNoteEditTextDesController,
                  style: context.themeExtensions.heading3.copyWith(
                      color: context.themeExtensions.textGrey, fontStyle: FontStyle.italic),
                  maxLines: null,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration.collapsed(hintText: ""),
                ).paddingSymmetric(horizontal: 79),
                const SizedBox(height: 79),
                TextFormField(
                  controller: controller.delegateFullNameEditTextDesController,
                  style: context.themeExtensions.heading2
                      .copyWith(color: context.themeExtensions.textColor),
                  maxLines: null,
                  textAlign: TextAlign.center,
                  decoration:
                      InputDecoration.collapsed(hintText: LocaleKeys.firstNameAndLastName.tr),
                ),
                const SizedBox(height: 69),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildSuggestions(BuildContext context) {
    return Align(
      alignment: FractionalOffset.topRight,
      child: Container(
          width: 269,
          height: 727,
          decoration: BoxDecoration(
              color: context.themeExtensions.transparent,
              borderRadius: const BorderRadius.all(Radius.zero),
              border: Border.all(color: context.themeExtensions.black)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(height: 7),
              Center(
                child: AutoSizeText(
                  LocaleKeys.sugesstionList.tr,
                  style: context.themeExtensions.heading2
                      .copyWith(color: context.themeExtensions.mainGreen),
                ),
              ),
              Container(
                height: 1,
                color: context.themeExtensions.black,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      for (var suggestion in controller.suggestions)
                        _buildSuggestionItem(context,
                            suggestion: suggestion,
                            isFirst: controller.suggestions.first == suggestion)
                    ],
                  ),
                ),
              ),
            ],
          )),
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
                  color: context.themeExtensions.textLightGrey,
                ).marginSymmetric(horizontal: 20)
              : const SizedBox.shrink(),
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

  _buildDocumentContentViews(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        TextFormField(
          controller: controller.resolutionTextController,
          style: context.themeExtensions.heading2
              .copyWith(color: context.themeExtensions.textColor, fontWeight: FontWeight.w900),
          maxLines: null,
          textAlign: TextAlign.center,
          decoration: const InputDecoration.collapsed(hintText: ""),
        ),
        const SizedBox(height: 13),
        TextFormField(
          controller: controller.resolutionEditTextDesController,
          maxLines: null,
          textAlign: TextAlign.center,
          decoration: const InputDecoration.collapsed(hintText: ""),
        ).paddingSymmetric(horizontal: 96),
        const SizedBox(height: 13),
        Container(
          height: 2,
          width: 136,
          color: context.themeExtensions.textLightGrey,
        ),
        const SizedBox(height: 35),
        TextFormField(
          controller: controller.authorizationEditTextDesController,
          style: context.themeExtensions.heading2
              .copyWith(color: context.themeExtensions.textColor, fontWeight: FontWeight.w900),
          maxLines: null,
          textAlign: TextAlign.center,
          decoration: const InputDecoration.collapsed(hintText: ""),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: controller.authorizationTitleEditTextDesController,
          style: context.themeExtensions.heading2
              .copyWith(color: context.themeExtensions.textColor, fontWeight: FontWeight.w900),
          maxLines: null,
          textAlign: TextAlign.start,
          decoration: const InputDecoration.collapsed(hintText: ""),
        ).paddingOnly(left: 35),
        const SizedBox(height: 13),
        for (var basis in controller.lstBasises) _buildBasis(context, basis: basis),
        const SizedBox(height: 35),
        TextFormField(
          controller: controller.resolveEditTextDesController,
          style: context.themeExtensions.heading2
              .copyWith(color: context.themeExtensions.textColor, fontWeight: FontWeight.w900),
          maxLines: null,
          textAlign: TextAlign.center,
          decoration: const InputDecoration.collapsed(hintText: ""),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: controller.resolveDescriptionEditTextDesController,
          style: context.themeExtensions.paragraph
              .copyWith(color: context.themeExtensions.textColor, fontWeight: FontWeight.w700),
          maxLines: null,
          textAlign: TextAlign.start,
          decoration: const InputDecoration.collapsed(hintText: ""),
        ).paddingOnly(left: 35),
        const SizedBox(height: 35),
        for (var resolution in controller.lstResolutions)
          _buildResolution(context,
              resolution: resolution, index: controller.lstResolutions.indexOf(resolution)),
        const SizedBox(height: 69),
      ],
    );
  }

  _buildBasis(BuildContext context,
      {BasisObject? basis, bool? isFirst = false, bool? isLast = false}) {
    return RawKeyboardListener(
      focusNode: basis?.focusNode ?? FocusNode(),
      onKey: (value) => controller.handleKey(value),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 20),
          AutoSizeText(
            "\u2022",
            style: context.themeExtensions.paragraphSemiBold
                .copyWith(color: context.themeExtensions.black),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              controller: basis?.editTextController,
              style: context.themeExtensions.paragraph
                  .copyWith(color: context.themeExtensions.textColor, height: 1.6),
              maxLines: null,
              textAlign: TextAlign.start,
              decoration: InputDecoration.collapsed(hintText: basis?.basis),
              onFieldSubmitted: (value) => controller.basisSubmitted(basis),
            ),
          ),
          InkWell(
            onTap: () => controller.deleteBasis(basis),
            child: IconTheme(
              data: IconThemeData(color: context.themeExtensions.textGrey),
              child: Container(
                padding: const EdgeInsets.only(right: 13),
                child: Assets.images.icClear.svg(
                  width: 22,
                  height: 22,
                  fit: BoxFit.cover,
                  color: context.themeExtensions.textGrey,
                ),
              ),
            ),
          ),
        ],
      ),
    ).marginOnly(left: 45, top: 0, right: 45, bottom: 15);
  }

  _buildResolution(BuildContext context,
      {ResolutionObject? resolution, int? index, bool? isFirst = false, bool? isLast = false}) {
    return RawKeyboardListener(
      focusNode: resolution?.focusNode ?? FocusNode(),
      onKey: (value) => controller.handleKey(value),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Điều ${(index ?? 0) + 1}:",
                style: context.themeExtensions.paragraphSemiBold
                    .copyWith(color: context.themeExtensions.black, fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 2),
              Container(
                height: 1,
                width: 56,
                color: Colors.grey,
              ),
            ],
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              controller: resolution?.editTextController,
              style: context.themeExtensions.paragraph
                  .copyWith(color: context.themeExtensions.textColor, height: 1.6),
              maxLines: null,
              minLines: 2,
              textAlign: TextAlign.start,
              decoration: InputDecoration.collapsed(hintText: resolution?.resolution),
              onFieldSubmitted: (value) => controller.resolutionSummitted(resolution),
            ),
          ),
          InkWell(
            onTap: () => controller.deleteResolution(resolution),
            child: IconTheme(
              data: IconThemeData(color: context.themeExtensions.textGrey),
              child: Container(
                padding: const EdgeInsets.only(right: 13),
                child: Assets.images.icClear.svg(
                  width: 22,
                  height: 22,
                  fit: BoxFit.cover,
                  color: context.themeExtensions.textGrey,
                ),
              ),
            ),
          ),
        ],
      ).marginOnly(left: 45, top: 0, right: 45, bottom: 15),
    );
  }

  _buildConsumer(BuildContext context,
      {ConsumerObject? consumer, bool? isFirst = false, bool? isLast = false}) {
    return RawKeyboardListener(
      focusNode: consumer?.focusNode ?? FocusNode(),
      onKey: (value) => controller.handleKey(value),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: TextFormField(
              controller: consumer?.editTextController,
              style: context.themeExtensions.subTexMedium
                  .copyWith(color: context.themeExtensions.textGrey),
              maxLines: null,
              decoration: const InputDecoration.collapsed(hintText: ""),
              onFieldSubmitted: (value) => controller.consumerSummitted(consumer),
            ),
          ),
          InkWell(
            onTap: () => controller.deleteConsumer(consumer),
            child: IconTheme(
              data: IconThemeData(color: context.themeExtensions.textGrey),
              child: Container(
                padding: const EdgeInsets.only(right: 13),
                child: Assets.images.icClear.svg(
                  width: 22,
                  height: 22,
                  fit: BoxFit.cover,
                  color: context.themeExtensions.textGrey,
                ),
              ),
            ),
          ),
        ],
      ).marginOnly(left: 0, top: 0, right: 45, bottom: 15),
    );
  }
}
