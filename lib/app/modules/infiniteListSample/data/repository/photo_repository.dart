// Copyright (c) 2022, one of the D3F outsourcing projects. All rights reserved.

import 'package:getx_sample/app/modules/infiniteListSample/data/bean/photo_object.dart';
import 'package:getx_sample/data/remote/interfaces/base_response_object.dart';
import 'package:getx_sample/data/remote/wrappers/result.dart';

abstract class PhotoRepository {
  Future<Result<List<BaseResponseObject<PhotoObject?>?>, Exception>> loadPhoto(int? pageNumber);
}
