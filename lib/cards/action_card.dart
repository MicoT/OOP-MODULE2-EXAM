import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:DBP/home_screen.dart';

class ActionCard extends StatefulWidget {
  final String action;
  final String icon;
  final bool isSelected;
  HomeScreen context;

  ActionCard(
      {required this.action,
      required this.icon,
      required this.isSelected,
      required this.context,
      Key? key})
      : super(key: key);

  @override
  _ActionCardState createState() => _ActionCardState();
}

class _ActionCardState extends State<ActionCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 16),
      width: 110,
      height: 125,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Color(0xFF00142D)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Color(0xFFF25A14), spreadRadius: 0.1, offset: Offset(2, 2))
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SvgPicture.asset(
              widget.icon,
              height: 50,
              width: 50,
            ),
            SizedBox(height: 9),
            Text(widget.action,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFF3F51B5), fontWeight: FontWeight.w700))
          ],
        ),
      ),
    );
  }
}
