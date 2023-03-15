import 'dart:ffi';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:payza/oneTimeScreen/setUp.dart/profileFill.dart';

import '../../customWidget/fullRounedButton.dart';

class ScreenShort extends StatefulWidget {
  Uint8List image;
  ScreenShort({super.key, required this.image});

  @override
  State<ScreenShort> createState() => _ScreenShortState();
}

class _ScreenShortState extends State<ScreenShort> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.memory(widget.image),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
          padding: EdgeInsets.all(10),
          child: FullRounedButton(
              title: "Continue",
              onPressed: () {
                dispose();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileFill()));
              })),
    );
  }
}
