import 'dart:html';

import 'package:flutter/material.dart';

abstract class ConfirmScreen extends StatefulWidget {
  ConfirmScreen({required Key key}) : super(key: key);

  @override
  _ConfirmScreenState() => _ConfirmScreenState();
}

class _ComfirmScreenState {
  get kSubTextStyle => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(),
            child: Text(
              'Your payment was successful',
              textAlign: TextAlign.center,
              style: kSubTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
