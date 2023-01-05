// Copyright (c) 2022, one of the D3F outsourcing projects. All rights reserved.

import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:getx_sample/app/modules/base/base_controller.dart';
import 'package:getx_sample/data/remote/interfaces/base_response_object.dart';
import 'package:getx_sample/data/remote/wrappers/result.dart';
import 'package:getx_sample/utils/constants.dart';

abstract class BaseInfiniteListController<T> extends BaseController<T> {
  bool? hasMore = false;
  int pageNumber = 1;
  int defaultItemsPerPageCount = InfiniteList.ITEMS_PER_PAGE;
  int nextPageThreshold = InfiniteList.NEXT_PAGE_THRESHOLD;
  var items = List<T?>.empty(growable: true);
  bool? loadMoreError = false;
  bool? isFirstLoad = true;
  GlobalKey? refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  void onReady() {
    fetchData();
  }

  @override
  void onClose() {
    EasyLoading.dismiss();
    super.onClose();
  }

  Future<void> fetchData({bool? isLoadMore = false, bool? isRefresh = false}) async {
    if (isFirstLoad == true) isLoading.value = true;
    if (isLoadMore == true) {
      loadMoreError = false;
      update();
    }
    if (isRefresh == true) {
      isFirstLoad = true;
      pageNumber = 1;
    }
    Fimber.d(
        "fetchData({isLoadMore = $isLoadMore, isRefresh = $isRefresh, pageNumber: $pageNumber})");
    final response = await retrieveDataFromService(pageNumber);
    response.when(success: (data) {
      if (isRefresh == true) items.clear();
      // for the retrieveDatasFromService method.
      // items.addAll(data.map((e) => e?.result));

      // for the retrieveDataFromService method.
      // items.addAll(data.result?.toList() ?? []);
      // final newItems = data.result?.toList();

      final newItems = data.map((e) => e?.result);
      hasMore = newItems.length == InfiniteList.ITEMS_PER_PAGE;

      final optimizedItems = prepareDataBeforeAdding(allItems: items, newItems: newItems.toList());
      optimizedItems?.isNotEmpty == true
          ? {items.clear(), items.addAll(optimizedItems ?? [])}
          : {items.addAll(newItems)};

      pageNumber = pageNumber + 1;
      if (isFirstLoad == true) isError.value = '';
      if (isFirstLoad == true) {
        isFirstLoad = false;
        isLoading.value = false;
      }
      if (items.isEmpty == true) hasNoData.value = true;
      update();
    }, failure: (error) {
      Fimber.e(error.toString());
      if (isFirstLoad == true) {
        items.clear();
        update();
        isError.value = 'true';
        isLoading.value = false;
      } else {
        loadMoreError = true;
      }
    });
  }

  // This method is used to prepare the model data list before updating the list view.
  // Example: You need to filter/group/change,.. one or more model items.
  List<T?>? prepareDataBeforeAdding({List<T?>? allItems, List<T?>? newItems}) => null;

  // Future<Result<BaseResponseObject<List<T?>?>, Exception>> retrieveDataFromService(
  //     int? pageNumber);
  Future<Result<List<BaseResponseObject<T?>?>, Exception>> retrieveDataFromService(
      int? pageNumber);
}
