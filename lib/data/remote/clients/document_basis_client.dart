import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:getx_sample/app/environment_configurations.dart';
// ignore: depend_on_referenced_packages
import 'package:http_mock_adapter/http_mock_adapter.dart';

import '../interfaces/base_client_generator.dart';

part 'document_basis_client.freezed.dart';

@freezed
class DocumentBasisClient extends BaseClientGenerator with _$DocumentBasisClient {
  const DocumentBasisClient._() : super();
  const factory DocumentBasisClient.search(String? text) = _Search;
  const factory DocumentBasisClient.auto(String? text) = _Auto;

  @override
  String get baseURL => '${EnvironmentConfig.DOCUMENT_URL}/vbpl/cancu';

  @override
  Map<String, dynamic>? get body {
    return maybeWhen(
      search: (text) => {'text': text},
      auto: (text) => {'text': text},
      orElse: () => null,
    );
  }

  @override
  Map<String, dynamic> get header => {
        "Content-Type": "application/json",
      };

  @override
  String get method {
    return maybeWhen<String>(
      orElse: () => RequestMethods.post.name,
    );
  }

  @override
  String get path {
    return maybeWhen<String>(
      search: (text) => '/search',
      auto: (text) => '/auto',
      orElse: () => '',
    );
  }

  @override
  Map<String, dynamic>? get queryParameters {
    return maybeWhen(orElse: () => null);
  }
}
