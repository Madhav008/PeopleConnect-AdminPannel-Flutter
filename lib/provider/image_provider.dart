import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:uuid/uuid.dart';

class ImageProvider with ChangeNotifier {
  var storageRef = FirebaseStorage.instance;
  File _file;
  String _downloadUrl;

  File get file => _file;
  String get downloadUrl => _downloadUrl;

   handleChooseFromGallery() async {
    var file = await ImagePicker().getImage(source: ImageSource.gallery);
    String postId = Uuid().v4();

    _file = File(file.path);

    var uploadTask = storageRef.ref("post_$postId.jpg").putFile(_file);
    var storageSnap = await uploadTask;
    _downloadUrl = await storageSnap.ref.getDownloadURL();

    notifyListeners();
  }
}
