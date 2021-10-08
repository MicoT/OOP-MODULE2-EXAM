class Accounts {
  String user;
  String accNumber; //max 11 char
  double balance;
  String cardType;

  Accounts(this.user, this.accNumber, this.balance, this.cardType);
}

List<Accounts> accounts = accountsData
    .map(
      (item) => Accounts(
        item['user'] as String,
        item['accNumber'] as String,
        item['balance'] as double,
        item['cardType'] as String,
      ),
    )
    .toList();

var accountsData = [
  {
    "user": "Juan Dela Cruz",
    "accNumber": "**** **** 1234",
    "balance": 10000.00,
    "cardType": "assets/logo-visa.png"
  },
  // There should be an add card function where if the owner wants to add
  // another card into his mobile app then it is inserted here
  // {
  //   "user": "Lorem Ipsum",
  //   "accNumber": "98675346875",
  //   "balance": 200.00,
  // }
];

//Final

