import 'package:flutter/material.dart';
import 'package:my_app/cards/action_card.dart';
import 'package:my_app/database/actions.dart';
import 'package:my_app/database/accounts.dart';
import 'package:my_app/under_development.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF252525),
        body: Container(
            margin: EdgeInsets.only(top: 8),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: ListView(
                physics: ClampingScrollPhysics(),
                children: [
                  // MENU BAR
                  Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.menu_rounded,
                          color: Colors.grey[400],
                          size: 40,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  // HEADER
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Welcome back,",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500)),
                        Text("Admin",
                            style: TextStyle(
                                color: Colors.blue,
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
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: <Color>[
                                        Colors.blue,
                                        Colors.orange,
                                      ]),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        spreadRadius: 3,
                                        blurRadius: 1,
                                        offset: Offset(0, 5))
                                  ]),
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 30,
                                    top: 25,
                                    child: Text("ACCOUNT NUMBER",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 10)),
                                  ),
                                  Positioned(
                                    left: 30,
                                    top: 40,
                                    child: Text(accounts[index].accNumber,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20)),
                                  ),
                                  Positioned(
                                    right: 30,
                                    bottom: 45,
                                    child: Text(
                                        "₱" +
                                            accounts[index].balance.toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 25)),
                                  ),
                                  Positioned(
                                    right: 30,
                                    bottom: 30,
                                    child: Text("AVAILABLE BALANCE",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 10)),
                                  )
                                ],
                              ),
                            );
                          })),
                  SizedBox(height: 30),
                  Text("Actions:",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: 175,
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
                  Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      UnderDevelopmentScreen()));
                        },
                        child: Text("View Transaction History",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18)))),
                      ),
                    ),
                  )
                ],
              ),
            )));
  }
}
