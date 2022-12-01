import 'package:dio/dio.dart';
import 'package:fimber/fimber.dart';
import 'package:getx_sample/data/remote/wrappers/network_error.dart';
import 'package:getx_sample/data/remote/wrappers/network_options.dart';
import 'package:getx_sample/data/remote/wrappers/result.dart';

import '../interfaces/base_client_generator.dart';
import '../layers/network_connectivity.dart';
import 'network_creator.dart';
import 'network_decoder.dart';

///     route : Route defined by client
///     T : Response type.
///     K : It specifies how the response type value should be. List or object.

class NetworkExecutor {
  static Future<Result<K, NetworkError>> execute<T, K>(
      {required BaseClientGenerator route,
      required T responseType,
      NetworkOptions? options}) async {
    Fimber.d(route.toString());

    // Check Network Connectivity
    if (await NetworkConnectivity.status) {
      try {
        var response = await NetworkCreator.shared.request(route: route, options: options);
        var data =
            NetworkDecoder.shared.decode<T, K>(response: response, responseType: responseType);

        /// handle errors follow by base response's status
        // if((data as BaseResponseObject?)?.status == 'status') {
        //   return Result.success(data);
        //   return const Result.failure(NetworkError.type(error: 'custom response follow by the base response\'s status'));
        // }

        return Result.success(data);

        // NETWORK ERROR
      } on DioError catch (diorError) {
        Fimber.d("$route => ${NetworkError.request(error: diorError)}");
        return Result.failure(NetworkError.request(error: diorError));

        // TYPE ERROR
      } on TypeError catch (e) {
        Fimber.d("$route => ${NetworkError.type(error: e.toString())}");
        return Result.failure(NetworkError.type(error: e.toString()));
      }

      // No Internet Connection
    } else {
      Fimber.d('No Internet Connection');
      return const Result.failure(NetworkError.connectivity(message: 'No Internet Connection'));
    }
  }
}
