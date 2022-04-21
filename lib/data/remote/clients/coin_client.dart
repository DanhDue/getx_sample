import 'package:freezed_annotation/freezed_annotation.dart';

import '../interfaces/base_client_generator.dart';

part 'coin_client.freezed.dart';

@freezed
class CoinClient extends BaseClientGenerator with _$CoinClient {
  const CoinClient._() : super();

  const factory CoinClient.wallet() = _Wallet;

  const factory CoinClient.delegate() = _Delegate;

  const factory CoinClient.blockChain() = _BlockChain;

  @override
  String get baseURL => 'https://sxp.testnet.sh/api/';

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
      blockChain: () => 'blockchain/',
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
