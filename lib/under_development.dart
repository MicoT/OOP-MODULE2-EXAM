import 'package:flutter/material.dart';

class UnderDevelopmentScreen extends StatelessWidget {
  const UnderDevelopmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Row(
      children: <Widget>[new Icon(Icons.arrow_back)],
    );

    return Scaffold(
      appBar: new AppBar(
        elevation: 0,
      ),
      backgroundColor: Color(0xFF252525),
      body: Center(
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
                alignment: Alignment.bottomCenter,
                child: Text("Hmm. This doesn't looks right",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    textAlign: TextAlign.center),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'We are very sorry for the inconvenience' +
                      '\n This page is still under development' +
                      '\nWe hope to serve you soon!',
                  style: TextStyle(fontSize: 13, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
