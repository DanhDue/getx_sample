import 'package:get/get.dart';

abstract class BaseController<T> extends GetxController with StateMixin<T> {
  var isLoading = false.obs;
  var isRefreshing = false.obs;
}
