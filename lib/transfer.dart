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
          title: Text(
            "Money Transfer",
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
        ),
        backgroundColor: Color(0xFF252525),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                //Container(
                //child: Image.asset('assets/under-construction.png',
                //height: 500, width: 500),
                //),
                Container(
                    height: 199,
                    child: ListView.builder(
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
                                      Color(0xFF715FE0),
                                      Color(0xFF792D3D)
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
                                      "₱" + accounts[index].balance.toString(),
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
                      color: Colors.yellow,
                    ),
                    hint: Center(
                        child: Text(
                      'Select Bank',
                      style: TextStyle(color: Colors.white),
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
                                    color: Colors.amber,
                                    fontWeight: FontWeight.bold),
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
                    maxLength: 11,
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
