import 'package:getx_sample/data/bean/suggestion_object/suggestion_object.dart';
import 'package:getx_sample/data/remote/interfaces/base_response_object.dart';
import 'package:getx_sample/data/remote/wrappers/network_error.dart';
import 'package:getx_sample/data/remote/wrappers/result.dart';

abstract class DocumentBasisRepository {
  Future<Result<BaseResponseObject<List<SuggestionObject?>?>, NetworkError>> searchBasis(
      String? text);
  Future<Result<BaseResponseObject<String?>, NetworkError>> autoGenBasis(String? text);
}
