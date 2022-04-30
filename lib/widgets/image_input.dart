import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;
// import 'package:google_ml_kit/google_ml_kit.dart';

import '../pages/image_cropper.dart';

class ImageInput extends StatefulWidget {
  final Function onSelectImage;

  const ImageInput(this.onSelectImage, {Key? key}) : super(key: key);

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? storedImage;

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final imageFile = await picker.getImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    setState(() {
      storedImage = File(imageFile!.path);
    });
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile!.path);
    final savedImage = await storedImage?.copy('${appDir.path}/$fileName');
    widget.onSelectImage(savedImage);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const Cropper(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FlatButton.icon(
          icon: const Icon(Icons.camera),
          label: const Text("Take Picture"),
          textColor: Theme.of(context).primaryColor,
          onPressed: _takePicture,
        ),
      ],
    );
  }
}
