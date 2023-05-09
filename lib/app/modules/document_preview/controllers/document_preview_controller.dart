import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/route_manager.dart';
import 'package:getx_sample/app/modules/base/base.dart';
import 'package:getx_sample/data/bean/resolution_data_object/resolution_data_object.dart';

class DocumentPreviewController extends BaseController {
  final Rx<ResolutionDataObject> resolutionDataObject = ResolutionDataObject().obs;

  @override
  void onInit() {
    if (Get.arguments != null) {
      resolutionDataObject.value = Get.arguments;
    }
    super.onInit();
  }
}
