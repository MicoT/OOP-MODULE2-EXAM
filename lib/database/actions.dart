import 'package:flutter/widgets.dart';
import '../transfer.dart';
import '../under_development.dart';

class Actions {
  String action;
  String icon;
  String color;
  Widget Function() navigateTo;

  Actions(this.action, this.icon, this.color, this.navigateTo);
}

var actions = [
  Actions("Money\nTransfer", "0xFF00142D", "assets/money_transfer_blue.svg",
      () => HomePageScreen()),
  Actions("Bank\nWithdraw", "0xFF00142D", "assets/bank_withdraw_blue.svg",
      () => UnderDevelopmentScreen()),
  Actions("Insight\nTracking", "0xFF00142D", "assets/insight_tracking_blue.svg",
      () => UnderDevelopmentScreen()),
];
