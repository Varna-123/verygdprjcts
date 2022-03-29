import 'dart:io' as io;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class ImageUpload extends StatelessWidget {
  ImageUpload({Key? key}) : super(key: key);

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  final ImagePicker _imagePicker = ImagePicker();
  final Uuid uuid = Uuid(); /////create a random number conti....

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: 30,
                height: 100,
                child: OutlinedButton(
                  onPressed: uploadImage,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Upload yr img')
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> uploadImage() async {
    final selectedImg =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    final ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('product images')
        .child('${uuid.v4()}${selectedImg!.name}');
    final metaData = firebase_storage.SettableMetadata(
      contentType: selectedImg.mimeType,
      customMetadata: {'picked-file-path': selectedImg.path},
    );
    await ref.putFile(io.File(selectedImg.path), metaData);

    final imageLink = await ref.getDownloadURL();

    print('\\\\\\\\\\\\\\\\\\\\\\\\-----------------------------????');
    // print(metaData.contentType);
    print(metaData.contentType);
    print('');
    print(imageLink);
    // print(metaData.))
  }
}
