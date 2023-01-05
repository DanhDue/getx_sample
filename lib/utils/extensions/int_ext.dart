// Copyright (c) 2023, one of the D3F outsourcing projects. All rights reserved.

// coverage:ignore-file

import 'package:intl/intl.dart';

extension IntExt on int? {
  String? retrieveMoneyAmountFromSNumber() {
    return NumberFormat("#,##0", "en_US").format((double.tryParse(toString()))?.toInt());
  }
}
