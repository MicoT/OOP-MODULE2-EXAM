class Actions {
  String action;
  String icon;
  String navigateTo;

  Actions(this.action, this.icon, this.navigateTo);
}

List<Actions> actions = actionsData
    .map((item) => Actions(item['action'] as String, item['icon'] as String,
        item['navigateTo'] as String))
    .toList();

var actionsData = [
  {
    "action": "Fund\nTransfer",
    "icon": "assets/col-transfer.svg",
    "navigateTo": "HomeScreen()"
  },
  {
    "action": "Cash\nWithdraw",
    "icon": "assets/col-money.svg",
    "navigateTo": "HomeScreen()"
  },
  {
    "action": "Enroll\nAccount",
    "icon": "assets/col-enroll.svg",
    "navigateTo": "HomeScreen()"
  },
  {
    "action": "Pay\nBills",
    "icon": "assets/col-bills.svg",
    "navigateTo": "HomeScreen()"
  }
];
