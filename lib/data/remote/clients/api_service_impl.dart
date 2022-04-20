import 'package:getx_sample/app/app.dart';

import '../interfaces/base_client_generator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_service_impl.freezed.dart';

@freezed
class ApiServiceImpl extends BaseClientGenerator with _$ApiServiceImpl {
  const ApiServiceImpl._() : super();
  const factory ApiServiceImpl.wallet() = _Wallet;
  const factory ApiServiceImpl.delegate() = _Delegate;

  @override
  String get baseURL => EnvironmentConfig.BASE_URL;

  @override
  Map<String, dynamic>? get body {
    return maybeWhen(
      orElse: () {
        return null;
      },
    );
  }

  @override
  Map<String, dynamic> get header => {"Content-Type": "application/json"};

  @override
  String get method {
    return maybeWhen<String>(
      orElse: () => 'GET',
    );
  }

  @override
  String get path {
    return when<String>(
      wallet: () => 'posts/',
      delegate: () => 'users/',
    );
  }

  @override
  Map<String, dynamic>? get queryParameters {
    return maybeWhen(
      orElse: () {
        return null;
      },
    );
  }
}
