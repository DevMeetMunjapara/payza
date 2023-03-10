import 'dart:io';

import 'package:camera/camera.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:payza/main.dart';
import 'package:payza/oneTimeScreen/setUp.dart/idWithProof.dart';

// Future<void> main() async {

//   runApp(const CameraApp());
// }

/// CameraApp is the Main Application.
class CameraApp extends StatefulWidget {
  /// Default Constructor
  const CameraApp({Key? key}) : super(key: key);

  @override
  State<CameraApp> createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.max);
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

  XFile? image;
  XFile? toDispalyImage;

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemporary = XFile(image.path);
    this.image = imageTemporary;
    print("--------------$image");
    print("--------------$imageTemporary");

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => IDWithProof(
                  file: imageTemporary,
                )));
  }

  Future pickFile() async {
    final result = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ["jpg", "png", "jpeg"]);
    if (result == null) return;
    final file = File(result.files.single.path!);
    toDispalyImage = XFile(file.path);

    print("-----------$toDispalyImage");

    // ignore: use_build_context_synchronously
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => IDWithProof(
                  file: XFile(file.path),
                )));
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            padding: EdgeInsets.all(0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "Photo ID Card",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Please point the camera at the ID card",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 60,
                ),
                CustomPaint(
                  foregroundPainter: BorderPainter(),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(55)),
                    width: double.infinity,
                    height: 350,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(55),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: CameraPreview(controller),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 241, 241, 241),
                    borderRadius: BorderRadius.circular(40)),
                child: IconButton(
                    onPressed: () {
                      pickImage();
                    },
                    icon: const Icon(
                      Icons.image,
                      color: Colors.blue,
                    )),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(50)),
                padding: EdgeInsets.all(15),
                child: IconButton(
                  onPressed: () async {
                    XFile teckImage = await controller.takePicture();
                    print("-----------$teckImage");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => IDWithProof(
                                  file: teckImage,
                                )));
                  },
                  iconSize: 45,
                  icon: const Icon(
                    Icons.camera,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                padding: EdgeInsets.all(10),
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 241, 241, 241),
                    borderRadius: BorderRadius.circular(40)),
                child: IconButton(
                    onPressed: () {
                      pickFile();
                    },
                    icon: const Icon(
                      Icons.attach_file,
                      color: Colors.blue,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double sh = size.height; // for convenient shortage
    double sw = size.width; // for convenient shortage
    double cornerSide = sh * 0.2; // desirable value for corners side

    Paint paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Path path = Path()
      ..moveTo(cornerSide, 0)
      ..quadraticBezierTo(0, 0, 0, cornerSide)
      ..moveTo(0, sh - cornerSide)
      ..quadraticBezierTo(0, sh, cornerSide, sh)
      ..moveTo(sw - cornerSide, sh)
      ..quadraticBezierTo(sw, sh, sw, sh - cornerSide)
      ..moveTo(sw, cornerSide)
      ..quadraticBezierTo(sw, 0, sw - cornerSide, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(BorderPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(BorderPainter oldDelegate) => false;
}
