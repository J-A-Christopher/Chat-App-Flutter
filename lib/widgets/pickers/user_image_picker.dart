import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  final void Function(File? pickedImage) imagePickFn;
  const UserImagePicker(this.imagePickFn, {super.key});

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _pickedImage;

  void _pickImage() async {
    final pickedImageFile =
        await ImagePicker.platform.pickImage(source: ImageSource.camera);
    if (pickedImageFile == null) {
      // User canceled the image picking process
      return;
    }
    setState(() {
      _pickedImage = File(pickedImageFile.path);
    });
    widget.imagePickFn(_pickedImage);
  }

//   void _pickImage() async {
//   final pickedImageFile = await ImagePicker.platform.pickImage(source: ImageSource.camera);
//   if (pickedImageFile == null) {
//     // User canceled the image picking process
//     return;
//   }
//   setState(() {
//     _pickedImage = File(pickedImageFile.path);
//   });
//   widget.imagePickFn(pickedImageFile);
// }

  // void _pickImage() async {
  //   final pickedImageFile =
  //       await ImagePicker.platform.pickImage(source: ImageSource.camera);
  //   setState(() {
  //     _pickedImage =
  //         pickedImageFile != null ? File(pickedImageFile.path) : null;
  //   });
  //   widget.imagePickFn(File(pickedImageFile));
  // }

  @override
  Widget build(BuildContext context) {
    print('helio$_pickedImage');
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          backgroundImage:
              _pickedImage != null ? FileImage(_pickedImage!) : null,
        ),
        TextButton.icon(
          onPressed: _pickImage,
          icon: const Icon(Icons.image),
          label: const Text('Add Image'),
        ),
      ],
    );
  }
}
