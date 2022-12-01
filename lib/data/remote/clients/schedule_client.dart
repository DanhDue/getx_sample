import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:getx_sample/app/environment_configurations.dart';

import '../interfaces/base_client_generator.dart';

part 'schedule_client.freezed.dart';

@freezed
class ScheduleClient extends BaseClientGenerator with _$ScheduleClient {
  const ScheduleClient._() : super();
  const factory ScheduleClient.test() = _Test;

  @override
  String get baseURL => '${EnvironmentConfig.BASE_URL}/schedule';

  @override
  Map<String, dynamic>? get body {
    return maybeWhen(orElse: () => null);
  }

  @override
  Map<String, dynamic> get header => {"Content-Type": "application/json"};

  @override
  String get method {
    return maybeWhen<String>(
      orElse: () => '',
    );
  }

  @override
  String get path {
    return maybeWhen<String>(
      orElse: () => '',
    );
  }

  @override
  Map<String, dynamic>? get queryParameters {
    return maybeWhen(orElse: () => null);
  }
}
