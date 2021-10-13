import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'DatabaseAccounts.dart';
import 'confirmation_screen.dart';

class PrivateAccount extends AdminAccounts {
  balance() {
    return super.balance();
  }
}

var f = NumberFormat('###,###');

class Variables {
  static int moneyTransfer = 0;
  static int transferAccDetails = 0;
  static String transferNotes = "";

  money() {
    return moneyTransfer;
  }

  number() {
    var value = Variables.transferAccDetails
        .toString()
        .replaceAllMapped(RegExp(r".{4}"), (match) => "${match.group(0)} ");
    return value;
  }
}

class TransferMoneyScreen extends StatefulWidget {
  const TransferMoneyScreen({Key? key}) : super(key: key);

  @override
  TransferMoney createState() {
    return TransferMoney();
  }
}

class TransferMoney extends State<TransferMoneyScreen> {
  // var amount;
  final userTransferAmount = TextEditingController();
  final transferCardDetails = TextEditingController();
  final transferNote = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final InputError = SnackBar(content: Text('Invalid credentials'));
  final String currentBalance = PrivateAccount().balance().toString();

  current() {
    int money = int.parse(currentBalance);
    return money;
  }

  List<String> _modes = [
    'Gcash',
    'PayMaya',
    'Steam',
    'Paypal',
    'DragonPay',
    'Visa',
    'Others'
  ];
  String? _selectedColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                reverse: true,
                child: Form(
                  key: _formkey,
                  child: Stack(alignment: Alignment.center, children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                            Color(0xFF252525),
                            Color(0xFF414141),
                            Color(0xFF212121)
                          ])),
                    ),
                    Positioned(
                        top: 100,
                        left: 55,
                        child: Text("PHP " + f.format(current()).toString(),
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontFamily: 'Glacial',
                              color: const Color(0xFFF25A14),
                              fontSize: 50,
                            ))),
                    //////////////////// TRANSFER AMOUNT ////////////////////
                    Positioned(
                        top: 220,
                        child: Text("How much?",
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontFamily: 'Glacial Bold',
                              color: const Color(0xFFF25A14),
                              fontSize: 25,
                            ))),
                    /////////////////////////// PHP //////////////////////////
                    Positioned(
                        top: 275,
                        left: 15,
                        child: Text("PHP",
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontFamily: 'Glacial Bold',
                              color: const Color(0xFFF25A14),
                              fontSize: 25,
                            ))),

                    /////////////////////// PHP TEXTFIELD ////////////////////
                    Positioned(
                        top: 260,
                        left: 80,
                        child: Container(
                          height: 60,
                          width: 265,
                          child: TextFormField(
                            controller: userTransferAmount,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please specify transfer amount.';
                              } else if (int.tryParse(value)! < 200) {
                                return 'Amount must be more than Php 200.';
                              } else if (int.tryParse(value)! > current()) {
                                return 'Amount must be less than Php ' +
                                    f.format(current()).toString() +
                                    '.';
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'PHP 200 MINIMUM',
                                hintStyle: TextStyle(color: Colors.red),
                                fillColor: Colors.orange[100],
                                filled: true),
                          ),
                        )),

                    /////////////////////// TRANSFER TO //////////////////////
                    Positioned(
                        top: 340,
                        child: Text("Transfer To",
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontFamily: 'Glacial Bold',
                              color: const Color(0xFFF25A14),
                              fontSize: 25,
                            ))),

                    ////////////////// TRANSFER TO TEXTFIELD //////////////////
                    Positioned(
                        top: 380,
                        child: Container(
                          height: 60,
                          width: 300,
                          child: TextFormField(
                            controller: transferCardDetails,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Must specify account number';
                              } else if (value.length < 12) {
                                return 'Invalid account number';
                              } else {
                                return null;
                              }
                            },
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              LengthLimitingTextInputFormatter(12),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'ACCOUNT NUMBER',
                                hintStyle: TextStyle(color: Colors.red),
                                fillColor: Colors.orange[100],
                                filled: true),
                          ),
                        )),
                    ////////////////////// CONFIRM BUTTON /////////////////////
                    Positioned(
                        top: 680,
                        child: SizedBox(
                            height: 50,
                            width: 250,
                            child: ElevatedButton(
                              child: Text('Confirm',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900)),
                              onPressed: () {
                                if (_formkey.currentState!.validate()) {
                                  Variables.moneyTransfer =
                                      int.parse(userTransferAmount.text);
                                  Variables.transferAccDetails =
                                      int.parse(transferCardDetails.text);
                                  Variables.transferNotes = transferNote.text;
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ConfirmScreen()));
                                } else {
                                  InputError;
                                }
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30))),
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.all(15)),
                                  elevation: MaterialStateProperty.all(0),
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color(0xFFF25A14))),
                            ))),
                    Positioned(
                      top: 480,
                      child: Container(
                        width: 250,
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 20),
                        decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(30)),
                        margin: EdgeInsets.only(bottom: 140, left: 10),
                        child: DropdownButton<String>(
                          onChanged: (value) {
                            setState(() {
                              _selectedColor = value;
                            });
                          },
                          value: _selectedColor,

                          // Hide the default underline
                          underline: Container(),
                          dropdownColor: Colors.orangeAccent,
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
                          items: _modes
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
                          selectedItemBuilder: (BuildContext context) => _modes
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
                    )
                  ]),
                ))));
  }
}
