import 'package:getx_sample/data/bean/block_chain/block_chain.dart';
import 'package:getx_sample/data/bean/wallet_response/wallet_response.dart';
import 'package:getx_sample/data/bean/delegate_response/delegate_response.dart';
import 'package:getx_sample/data/remote/clients/coin_api_service.dart';

class CoinApiServiceImpl extends CoinApiService {
  @override
  Future<BlockChain?> getBlockChain() {
    // TODO: implement getBlockChain
    throw UnimplementedError();
  }

  @override
  Future<DelegateResponse?> getDelegateDetails(String? address) {
    // TODO: implement getDelegateDetails
    throw UnimplementedError();
  }

  @override
  Future<WalletResponse?> getWallet(String? walletAddress) {
    // TODO: implement getWallet
    throw UnimplementedError();
  }
}
