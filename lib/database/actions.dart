import 'package:flutter/widgets.dart';
import '../test2.dart';
import 'package:my_app/under_development.dart';
import 'package:my_app/transfer.dart';

class Actions {
  String action;
  String icon;
  Widget Function() navigateTo;

  Actions(this.action, this.icon, this.navigateTo);
}

var actions = [
  Actions("Money\nTransfer", "assets/money_transfer_blue.svg",
      () => MoneyTransferScreen()),
  Actions("Bank\nWithdraw", "assets/bank_withdraw_blue.svg",
      () => UnderDevelopmentScreen()),
  Actions("Insight\nTracking", "assets/insight_tracking_blue.svg",
      () => UnderDevelopmentScreen()),
];
