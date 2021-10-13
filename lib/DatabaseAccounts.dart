import 'transfer.dart';

class UpdateBalance extends Variables {
  money() {
    return super.money();
  }
}

class AdminAccounts {
  static int _privBalance = 100000;
  int _transferMoney = UpdateBalance().money();
  int loop = 0;

  balance() {
    _privBalance -= _transferMoney;
    return _privBalance;
  }
}
