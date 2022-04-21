import 'package:getx_sample/data/bean/block_chain/block_chain.dart';
import 'package:getx_sample/data/bean/delegate_response/delegate_response.dart';
import 'package:getx_sample/data/bean/wallet_response/wallet_response.dart';

abstract class CoinApiService {
  Future<BlockChain?> getBlockChain();

  Future<WalletResponse?> getWallet(String? walletAddress);

  /// an address is in one of the types: username, address, publicKey
  Future<DelegateResponse?> getDelegateDetails(String? address);
}
