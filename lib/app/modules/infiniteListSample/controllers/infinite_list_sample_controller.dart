// Copyright (c) 2023, one of the D3F outsourcing projects. All rights reserved.

import 'package:get/get.dart';
import 'package:getx_sample/app/modules/base/infinite_list/base_infinite_list_controller.dart';
import 'package:getx_sample/app/modules/infiniteListSample/data/bean/photo_object.dart';
import 'package:getx_sample/app/modules/infiniteListSample/data/repository/photo_repository.dart';
import 'package:getx_sample/data/remote/interfaces/base_response_object.dart';
import 'package:getx_sample/data/remote/wrappers/result.dart';

class InfiniteListSampleController extends BaseInfiniteListController<PhotoObject> {
  final PhotoRepository photoRepo = Get.find();

  @override
  Future<Result<List<BaseResponseObject<PhotoObject?>?>, Exception>> retrieveDataFromService(
          int? pageNumber) =>
      photoRepo.loadPhoto(pageNumber);
}
