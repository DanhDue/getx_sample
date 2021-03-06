import 'package:fimber/fimber.dart';
import 'package:getx_sample/data/bean/block_chain/block_chain.dart';
import 'package:getx_sample/data/bean/coin_price_response/coin_price_response.dart';
import 'package:getx_sample/data/bean/refresh_token_response/refresh_token_response.dart';

abstract class BaseResponseObject<T> {}

extension NetworkResponseConverter on BaseResponseObject {
  BaseResponseObject? decodeJson(Map<String, dynamic> json) {
    if (this is BlockChain) return BlockChain.fromJson(json);
    if (this is CoinPriceResponse) return CoinPriceResponse.fromJson(json);
    if (this is RefreshTokenResponse) return RefreshTokenResponse.fromJson(json);
    Fimber.e('You need to implement the decodeJson method');
    return null;
  }

  Map<String, dynamic>? encodeJson() {
    if (this is BlockChain) return (this as BlockChain).toJson();
    if (this is CoinPriceResponse) return (this as CoinPriceResponse).toJson();
    if (this is RefreshTokenResponse) return (this as RefreshTokenResponse).toJson();
    Fimber.e('You need to implement the encodeJson method');
    return null;
  }
}
