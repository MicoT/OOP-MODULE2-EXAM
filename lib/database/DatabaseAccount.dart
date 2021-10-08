import 'package:DBP/transferMoney.dart';

class UpdateBalance extends Variables {
  money() {
    return super.money();
  }
}

class AdminAccount {
  static int _privBalance = 100000;
  int _transferMoney = UpdateBalance().money();

  balance() {
    _privBalance -= _transferMoney;
    return _privBalance;
  }
}
