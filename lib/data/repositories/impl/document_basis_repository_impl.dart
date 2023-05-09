import 'package:getx_sample/data/bean/suggestion_object/suggestion_object.dart';
import 'package:getx_sample/data/remote/clients/document_basis_client.dart';
import 'package:getx_sample/data/remote/interfaces/base_response_object.dart';
import 'package:getx_sample/data/remote/layers/network_executor.dart';
import 'package:getx_sample/data/remote/wrappers/network_error.dart';
import 'package:getx_sample/data/remote/wrappers/result.dart';
import 'package:getx_sample/data/repositories/document_basis_repository.dart';

class DocumentBasisRepositoryImpl extends DocumentBasisRepository {
  @override
  Future<Result<BaseResponseObject<List<SuggestionObject?>?>, NetworkError>> searchBasis(
      String? text) {
    return NetworkExecutor.execute<BaseResponseObject<List<SuggestionObject?>?>,
            BaseResponseObject<List<SuggestionObject?>?>>(
        route: DocumentBasisClient.search(text),
        responseType: const BaseResponseObject<List<SuggestionObject?>?>());
  }

  @override
  Future<Result<BaseResponseObject<List<SuggestionObject?>?>, NetworkError>> autoGenBasis(
      String? text) {
    return NetworkExecutor.execute<BaseResponseObject<List<SuggestionObject?>?>,
            BaseResponseObject<List<SuggestionObject?>?>>(
        route: DocumentBasisClient.auto(text),
        responseType: const BaseResponseObject<List<SuggestionObject?>?>());
  }
}
