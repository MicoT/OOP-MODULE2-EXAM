import 'package:flutter/widgets.dart';
import '../transferMoney.dart';
import '../under_development.dart';

class Actions {
  String action;
  String icon;
  Widget Function() navigateTo;

  Actions(this.action, this.icon, this.navigateTo);
}

var actions = [
  Actions("Money\nTransfer", "assets/money_transfer_blue.svg",
      () => TransferMoneyScreen()),
  Actions("Bank\nWithdraw", "assets/bank_withdraw_blue.svg",
      () => UnderDevelopmentScreen()),
  Actions("Insight\nTracking", "assets/insight_tracking_blue.svg",
      () => UnderDevelopmentScreen()),
];
//Final