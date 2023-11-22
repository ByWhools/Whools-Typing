import 'dart:math';

import 'package:flutter/material.dart';

class PopupIcon extends StatefulWidget {
  final IconData icon;
  final Color color;
  final String text;

  const PopupIcon({
    Key? key,
    required this.icon,
    required this.color,
    required this.text,
  }) : super(key: key);

  @override
  _PopupIconState createState() => _PopupIconState();
}

class _PopupIconState extends State<PopupIcon> {
  bool onIt = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const  EdgeInsets.all(5.0),
      height: 120.0,
      width: 90.0,
      child: Center(
        child: Stack(
          children: [
            AnimatedOpacity(
              opacity: onIt ? 1.0 : 0.0,
              curve: onIt ? Curves.easeOutBack : Curves.easeIn,
              duration: const Duration(milliseconds: 200),
              child: AnimatedAlign(
                curve: onIt ? Curves.easeOutBack : Curves.easeIn,
                alignment: onIt ? const Alignment(0.0, -1.0) : Alignment(0.0, 0.0),
                duration: const Duration(milliseconds: 200),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      left: 45.0,
                      top: 30.0,
                      child: Transform(
                        transform: Matrix4.rotationZ(pi / 4),
                        alignment: FractionalOffset.center,
                        child: Container(
                          height: 10.0,
                          width: 10.0,
                          color: widget.color,
                        ),
                      ),
                    ),
                    Container(
                      height: 35.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: widget.color,
                      ),
                      child: Center(
                        child: Text(
                          widget.text,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              child: MouseRegion(
                onEnter: (value) {
                  setState(() {
                    onIt = true;
                  });
                },
                onExit: (value) {
                  setState(() {
                    onIt = false;
                  });
                },
                child: AnimatedContainer(
                  height: 50.0,
                  width: 50.0,
                  duration: const Duration(milliseconds: 375),
                  decoration: BoxDecoration(
                    color: onIt ? widget.color : Colors.white,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Icon(
                    widget.icon,
                    color: onIt ? Colors.white : widget.color,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
