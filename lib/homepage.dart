import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? imagefile;
  // ignore: prefer_typing_uninitialized_variables
  var image;
  final ImagePicker _picker = ImagePicker();

  Future _getCamera() async {
    image = await _picker.pickImage(
      source: ImageSource.camera,
    );
    if (image != null) {
      setState(() {
        imagefile = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Camera App'),
      ),
      body: Center(
          child: imagefile != null
              ? Image.file(imagefile!)
              : const Text("No Image")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _getCamera();
        },
        child: const Icon(Icons.camera_alt_sharp),
      ),
    );
  }
}
