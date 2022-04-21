import 'package:getx_sample/data/bean/wallet_response/wallet_object.dart';
import 'package:getx_sample/data/bean/wallet_response/wallet_response.dart';

abstract class WalletRepository {
  Future<WalletResponse?> getWallet(String address);

  Future saveWalletToStorage(WalletObject? wallet);
}
