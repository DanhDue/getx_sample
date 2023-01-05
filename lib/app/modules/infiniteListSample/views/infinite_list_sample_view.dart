// Copyright (c) 2023, one of the D3F outsourcing projects. All rights reserved.

// coverage:ignore-file

import 'package:flutter/material.dart';
import 'package:getx_sample/app/modules/base/infinite_list/base_infinite_list_view.dart';
import 'package:getx_sample/app/modules/infiniteListSample/controllers/infinite_list_sample_controller.dart';
import 'package:getx_sample/app/modules/infiniteListSample/data/bean/photo_object.dart';

class InfiniteListSampleView extends BaseInfiniteListView<InfiniteListSampleController> {
  InfiniteListSampleView({Key? key}) : super(key: key);

  @override
  String? get pageTitle => 'Infinite List';

  @override
  bool? get topSafeArea => true;

  @override
  Widget buildItemViews(BuildContext context, {item, int? index}) {
    if (item is PhotoObject) {
      return Container(
          width: double.infinity,
          height: 152,
          color: item.color,
          child: Center(
            child: Text(
              'Entry $index',
              style: const TextStyle(color: Colors.white),
            ),
          ));
    }
    return const SizedBox.shrink();
  }
}
