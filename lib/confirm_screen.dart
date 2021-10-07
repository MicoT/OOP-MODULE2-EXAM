import 'package:flutter/material.dart';
import 'package:my_app/transfer.dart' as global;

class Confirmation extends StatelessWidget {
  Confirmation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0,
      ),
      backgroundColor: Color(0xFF252525),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                child: Text("Payment Confirmation",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    textAlign: TextAlign.center),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Text("Account number:"),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
