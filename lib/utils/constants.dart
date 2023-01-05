// Copyright (c) 2023, one of the D3F outsourcing projects. All rights reserved.

// coverage:ignore-file

import 'dart:ui';

class Constants {
  static const emailValidateReg =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static const phoneValidateReg = r"([\+84|84|0]+(3|5|7|8|9|1[2|6|8|9]))+([0-9]{8})\b";
}

class LMSLocale {
  static const Locale vnVI = Locale("vn", "VI");
  static const Locale enUS = Locale("en", "US");
}

class ToastDuration {
  static const LENGTH_SHORT = Duration(milliseconds: 2000);
  static const LENGTH_LONG = Duration(milliseconds: 3500);
}

class InfiniteList {
  static const int ITEMS_PER_PAGE = 10;
  static const int NEXT_PAGE_THRESHOLD = 3;
}
