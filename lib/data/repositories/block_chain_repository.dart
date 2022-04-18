import 'package:getx_sample/data/bean/block_chain/block_chain.dart';

abstract class BlockChainRepository {
  Future<BlockChain?> getBlockChain();
}
