import 'package:getx_sample/data/bean/block_chain/block_chain.dart';

abstract class ApiService {
  Future<BlockChain?> getBlockChain();
}
