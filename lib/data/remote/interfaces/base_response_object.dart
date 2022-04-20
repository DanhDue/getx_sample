import 'package:getx_sample/data/bean/block_chain/block_chain.dart';

abstract class BaseResponseObject<T> {}

extension NetworkResponseConverter on BaseResponseObject {
  BaseResponseObject? decodeJson(Map<String, dynamic> json) {
    if (this is BlockChain) return BlockChain.fromJson(json);
    return null;
  }

  Map<String, dynamic>? encodeJson() {
    if (this is BlockChain) return (this as BlockChain).toJson();
    return null;
  }
}
