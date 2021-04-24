import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vaibhav/Model/user.dart';
import 'package:vaibhav/apiServices.dart';
// import 'package:vaibhav/finish_screen.dart';
import 'package:uuid/uuid.dart';

class SelectImages extends StatefulWidget {
  User user;
  SelectImages(this.user);

  @override
  _SelectImagesState createState() => _SelectImagesState();
}

class _SelectImagesState extends State<SelectImages> {
  String postId = Uuid().v4();

  var storageRef = FirebaseStorage.instance;

  Future<String> uploadImage(imageFile) async {
    var uploadTask = storageRef.ref("post_$postId.jpg").putFile(imageFile);
    var storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }

  File file;
  File imgUrl1;
  File imgUrl2;
  File imgUrl3;
  File imgUrl4;
  File imgUrl5;
  File imgUrl6;
  File imgUrl7;
  File imgUrl8;
  File imgUrl9;
  File imgUrl10;

  Future handleChooseFromGallery() async {
    var file = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      this.file = File(file.path);
    });
    return this.file;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Images"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 12, left: 15, right: 15),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.count(
                // physics: NeverScrollableScrollPhysics(),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75,
                crossAxisCount: 2,
                children: [
                  GestureDetector(
                      onTap: () {
                        handleChooseFromGallery().then((value) {
                          setState(() {
                            imgUrl1 = value;
                          });
                          uploadImage(value).then((url) {
                            ApiService()
                                .uploadImages(url, widget.user.data.sId);
                          });
                        });
                      },
                      child: buildImages(imgUrl1)),
                  GestureDetector(
                      onTap: () {
                        handleChooseFromGallery().then((value) {
                          setState(() {
                            imgUrl2 = value;
                          });
                          uploadImage(value).then((url) {
                            ApiService()
                                .uploadImages(url, widget.user.data.sId)
                                .then((value) => print("done"));
                          });
                        });
                      },
                      child: buildImages(imgUrl2)),
                  GestureDetector(
                      onTap: () {
                        handleChooseFromGallery().then((value) {
                          setState(() {
                            imgUrl3 = value;
                          });
                          uploadImage(value).then((url) {
                            ApiService()
                                .uploadImages(url, widget.user.data.sId);
                          });
                        });
                      },
                      child: buildImages(imgUrl3)),
                  GestureDetector(
                      onTap: () {
                        handleChooseFromGallery().then((value) {
                          setState(() {
                            imgUrl4 = value;
                          });
                          uploadImage(value).then((url) {
                            ApiService()
                                .uploadImages(url, widget.user.data.sId);
                          });
                        });
                      },
                      child: buildImages(imgUrl4)),
                  GestureDetector(
                      onTap: () {
                        handleChooseFromGallery().then((value) {
                          setState(() {
                            imgUrl5 = value;
                          });
                          uploadImage(value).then((url) {
                            ApiService()
                                .uploadImages(url, widget.user.data.sId);
                          });
                        });
                      },
                      child: buildImages(imgUrl5)),
                  GestureDetector(
                      onTap: () {
                        handleChooseFromGallery().then((value) {
                          setState(() {
                            imgUrl6 = value;
                          });
                          uploadImage(value).then((url) {
                            ApiService()
                                .uploadImages(url, widget.user.data.sId);
                          });
                        });
                      },
                      child: buildImages(imgUrl6)),
                  GestureDetector(
                      onTap: () {
                        handleChooseFromGallery().then((value) {
                          setState(() {
                            imgUrl7 = value;
                          });
                          uploadImage(value).then((url) {
                            ApiService()
                                .uploadImages(url, widget.user.data.sId);
                          });
                        });
                      },
                      child: buildImages(imgUrl7)),
                  GestureDetector(
                      onTap: () {
                        handleChooseFromGallery().then((value) {
                          setState(() {
                            imgUrl8 = value;
                          });
                          uploadImage(value).then((url) {
                            ApiService()
                                .uploadImages(url, widget.user.data.sId);
                          });
                        });
                      },
                      child: buildImages(imgUrl8)),
                  GestureDetector(
                      onTap: () {
                        handleChooseFromGallery().then((value) {
                          setState(() {
                            imgUrl9 = value;
                          });
                          uploadImage(value).then((url) {
                            ApiService()
                                .uploadImages(url, widget.user.data.sId);
                          });
                        });
                      },
                      child: buildImages(imgUrl9)),
                  GestureDetector(
                      onTap: () {
                        handleChooseFromGallery().then((value) {
                          setState(() {
                            imgUrl1 = value;
                          });
                          uploadImage(value).then((url) {
                            ApiService()
                                .uploadImages(url, widget.user.data.sId);
                          });
                        });
                      },
                      child: buildImages(imgUrl10)),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(20)),
                          height: 50,
                          width: 150,
                          child: Center(
                              child: Text(
                            "Done",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                    ),
                  ]),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Column buildImages(File url) {
    print(url);
    return Column(
      children: [
        Container(
          height: 150,
          width: 170,
          decoration: BoxDecoration(
              color: Colors.green,
              image: DecorationImage(
                  image: (url != null)
                      ? FileImage(url)
                      : NetworkImage(
                          "https://www.mybusinessdvc.com/panel/images/template1.png"),
                  fit: BoxFit.fill)),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
