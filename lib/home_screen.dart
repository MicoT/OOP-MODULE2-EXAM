import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:DBP/cards/action_card.dart';
import 'package:DBP/database/actions.dart';
import 'package:DBP/database/accounts.dart';
import 'package:DBP/under_development.dart';
import 'package:intl/intl.dart';
import 'DatabaseAccounts.dart';
import 'confirmation_screen.dart';

class PrivateAccounts extends AdminAccounts {
  balance() {
    return super.balance();
  }
}

var f = NumberFormat('###,###');

class Variable {
  static int moneyTransfer = 0;
  static int transferAccDetails = 0;
  static String transferNotes = "";

  money() {
    return moneyTransfer;
  }

  number() {
    var value = Variable.transferAccDetails
        .toString()
        .replaceAllMapped(RegExp(r".{4}"), (match) => "${match.group(0)} ");
    return value;
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final String currentBalance = PrivateAccounts().balance().toString();

  currentMoney() {
    int money = int.parse(currentBalance);
    return money;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color(0xFF252525),
              Color(0xFF414141),
              Color(0xFF212121)
            ])),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
                margin: EdgeInsets.only(top: 8),
                child: Padding(
                    padding: const EdgeInsets.all(18),
                    child:
                        ListView(physics: ClampingScrollPhysics(), children: [
                      Padding(padding: const EdgeInsets.symmetric(vertical: 5)),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Welcome back,",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900)),
                            Text("\t Admin",
                                style: TextStyle(
                                    color: Colors.blue[800],
                                    fontSize: 30,
                                    fontWeight: FontWeight.w900))
                          ]),
                      SizedBox(height: 20),
                      Container(
                          height: 199,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: accounts.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(right: 10),
                                  height: 199,
                                  width: 344,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: <Color>[
                                            Color(0xFF00142D),
                                            Color(0xFF003478),
                                            Color(0xFFF25A14),
                                          ]),
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Colors.white.withOpacity(0.6),
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            offset: Offset(3, 2))
                                      ]),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 28,
                                        top: 35,
                                        child: Text("ACCOUNT NUMBER",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w300)),
                                      ),
                                      Positioned(
                                        left: 30,
                                        bottom: 21,
                                        child: Text(accounts[index].user,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16)),
                                      ),
                                      Positioned(
                                        left: 30,
                                        bottom: 45,
                                        child: Text("CARD HOLDERNAME",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400)),
                                      ),
                                      Positioned(
                                        left: 32,
                                        top: 60,
                                        child: Text(accounts[index].accNumber,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20)),
                                      ),
                                      Positioned(
                                        right: 18,
                                        child: Image.asset(
                                          accounts[index].cardType,
                                          width: 80,
                                          height: 80,
                                        ),
                                      ),
                                      Positioned(
                                        right: 28,
                                        bottom: 18,
                                        child: Text(
                                            "???" +
                                                f
                                                    .format(currentMoney())
                                                    .toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 25)),
                                      ),
                                      Positioned(
                                        right: 36,
                                        bottom: 48,
                                        child: Text("WALLET BALANCE",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w300)),
                                      )
                                    ],
                                  ),
                                );
                              })),
                      SizedBox(height: 25),
                      Text("Actions:",
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.w900)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              height: 165,
                              width: 300,
                              child: ListView.builder(
                                itemCount: actions.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  var current;
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  actions[index].navigateTo()));
                                    },
                                    child: ActionCard(
                                        action: actions[index].action,
                                        icon: actions[index].icon,
                                        isSelected: current == index,
                                        context: this),
                                  );
                                },
                              )),
                        ],
                      ),
                    ])))));
  }
}
