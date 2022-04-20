import 'package:dio/dio.dart';
import 'package:fimber/fimber.dart';
import 'package:getx_sample/data/remote/interfaces/base_response_object.dart';
import 'package:getx_sample/data/remote/network_error.dart';
import 'package:getx_sample/data/remote/network_options.dart';
import 'package:getx_sample/data/remote/result.dart';

import '../interfaces/base_client_generator.dart';
import '../layers/network_connectivity.dart';
import 'network_creator.dart';
import 'network_decoder.dart';

class NetworkExecutor {
  static bool debugMode = true;

  static Future<Result<K, NetworkError>>
      execute<T extends BaseResponseObject, K>(
          {required BaseClientGenerator route,
          required T responseType,
          NetworkOptions? options}) async {
    Fimber.d(route.toString());

    // Check Network Connectivity
    if (await NetworkConnectivity.status) {
      try {
        var response =
            await NetworkCreator.shared.request(route: route, options: options);
        var data = NetworkDecoder.shared
            .decode<T, K>(response: response, responseType: responseType);
        return Result.success(data);

        // NETWORK ERROR
      } on DioError catch (diorError) {
        if (debugMode) {
          Fimber.d("$route => ${NetworkError.request(error: diorError)}");
        }
        return Result.failure(NetworkError.request(error: diorError));

        // TYPE ERROR
      } on TypeError catch (e) {
        if (debugMode) {
          Fimber.d("$route => ${NetworkError.type(error: e.toString())}");
        }
        return Result.failure(NetworkError.type(error: e.toString()));
      }

      // No Internet Connection
    } else {
      Fimber.d('No Internet Connection');
      return const Result.failure(
          NetworkError.connectivity(message: 'No Internet Connection'));
    }
  }
}
