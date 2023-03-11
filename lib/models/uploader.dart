import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageUploader extends StatefulWidget {
  const ImageUploader({Key? key}) : super(key: key);

  @override
  createState() => _ImageUploaderState();
}

class _ImageUploaderState extends State<ImageUploader> {
  late final ImagePicker _picker;

  XFile? _imageFile;

  @override
  void initState() {
    super.initState();
    _picker = ImagePicker();
  }

  Future<void> _getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = pickedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: _getImage,
          child: const Text('Selecionar imagem'),
        ),
        if (_imageFile != null)
          Image.file(
            File(_imageFile!.path),
            width: 200,
            height: 200,
          ),
      ],
    );
  }
}
