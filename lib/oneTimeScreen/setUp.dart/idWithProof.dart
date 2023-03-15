import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:payza/customWidget/appBar.dart';
import 'package:payza/customWidget/fullRounedButton.dart';
import 'package:payza/main.dart';
import 'package:payza/oneTimeScreen/setUp.dart/ScreenShort.dart';
import 'package:screenshot/screenshot.dart';

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
  ScreenshotController screenshotController = ScreenshotController();
  late Uint8List _imageFile;

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
              Screenshot(
                controller: screenshotController,
                child: Container(
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
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 150,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 191, 206, 255),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    onPressed: () {},
                    child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          "Retake",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 6, 73, 255)),
                        ))),
              ),
              SizedBox(
                width: 150,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 10,
                        shadowColor: Color.fromARGB(255, 94, 130, 248),
                        backgroundColor: Color.fromARGB(255, 36, 83, 236),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    onPressed: () {
                      costom();
                      screenshotController.capture().then((value) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ScreenShort(image: value!)));
                      });
                    },
                    child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          "Continue",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ))),
              ),
            ],
          ),
        ));
  }

  Widget costom() {
    return Center(
      child: Text("data"),
    );
  }
}
