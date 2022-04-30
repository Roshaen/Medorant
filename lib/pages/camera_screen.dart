import 'dart:io';
import 'package:flutter/material.dart';
import '../widgets/image_input.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);
  static const routeName = '/camera-screen';

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late File _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _saveImage() {
    if (_pickedImage == null) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: ImageInput(_selectImage));
  }
}
