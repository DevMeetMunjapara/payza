import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:payza/customWidget/appBar.dart';
import 'package:payza/customWidget/fullRounedButton.dart';
import 'package:payza/main.dart';

class IDWithProof extends StatefulWidget {
  XFile file;
  IDWithProof({
    super.key,
    required this.file,
  });

  @override
  State<IDWithProof> createState() => _IDWithProofState();
}

class _IDWithProofState extends State<IDWithProof> {
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(
      cameras[1],
      ResolutionPreset.ultraHigh,
    );
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: Center(child: Image.file(File(widget.file.path))),
      body: Container(
        height: double.infinity,
        child: Column(
          children: [
            MyAppBar(),
            Text(
              "Selfie with ID Card",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Please face the camera holding your ID card",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
            Container(
              padding: EdgeInsets.all(40),
              child: CameraPreview(
                controller,
                child: Padding(
                  padding: EdgeInsets.only(top: 300),
                  child: Container(
                      padding: EdgeInsets.all(50),
                      width: 200,
                      child: Image.file(
                        File(widget.file.path),
                        width: 20,
                        height: 40,
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
          padding: EdgeInsets.only(left: 40, right: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(),
                    onPressed: () {},
                    child: Text("Retack")),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(),
                    onPressed: () {},
                    child: Text("Retack")),
              ),
            ],
          )),
    );
  }
}
