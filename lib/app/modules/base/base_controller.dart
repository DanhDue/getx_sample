// Copyright (c) 2023, one of the D3F outsourcing projects. All rights reserved.

// ignore_for_file: depend_on_referenced_packages

import 'package:get/get.dart';

abstract class BaseController<T> extends GetxController with StateMixin<T> {
  var isLoading = false.obs;
  var isRefreshing = false.obs;
  var isError = false.obs;
  var hasNoData = false.obs;
}
