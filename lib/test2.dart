import 'package:flutter/material.dart';
import 'package:my_app/confirmation.dart';
import 'package:my_app/database/accounts.dart';

class Test2 extends StatelessWidget {
  Test2({Key? key}) : super(key: key);
  String dropdownStr = "Currency";
  var _mode = ['Gcash', 'PayMaya', 'Steam', 'Paypal', 'Others'];
  final myController = TextEditingController();

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
              SizedBox(height: 30),
              Text(
                'Enter your name:',
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
                  controller: myController,
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.only(top: 50, right: 50),
                child: DropdownButton<String>(
                  items: null,
                  value: dropdownStr,
                  onChanged: null,
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.only(left: 80.0),
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
                  controller: myController,
                ),
              ),
              Text(
                'Enter Amount:',
                style: TextStyle(color: Colors.deepOrangeAccent),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.only(left: 80.0),
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
                  controller: myController,
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: new ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Test2()));
                  },
                  child: Text(
                    'Confirm',
                    style: TextStyle(color: Colors.orangeAccent),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
