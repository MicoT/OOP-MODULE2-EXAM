import 'package:flutter/material.dart';
import 'package:my_app/confirm_screen.dart';
import 'package:my_app/database/accounts.dart';
import 'package:my_app/home_screen.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePageScreen> {
  List<String> _animals = ['Gcash', 'PayMaya', 'Steam', 'Paypal', 'Others'];
  final firstInt = TextEditingController();
  final secondInt = TextEditingController();

  String? _selectedColor;
  @override
  Widget build(BuildContext context) {
    Row(
      children: <Widget>[new Icon(Icons.arrow_back)],
    );

    return Scaffold(
        appBar: new AppBar(
          title: Text("Money Transfer", style: TextStyle(color: Colors.white)),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    const Color(0xFF414141),
                    const Color(0xFF212121),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
          ),
        ),
        backgroundColor: Color(0xFF252525),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
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
                                      color: Colors.white.withOpacity(0.6),
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
                                      "₱" + accounts[index].balance.toString(),
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
                Container(
                  width: 250,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(30)),
                  margin: EdgeInsets.only(top: 30, left: 50),
                  child: DropdownButton<String>(
                    onChanged: (value) {
                      setState(() {
                        _selectedColor = value;
                      });
                    },
                    value: _selectedColor,

                    // Hide the default underline
                    underline: Container(),
                    icon: Icon(
                      Icons.arrow_downward,
                      color: Colors.black,
                    ),
                    hint: Center(
                        child: Text(
                      'Mode of Payment',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w900),
                    )),

                    isExpanded: true,

                    // The list of options
                    items: _animals
                        .map((e) => DropdownMenuItem(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  e,
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              value: e,
                            ))
                        .toList(),

                    // Customize the selected item
                    selectedItemBuilder: (BuildContext context) => _animals
                        .map((e) => Center(
                              child: Text(
                                e,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900),
                              ),
                            ))
                        .toList(),
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Enter Account Number:',
                  style: TextStyle(color: Colors.deepOrangeAccent),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: TextField(
                    maxLength: 12,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 3.0),
                      ),
                      border: const OutlineInputBorder(),
                      labelStyle: new TextStyle(color: Colors.orangeAccent),
                    ),
                    controller: firstInt,
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                Text(
                  'Enter Amount:',
                  style: TextStyle(color: Colors.deepOrangeAccent),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: TextField(
                    maxLength: 11,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 3.0),
                      ),
                      border: const OutlineInputBorder(),
                      labelStyle: new TextStyle(color: Colors.orangeAccent),
                    ),
                    controller: secondInt,
                  ),
                ),
                // Container(
                //   alignment: Alignment.bottomCenter,
                //   child: new ElevatedButton(
                //     onPressed: () {
                //       Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) => Confirmation()));
                //     },
                //     child: Text(
                //       'Confirm',
                //       style: TextStyle(color: Colors.orangeAccent),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.task_alt),
          onPressed: () => showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: Color(0xFF757575),
              content: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 500),
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/payment.png',
                      height: 200,
                      width: 200,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 200),
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Payment Confirmed!' +
                          '\n' +
                          '\n' +
                          '\n' +
                          'Account Number : ' +
                          firstInt.text +
                          '\n' +
                          'Total Amount : PHP ' +
                          secondInt.text +
                          '\n' +
                          'Mode of Payment : ' +
                          _selectedColor.toString() +
                          '\n' +
                          '\n' +
                          'Reference ID: 154564D562D141651D',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
