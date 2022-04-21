import 'package:getx_sample/data/bean/delegate_response/delegate_response.dart';

abstract class DelegateRepository {
  Future<DelegateResponse?> getDelegate(String address);
}
