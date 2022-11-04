// ignore_for_file: depend_on_referenced_packages

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:getx_sample/data/bean/coin_price_response/coin_price_response.dart';
import 'package:getx_sample/data/remote/interfaces/base_response_object.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "https://api.binance.com/api/v3/ticker/", parser: Parser.FlutterCompute)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("price?symbol={symbol}")
  Future<BaseResponseObject<List<CoinPriceResponse?>?>> getCoinPrice(@Path() String symbol);
}

BaseResponseObject<CoinPriceResponse> deserializeBaseResponseObject(
        Map<String, dynamic> json) =>
    BaseResponseObject.fromJson(json, CoinPriceResponse.fromJsonObject);

BaseResponseObject<List<CoinPriceResponse?>?> deserializeBaseResponseObjectList(
        Map<String, dynamic> json) =>
    BaseResponseObject.fromJson(json, CoinPriceResponse.createListFromJsonObject);

Map<String, dynamic> serializeBaseResponseObject(CoinPriceResponse object) => object.toJson();

List<Map<String, dynamic>> serializeBaseResponseObjectList(List<CoinPriceResponse> objects) =>
    objects.map((e) => e.toJson()).toList();
