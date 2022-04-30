import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class Cropper extends StatefulWidget {
  const Cropper({Key? key}) : super(key: key);

  @override
  State<Cropper> createState() => _CropperState();
}

class _CropperState extends State<Cropper> {
  File? _pickedFile;
  File? _croppedFile;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: body(),
      ),
    );
  }

  Widget body() {
    if (_croppedFile != null || _pickedFile != null) {
      return _imageCard();
    } else {
      return _uploaderCard();
    }
  }

  Widget _imageCard() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            elevation: 4.0,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: _image(),
            ),
          ),
          const SizedBox(height: 24.0),
          _menu(),
        ],
      ),
    );
  }

  Widget _image() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    if (_croppedFile != null) {
      return ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 0.8 * screenWidth,
            maxHeight: 0.7 * screenHeight,
          ),
          child: Image.file(_croppedFile!));
    } else if (_pickedFile != null) {
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 0.8 * screenWidth,
          maxHeight: 0.7 * screenHeight,
        ),
        child: Image.file(_pickedFile!),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _menu() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          onPressed: () {
            _clearImage();
          },
          backgroundColor: Colors.redAccent,
          tooltip: 'Delete',
          child: const Icon(Icons.delete),
        ),
        if (_croppedFile == null)
          Padding(
            padding: const EdgeInsets.only(left: 32.0),
            child: FloatingActionButton(
              onPressed: () {
                _cropImage();
              },
              backgroundColor: const Color(0xFFBC764A),
              tooltip: 'Crop',
              child: const Icon(Icons.crop),
            ),
          ),
      ],
    );
  }

  Widget _uploaderCard() {
    return Center(
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SizedBox(
            height: 270.0,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DottedBorder(
                  radius: const Radius.circular(12.0),
                  borderType: BorderType.RRect,
                  dashPattern: const [8, 4],
                  color: Theme.of(context).highlightColor.withOpacity(0.4),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image,
                          color: Theme.of(context).highlightColor,
                          size: 64.0,
                        ),
                        const SizedBox(height: 24.0),
                        Text(
                          'Select an image from Gallery to start',
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    color: Theme.of(context).highlightColor,
                                  ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () {
                    _pickImage();
                  },
                  child: const Text('Select'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<Null> _pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    _pickedFile = pickedImage != null ? File(pickedImage.path) : null;
    setState(() {});
  }

  Future<Null> _cropImage() async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: _pickedFile!.path,
      aspectRatioPresets: Platform.isAndroid
          ? [
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9
            ]
          : [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio5x3,
              CropAspectRatioPreset.ratio5x4,
              CropAspectRatioPreset.ratio7x5,
              CropAspectRatioPreset.ratio16x9
            ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      _croppedFile = File(croppedFile.path);
      setState(() {});
    }
  }

  void _clearImage() {
    setState(() {
      _pickedFile = null;
      _croppedFile = null;
    });
  }
}
