import 'package:getx_sample/data/bean/wallet_response/wallet_object.dart';
import 'package:getx_sample/data/bean/wallet_response/wallet_response.dart';
import 'package:getx_sample/data/repositories/wallet_repository.dart';

class WalletRepositoryImpl extends WalletRepository {
  @override
  Future<WalletResponse?> getWallet(String address) {
    // TODO: implement getWallet
    throw UnimplementedError();
  }

  @override
  Future saveWalletToStorage(WalletObject? wallet) {
    // TODO: implement saveWalletToStorage
    throw UnimplementedError();
  }
}
