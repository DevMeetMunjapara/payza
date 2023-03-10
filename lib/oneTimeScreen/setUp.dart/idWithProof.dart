import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.file(File(widget.file.path))),
    );
  }
}
