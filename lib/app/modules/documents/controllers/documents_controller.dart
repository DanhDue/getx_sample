// ignore_for_file: invalid_use_of_protected_member

import 'package:dart_extensions/dart_extensions.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_sample/app/modules/base/base.dart';
import 'package:getx_sample/app/routes/app_pages.dart';
import 'package:getx_sample/data/bean/basis_object/basis_object.dart';
import 'package:getx_sample/data/bean/consumer_object/consumer_object.dart';
import 'package:getx_sample/data/bean/resolution_data_object/resolution_data_object.dart';
import 'package:getx_sample/data/bean/resolution_object/resolution_object.dart';
import 'package:getx_sample/data/repositories/document_basis_repository.dart';
import 'package:getx_sample/generated/locales.g.dart';
import 'package:getx_sample/utils/debouncer.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

class DocumentsController extends BaseController {
  final docBasisRepo = Get.find<DocumentBasisRepository?>();

  late TextEditingController? organizationEditTextController;
  late FocusNode? organizationEdtFocusNode;
  late TextEditingController? docNumberEditTextController;
  late TextEditingController? createdAtEditTextController;
  late TextEditingController? resolutionTextController;
  late TextEditingController? resolutionEditTextDesController;
  late TextEditingController? authorizationEditTextDesController;
  late TextEditingController? authorizationTitleEditTextDesController;
  late FocusNode? authTitleEdtFocusNode;
  late TextEditingController? resolveEditTextDesController;
  late TextEditingController? resolveDescriptionEditTextDesController;
  late FocusNode? resolveDesEdtFocusNode;
  late TextEditingController? consumerEditTextDesController;
  late FocusNode? consumerEdtFocusNode;
  late TextEditingController? positionEditTextDesController;
  late TextEditingController? positionNoteEditTextDesController;
  late TextEditingController? delegateFullNameEditTextDesController;

  final Rx<BasisObject?> basisItemRequestFocus =
      BasisObject(basis: "", editTextController: TextEditingController()).obs;
  final Rx<ResolutionObject?> resolutionItemRequestFocus =
      ResolutionObject(resolution: "", editTextController: TextEditingController()).obs;
  final Rx<ConsumerObject?> consumerItemRequestFocus =
      ConsumerObject(consumer: "", editTextController: TextEditingController()).obs;

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

  List<String?> basisSuggestions = [
    "Luật sửa đổi bổ sung một số điều của luật tổ chức chính phủ ngày 22 tháng 11 năm 2019",
    "Nghị định 24/2014/NĐ-CP ngày 02 tháng 04 năm 2014 của chính phủ quy định tổ chức các cơ quan",
    "Nghị định số 107/2020/NĐ-CP ngày 14 tháng 09 năm 2020 của Chính phủ sửa đổi, bổ sung một số điều",
    "Thông tin liên tịch số 01/2015/TTLT-VPCP-BNV ngày 23 tháng 10 năm 2015 của Bộ trưởng, Chủ nhiệm",
    "Luật sửa đổi bổ sung một số điều của luật tổ chức chính phủ ngày 22 tháng 11 năm 2020",
    "Luật sửa đổi bổ sung một số điều của luật tổ chức chính phủ ngày 22 tháng 11 năm 2021",
    "Luật sửa đổi bổ sung một số điều của luật tổ chức chính phủ ngày 22 tháng 11 năm 2022",
    "Luật sửa đổi bổ sung một số điều của luật tổ chức chính phủ ngày 22 tháng 11 năm 2023",
    "Luật sửa đổi bổ sung một số điều của luật tổ chức chính phủ ngày 22 tháng 11 năm 2018",
    "Luật sửa đổi bổ sung một số điều của luật tổ chức chính phủ ngày 22 tháng 11 năm 2017",
    "Luật sửa đổi bổ sung một số điều của luật tổ chức chính phủ ngày 22 tháng 11 năm 2016",
    "Luật sửa đổi bổ sung một số điều của luật tổ chức chính phủ ngày 22 tháng 11 năm 2015",
  ];

  final resolutionSuggestions = [
    "Gia hạn thời gian tổ chức cuộc họp ĐHĐCĐ thường niên năm 2023: dự kiến tổ chức vào ngày 22/06/2023.",
    "Chốt ngày đăng kí cuối cùng để lập danh sách cổ đông có quyền tham dự họp ĐHĐCĐ thường niên là ngày 18/05/2023.",
    "Địa điểm dự kiến tổ chức và nội dung họp: Công ty sẽ thông báo chi tiết tại \"Thư mời\" tham dự họp ĐHĐCĐ thường niên năm 2023.",
    "HĐQT thống nhất trao quyền cho Chủ tịch HĐQT, người đại diện theo pháp luật của Công Ty tiến hành các thủ tục cần thiết theo quy định của pháp luật để hoàn thành các nội dung quy định tại các điều 1, 2, 3 của nghị quyết này.",
    "Các thành viên HĐQT, Ban Tổng Giám Đốc, các Phòng/Ban và cá nhân có liên quan của Công Ty chịu trách nhiệm thi hành Nghị quyết này.",
    "Nghị quyết có hiệu lực kể từ ngày kí.",
    "Luật sửa đổi bổ sung một số điều của luật tổ chức chính phủ ngày 22 tháng 11 năm 2022",
    "Luật sửa đổi bổ sung một số điều của luật tổ chức chính phủ ngày 22 tháng 11 năm 2023",
    "Luật sửa đổi bổ sung một số điều của luật tổ chức chính phủ ngày 22 tháng 11 năm 2018",
    "Luật sửa đổi bổ sung một số điều của luật tổ chức chính phủ ngày 22 tháng 11 năm 2017",
    "Luật sửa đổi bổ sung một số điều của luật tổ chức chính phủ ngày 22 tháng 11 năm 2016",
    "Luật sửa đổi bổ sung một số điều của luật tổ chức chính phủ ngày 22 tháng 11 năm 2015",
  ];

  final RxList<String?> suggestions = <String?>[].obs;
  late BasisObject? currentBasis;
  late ResolutionObject? currentResolution;
  late ConsumerObject? currentConsumer;

  static const String basisHint =
      "........................................................................................................................";

  final basises = <String>[
    basisHint,
    basisHint,
    basisHint,
    basisHint,
    basisHint,
  ].obs;

  final lstBasises = <BasisObject?>[].obs;

  static const String resolutionHint =
      "..................................................................................................................................................................................................................................................................";

  final resolutions = <String>[
    resolutionHint,
    resolutionHint,
    resolutionHint,
    resolutionHint,
    resolutionHint,
    resolutionHint,
    resolutionHint,
  ].obs;

  final lstResolutions = <ResolutionObject?>[].obs;

  static const consumerHint = "- ......................;";

  final consumers = <String>[
    "- Như điều: ............;",
    "- ......................;",
    "- Lưu VT, ..............;"
  ].obs;

  final lstConsumers = <ConsumerObject?>[].obs;

  final QuillEditorController quillEditorController = QuillEditorController();

  final _searchDebouncer = Debouncer(milliseconds: 300);

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
    authorizationTitleEditTextDesController = TextEditingController();
    authTitleEdtFocusNode = FocusNode(onKey: (node, event) => addNewBasisIfNeeded(event, -1));
    resolveEditTextDesController = TextEditingController();
    resolveDescriptionEditTextDesController = TextEditingController();
    resolveDesEdtFocusNode = FocusNode(
      onKey: (node, event) => addNewResolutionIfNeeded(event, -1),
    );
    consumerEditTextDesController = TextEditingController();
    consumerEdtFocusNode = FocusNode(onKey: (node, event) => addNewConsumerIfNeeded(event, -1));
    positionEditTextDesController = TextEditingController();
    positionNoteEditTextDesController = TextEditingController();
    delegateFullNameEditTextDesController = TextEditingController();

    basises.asMap().forEach((index, value) {
      lstBasises.add(
        _buildNewBasis(
          index,
          BasisObject(
            basis: value,
            editTextController: TextEditingController(),
          ),
        ),
      );
    });

    resolutions.asMap().forEach((index, resolution) {
      lstResolutions.add(
        _buildNewResolution(
          index,
          ResolutionObject(
            resolution: resolution,
            editTextController: TextEditingController(),
          ),
        ),
      );
    });

    consumers.asMap().forEach((index, consumer) {
      lstConsumers.add(
        _buildNewConsumer(
          index,
          ConsumerObject(
            consumer: consumer,
            editTextController: TextEditingController(),
          ),
        ),
      );
    });
  }

  BasisObject? _buildNewBasis(int? index, BasisObject? oldBasis) {
    final x = index;
    final currentFocusNode = FocusNode(
      onKey: (node, event) => addNewBasisIfNeeded(event, x),
    );
    final newBasis = (oldBasis == null)
        ? BasisObject(
            index: index,
            basis: basisHint,
            editTextController: TextEditingController(),
            focusNode: currentFocusNode,
          )
        : oldBasis.copyWith(
            index: x,
            focusNode: currentFocusNode,
          );

    currentFocusNode.addListener(() {
      if (currentFocusNode.hasFocus == true) {
        Fimber.d("currentFocusNode: $newBasis");
        currentBasis = newBasis;
      }
    });
    return newBasis;
  }

  ResolutionObject? _buildNewResolution(int? index, ResolutionObject? oldResolution) {
    final x = index;
    final currentFocusNode = FocusNode(
      onKey: (node, event) => addNewBasisIfNeeded(event, x),
    );
    final newResolution = (oldResolution == null)
        ? ResolutionObject(
            index: index,
            resolution: resolutionHint,
            editTextController: TextEditingController(),
            focusNode: currentFocusNode,
          )
        : oldResolution.copyWith(
            index: x,
            focusNode: currentFocusNode,
          );
    currentFocusNode.addListener(() {
      if (currentFocusNode.hasFocus == true) {
        currentResolution = newResolution;
      }
    });
    return newResolution;
  }

  ConsumerObject? _buildNewConsumer(int? index, ConsumerObject? oldConsumer) {
    final x = index;
    final currentFocusNode = FocusNode(
      onKey: (node, event) => addNewConsumerIfNeeded(event, x),
    );
    final newConsumer = (oldConsumer == null)
        ? ConsumerObject(
            index: index,
            consumer: consumerHint,
            editTextController: TextEditingController(),
            focusNode: currentFocusNode,
          )
        : oldConsumer.copyWith(
            index: x,
            focusNode: currentFocusNode,
          );
    currentFocusNode.addListener(() {
      if (currentFocusNode.hasFocus == true) {
        currentConsumer = newConsumer;
      }
    });
    return newConsumer;
  }

  @override
  void onReady() {
    super.onReady();
    createdAtEditTextController?.text = "Quảng Ngãi, ngày ..., tháng ..., năm ... .";
    docNumberEditTextController?.text = "Số: .../... NQ-.......";
    resolutionTextController?.text = "Nghị quyết".toUpperCase();
    authorizationEditTextDesController?.text = "Thẩm quyền ban hành".toUpperCase();
    authorizationTitleEditTextDesController?.text = "Căn cứ:";
    resolveEditTextDesController?.text = "Quyết nghị".toUpperCase();
    resolveDescriptionEditTextDesController?.text = "Thông qua việc ...";
    consumerEditTextDesController?.text = "${LocaleKeys.consumer.tr}:";
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

  bool needToAddNewsOne(RawKeyEvent? key) {
    if (key?.isShiftPressed == true &&
        (key is RawKeyDownEvent) &&
        key.logicalKey.keyLabel.equalsIgnoreCase("Enter") == true) {
      Fimber.d("Add a new line.");
      return true;
    }
    return false;
  }

  changeBasisValue(String value) {
    Fimber.d("changeBasisValue(String $value)");
  }

  deleteBasis(BasisObject? basis) {
    Fimber.d("deleteBasis(BasisObject? ${basis.toString()})");
    lstBasises.remove(basis);
    lstBasises.value = lstBasises.value;
  }

  deleteConsumer(ConsumerObject? consumer) {
    Fimber.d("deleteConsumer(ConsumerObject? ${consumer.toString()})");
    lstConsumers.remove(consumer);
    lstConsumers.value = lstConsumers.value;
  }

  deleteResolution(ResolutionObject? resolution) {
    Fimber.d("deleteResolution(ResolutionObject? ${resolution.toString()})");
    lstResolutions.remove(resolution);
    lstResolutions.value = lstResolutions.value;
  }

  KeyEventResult addNewBasisIfNeeded(RawKeyEvent value, int? index) {
    Fimber.d("addNewBasisIfNeeded(RawKeyEvent value, index: $index)");
    if (needToAddNewsOne(value)) {
      if (index == -1) authTitleEdtFocusNode?.unfocus();
      if (index != null && index >= 0) lstBasises.value[index]?.focusNode?.unfocus();
      final newBasis = BasisObject(
          index: (index ?? 0) + 1, basis: basisHint, editTextController: TextEditingController());
      lstBasises.value.insert((index ?? 0) + 1, newBasis);

      final List<BasisObject?> result = [];
      lstBasises.value.forEachIndexed((element, index) {
        result.add(_buildNewBasis(index, element));
      });
      lstBasises.value = result;
      // request focus to the new item.
      basisItemRequestFocus.value = lstBasises[(index ?? 0) + 1];
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  KeyEventResult addNewResolutionIfNeeded(RawKeyEvent event, int? index) {
    Fimber.d("addNewResolutionIfNeeded(RawKeyEvent value, index: $index)");
    if (needToAddNewsOne(event)) {
      if (index == -1) resolveDesEdtFocusNode?.unfocus();
      if (index != null && index >= 0) lstResolutions.value[index]?.focusNode?.unfocus();

      final newResolution = ResolutionObject(
          index: (index ?? 0) + 1,
          resolution: resolutionHint,
          editTextController: TextEditingController());
      lstResolutions.value.insert((index ?? 0) + 1, newResolution);

      final List<ResolutionObject?> result = [];
      lstResolutions.value.forEachIndexed((element, index) {
        result.add(_buildNewResolution(index, element));
      });
      lstResolutions.value = result;
      // request focus to the new item.
      resolutionItemRequestFocus.value = lstResolutions[(index ?? 0) + 1];
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  KeyEventResult addNewConsumerIfNeeded(RawKeyEvent value, int? index) {
    Fimber.d("addNewConsumerIfNeeded(RawKeyEvent $value, index: $index)");
    if (needToAddNewsOne(value)) {
      if (index == -1) consumerEdtFocusNode?.unfocus();
      if (index != null && index >= 0) lstConsumers.value[index]?.focusNode?.unfocus();

      final newConsumer = ConsumerObject(
        index: (index ?? 0) + 1,
        consumer: consumerHint,
        editTextController: TextEditingController(),
      );
      lstConsumers.value.insert((index ?? 0) + 1, newConsumer);

      final List<ConsumerObject?> result = [];
      lstConsumers.value.forEachIndexed((element, index) {
        result.add(_buildNewConsumer(index, element));
      });
      lstConsumers.value = result;
      // request focus to the new item.
      consumerItemRequestFocus.value = lstConsumers[(index ?? 0) + 1];
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  retrieveBasisSugesstion(String value, BasisObject? basis) async {
    Fimber.d("retrieveBasisSugesstion(String $value)");
    _searchDebouncer.run(() async {
      final response = await docBasisRepo?.searchBasis(value);
      response?.when(
        success: (data) {
          Fimber.d(data.result.toString());
          suggestions.value = basisSuggestions;
          basisSuggestions = data.result?.mapList((e) => e?.tieude) ?? [];
          currentBasis = basis;
          currentResolution = null;
          currentConsumer = null;
        },
        failure: (error) {
          Fimber.d(error.toString());
        },
      );
    });
  }

  retrieveResolutionSuggestions(String value, ResolutionObject? resolution) {
    Fimber.d("retrieveResolutionSuggestions(String $value)");
    suggestions.value = resolutionSuggestions;
    currentResolution = resolution;
    currentBasis = null;
    currentConsumer = null;
  }

  navigateToPreview() {
    final resolutionData = ResolutionDataObject(
      organization: organizationEditTextController?.text,
      docNumber: docNumberEditTextController?.text,
      createdAt: createdAtEditTextController?.text,
      resolution: resolutionTextController?.text,
      resolutionDes: resolutionEditTextDesController?.text,
      author: authorizationEditTextDesController?.text,
      basises: lstBasises,
      resolve: resolveEditTextDesController?.text,
      resolveDescription: resolveDescriptionEditTextDesController?.text,
      resolutions: lstResolutions,
      consumers: lstConsumers,
      rightPositionOfDelegate: positionEditTextDesController?.text,
      delegate: delegateFullNameEditTextDesController?.text,
    );
    Get.toNamed(Routes.DOCUMENT_PREVIEW, arguments: resolutionData);
  }

  pickSuggestion(String? suggestion) {
    Fimber.d("pickSuggestion(String? $suggestion)");
    currentBasis?.editTextController?.text = suggestion ?? "";
    currentResolution?.editTextController?.text = suggestion ?? "";
  }

  saveDocument() {
    Fimber.d("saveDocument()");
    final resolutionData = ResolutionDataObject(
      organization: organizationEditTextController?.text,
      docNumber: docNumberEditTextController?.text,
      createdAt: createdAtEditTextController?.text,
      resolution: resolutionTextController?.text,
      resolutionDes: resolutionEditTextDesController?.text,
      author: authorizationEditTextDesController?.text,
      basises: lstBasises,
      resolve: resolveEditTextDesController?.text,
      resolveDescription: resolveDescriptionEditTextDesController?.text,
      resolutions: lstResolutions,
      consumers: lstConsumers,
      rightPositionOfDelegate: positionEditTextDesController?.text,
      delegate: delegateFullNameEditTextDesController?.text,
    );
  }
}
