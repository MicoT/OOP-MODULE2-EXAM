import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'database/DatabaseAccount.dart';
import 'home_screen.dart';

class Variables {
  static int moneyTransfer = 0;
  static int transferAccDetails = 0;

  money() {
    return moneyTransfer;
  }
}

class PrivateAccount extends AdminAccount {
  balance() {
    return super.balance();
  }
}

var f = NumberFormat('###,###');

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
  final _formkey = GlobalKey<FormState>();
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
                      color: const Color(0xFF252525),
                    ),
                    Positioned(
                        top: 100,
                        child: Text("TRANSFER MONEY",
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                color: const Color(0xFFF25A14),
                                fontSize: 40,
                                fontWeight: FontWeight.w900))),
                    Positioned(
                        top: 160,
                        child: Text("REMAINING BALANCE",
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                color: const Color(0xFFF25A14),
                                fontSize: 25,
                                fontWeight: FontWeight.w900))),
                    Positioned(
                        top: 200,
                        left: 58,
                        child: Text(
                            "PHP " + PrivateAccount().balance().toString(),
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontFamily: 'Lato',
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.w900))),
                    Positioned(
                        top: 390,
                        child: Text("Transfer Amount",
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              color: const Color(0xFFF25A14),
                              fontSize: 25,
                            ))),
                    Positioned(
                        top: 430,
                        left: 45,
                        child: Container(
                          height: 60,
                          width: 300,
                          child: TextFormField(
                            controller: userTransferAmount,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Specify amount';
                              } else if (int.tryParse(value)! < 100) {
                                return 'Amount must not be less than Php 100.00';
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
                                hintText: 'Minimum amount must be Php 100.00',
                                hintStyle: TextStyle(color: Colors.grey),
                                fillColor: Colors.white,
                                filled: true),
                          ),
                        )),
                    Positioned(
                        top: 500,
                        child: Text("Transfer To",
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              color: const Color(0xFFF25A14),
                              fontSize: 25,
                            ))),
                    Positioned(
                        top: 540,
                        child: Container(
                          height: 60,
                          width: 300,
                          child: TextFormField(
                            controller: transferCardDetails,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Must specify account number';
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
                                hintText: 'Enter the Account Number',
                                hintStyle: TextStyle(color: Colors.grey),
                                fillColor: Colors.white,
                                filled: true),
                          ),
                        )),
                    Positioned(
                        top: 630,
                        child: SizedBox(
                            height: 50,
                            width: 250,
                            child: ElevatedButton(
                              child: Text('Confirm'),
                              onPressed: () {
                                if (_formkey.currentState!.validate()) {
                                  Variables.moneyTransfer =
                                      int.parse(userTransferAmount.text);
                                  Variables.transferAccDetails =
                                      int.parse(transferCardDetails.text);
                                }
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen()));
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
                                      const Color(0xFF2196F3))),
                            ))),
                    Container(
                      width: 250,
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 20),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
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

                        // Customize the selected item
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
                  ]),
                ))));
  }
}
