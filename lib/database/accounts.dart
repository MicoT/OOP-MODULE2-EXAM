class Accounts {
  String user;
  String accNumber; //max 11 char
  double balance;

  Accounts(this.user, this.accNumber, this.balance);
}

List<Accounts> accounts = accountsData
    .map(
      (item) => Accounts(
        item['user'] as String,
        item['accNumber'] as String,
        item['balance'] as double,
      ),
    )
    .toList();

var accountsData = [
  {
    "user": "Admin",
    "accNumber": "0123456789",
    "balance": 10000.00,
  },
  //{
  //  "user": "Lorem Ipsum",
  //  "accNumber": "98675346875",
  //  "balance": 200.00,
  //}
];
