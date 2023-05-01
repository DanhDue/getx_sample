import 'package:get/get.dart';
import 'package:getx_sample/app/modules/base/base.dart';

class DocumentsController extends BaseController {
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
    "Căn cứ luật sửa đổi bổ sung một số điều của luật tổ chức chính phủ ngày 22 tháng 11 năm 2019",
  ].obs;
}
