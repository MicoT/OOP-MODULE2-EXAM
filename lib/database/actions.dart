import 'package:flutter/widgets.dart';
import '../transfer.dart';
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
  Actions("About", "assets/insight_tracking_blue.svg",
      () => UnderDevelopmentScreen()),
];
//Final