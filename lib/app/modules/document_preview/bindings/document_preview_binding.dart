import 'package:get/get.dart';

import '../controllers/document_preview_controller.dart';

class DocumentPreviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DocumentPreviewController>(
      () => DocumentPreviewController(),
    );
  }
}
