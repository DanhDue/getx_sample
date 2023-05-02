// ignore_for_file: invalid_use_of_protected_member

import 'package:dart_extensions/dart_extensions.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_sample/app/modules/base/base.dart';
import 'package:getx_sample/data/bean/basis_object/basis_object.dart';
import 'package:getx_sample/data/bean/consumer_object/consumer_object.dart';
import 'package:getx_sample/data/bean/resolution_object/resolution_object.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

class DocumentsController extends BaseController {
  late TextEditingController? organizationEditTextController;
  late FocusNode? organizationEdtFocusNode;
  late TextEditingController? docNumberEditTextController;
  late TextEditingController? createdAtEditTextController;
  late TextEditingController? resolutionTextController;
  late TextEditingController? resolutionEditTextDesController;
  late TextEditingController? authorizationEditTextDesController;
  late TextEditingController? resolveEditTextDesController;
  late TextEditingController? positionEditTextDesController;
  late TextEditingController? positionNoteEditTextDesController;

  final lstCategories = <String>[
    "Nghị quyết",
    "Quyết định",
    "Chỉ thị",
    "Quy chế",
    "Quy định",
    "Thông báo",
    "Hướng dẫn",
    "Chương trình"
  ].obs;

  final savedDocuments =
      <String>["Thông tư 05", "Văn bản hướng dẫn nộp thuế 05/2023", "Báo cáo hợp nhất"].obs;

  final suggestions = <String>[
    "Căn cứ luật sửa đổi bổ sung một số điều của luật tổ chức chính phủ ngày 22 tháng 11 năm 2019",
    "Căn cứ nghị định 24/2014/NĐ-CP ngày 02 tháng 04 năm 2014 của chính phủ quy định tổ chức các cơ quan",
    "Căn cứ nghị định số 107/2020/NĐ-CP ngày 14 tháng 09 năm 2020 của Chính phủ sửa đổi, bổ sung một số điều",
    "Căn cứ thông tin liên tịch số 01/2015/TTLT-VPCP-BNV ngày 23 tháng 10 năm 2015 của Bộ trưởng, Chủ nhiệm",
    "Căn cứ luật sửa đổi bổ sung một số điều của luật tổ chức chính phủ ngày 22 tháng 11 năm 2020",
    "Căn cứ luật sửa đổi bổ sung một số điều của luật tổ chức chính phủ ngày 22 tháng 11 năm 2021",
    "Căn cứ luật sửa đổi bổ sung một số điều của luật tổ chức chính phủ ngày 22 tháng 11 năm 2022",
    "Căn cứ luật sửa đổi bổ sung một số điều của luật tổ chức chính phủ ngày 22 tháng 11 năm 2023",
    "Căn cứ luật sửa đổi bổ sung một số điều của luật tổ chức chính phủ ngày 22 tháng 11 năm 2018",
    "Căn cứ luật sửa đổi bổ sung một số điều của luật tổ chức chính phủ ngày 22 tháng 11 năm 2017",
  ].obs;

  final basises = <String>[
    "    Căn cứ ........................................................................................................................................",
    "    Căn cứ ........................................................................................................................................",
    "    Căn cứ ........................................................................................................................................",
    "    Căn cứ ......................................................................................................................................................................................................................................................................................................................................................................................................................................................",
  ].obs;

  final lstBasises = <BasisObject?>[].obs;

  final resolutions = <String>[
    "    Điều 1: ........................................................................................................................................",
    "    Điều 2: ........................................................................................................................................",
    "    Điều 3: ......................................................................................................................................................................................................................................................................................................................................................................................................................................................",
    "    Điều 4: ...........................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................",
  ].obs;

  final lstResolutions = <ResolutionObject?>[].obs;

  final consumers = <String>[
    "- Như điều: ............;",
    "- ......................;",
    "- Lưu VT, ..............;"
  ].obs;

  final lstConsumers = <ConsumerObject?>[].obs;

  final QuillEditorController quillEditorController = QuillEditorController();

  @override
  void onInit() {
    super.onInit();
    organizationEditTextController = TextEditingController();
    organizationEdtFocusNode = FocusNode();
    createdAtEditTextController = TextEditingController();
    docNumberEditTextController = TextEditingController();
    resolutionTextController = TextEditingController();
    resolutionEditTextDesController = TextEditingController();
    authorizationEditTextDesController = TextEditingController();
    resolveEditTextDesController = TextEditingController();
    positionEditTextDesController = TextEditingController();
    positionNoteEditTextDesController = TextEditingController();
    basises.asMap().forEach((index, value) {
      lstBasises.add(BasisObject(
          index: index,
          basis: value,
          editTextController: TextEditingController()..text = value,
          focusNode: FocusNode()));
    });
    resolutions.asMap().forEach((index, resolution) {
      lstResolutions.add(ResolutionObject(
          index: index,
          resolution: resolution,
          editTextController: TextEditingController()..text = resolution,
          focusNode: FocusNode()));
    });
    consumers.asMap().forEach((index, consumer) {
      lstConsumers.add(ConsumerObject(
          index: index,
          consumer: consumer,
          editTextController: TextEditingController()..text = consumer,
          focusNode: FocusNode()));
    });
  }

  @override
  void onReady() {
    super.onReady();
    createdAtEditTextController?.text = "....., ngày ..., tháng ..., năm ... .";
    docNumberEditTextController?.text = "Số:   /NQ-.......";
    resolutionTextController?.text = "Nghị quyết".toUpperCase();
    resolutionEditTextDesController?.text = "................................";
    authorizationEditTextDesController?.text = "Thẩm quyền ban hành".toUpperCase();
    resolveEditTextDesController?.text = "Quyết nghị".toUpperCase();
    positionNoteEditTextDesController?.text =
        "(Chữ kí của người có thẩm quyền, dấu/chữ kí số của cơ quan, tổ chức)";
    _handleOrganizationEdtFocus();
    lstBasises.value = lstBasises.value;
    lstResolutions.value = lstResolutions.value;
  }

  _handleOrganizationEdtFocus() {
    organizationEdtFocusNode?.addListener(() {
      if (organizationEdtFocusNode?.hasFocus == true) {
        Fimber.d("organizationEdtFocusNode?.hasFocus: true");
      } else {
        Fimber.d("organizationEdtFocusNode?.hasFocus: false");
      }
    });
  }

  @override
  void onClose() {
    Fimber.d("onClose()");
    organizationEdtFocusNode?.dispose();
    super.onClose();
  }

  basisSubmitted(BasisObject? basisObject) {
    Fimber.d("basisSubmitted(BasisObject? $basisObject)");
  }

  resolutionSummitted(ResolutionObject? basisObject) {}

  consumerSummitted(ConsumerObject? consumer) {}

  handleKey(RawKeyEvent? key) {
    if (key?.isShiftPressed == true &&
        (key is RawKeyDownEvent) &&
        key.logicalKey.keyLabel.equalsIgnoreCase("Enter") == true) {
      Fimber.d("Add a new line.");
    }
  }
}
