import 'package:fimber/fimber.dart';
import 'package:getx_sample/data/bean/block_chain/block_chain.dart';
import 'package:getx_sample/data/bean/coin_price_response/coin_price_response.dart';
import 'package:getx_sample/data/bean/refresh_token_response/refresh_token_response.dart';
import 'package:getx_sample/data/remote/interfaces/base_response_object.dart';

extension NetworkResponseConverter on BaseResponseObject {
  BaseResponseObject? decodeJson(Map<String, dynamic> json) {
    if (this is BaseResponseObject<BlockChain>) {
      return BaseResponseObject<BlockChain>.fromJson(
          json, BlockChain.fromJsonObject);
    }
    if (this is BaseResponseObject<CoinPriceResponse>) {
      return BaseResponseObject<CoinPriceResponse>.fromJson(
          json, CoinPriceResponse.fromJsonObject);
    }
    if (this is BaseResponseObject<List<CoinPriceResponse>>) {
      return BaseResponseObject<List<CoinPriceResponse>>.fromJson(
          json, CoinPriceResponse.createListFromJsonObject);
    }
    if (this is BaseResponseObject<RefreshTokenResponse>) {
      return BaseResponseObject<RefreshTokenResponse>.fromJson(
          json, RefreshTokenResponse.fromJsonObject);
    }
    Fimber.e('You need to implement the decodeJson method');
    return null;
  }

  Map<String, dynamic>? encodeJson() {
    if (this is BlockChain) {
      return (this as BaseResponseObject<BlockChain>?)
          ?.toJson((value) => value.toJson());
    }
    if (this is CoinPriceResponse) {
      return (this as BaseResponseObject<CoinPriceResponse>?)
          ?.toJson((value) => value.toJson());
    }
    if (this is RefreshTokenResponse) {
      return (this as BaseResponseObject<RefreshTokenResponse>?)
          ?.toJson((value) => value.toJson());
    }
    Fimber.e('You need to implement the encodeJson method');
    return null;
  }
}
