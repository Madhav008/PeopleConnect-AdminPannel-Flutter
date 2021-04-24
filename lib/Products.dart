import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vaibhav/Model/ecom.dart';
import 'package:vaibhav/Model/user.dart';
import 'package:vaibhav/apiServices.dart';
import 'package:uuid/uuid.dart';

import 'payment.dart';

// ignore: must_be_immutable
class Products extends StatefulWidget {
  User user;
  Products(this.user);
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var storageRef = FirebaseStorage.instance;
  String postId = Uuid().v4();
  File file;
  List<File> img;
  Future<String> uploadImage(imageFile) async {
    var uploadTask = storageRef.ref("post_$postId.jpg").putFile(imageFile);
    var storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }

  Future handleChooseFromGallery() async {
    var file = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      this.file = File(file.path);
    });
    return this.file;
  }

  int _count = 1;
  @override
  Widget build(BuildContext context) {
    List<Widget> _contatos =
        new List.generate(_count, (int i) => buildProductCard());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add Products"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: _contatos,
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        _count = _count + 1;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Add more Products",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700),
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildProductCard() {
    Service data = Service();
    return buildProduct(data);
  }

  Widget buildProduct(
    Service data,
  ) {
    File filepath;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                handleChooseFromGallery().then((value) {
                  setState(() {
                    filepath = value;
                  });
                  Fluttertoast.showToast(
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM_RIGHT,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                      fontSize: 16.0,
                      msg: "Photo Uploaded Succesfully");
                  uploadImage(value).then((url) {
                    data.image = url;
                  });
                });
              },
              child: Container(
                height: 180,
                width: 170,
                decoration: BoxDecoration(
                    color: Colors.green,
                    image: DecorationImage(
                        image: (filepath != null)
                            ? FileImage(filepath)
                            : NetworkImage(
                                "https://www.mybusinessdvc.com/panel/images/template1.png"),
                        fit: BoxFit.fill)),
              ),
            ),
            Column(
              children: [
                Container(
                  height: 40,
                  width: 180,
                  child: TextField(
                    onChanged: (value) {
                      data.productName = value;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name of Product',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 40,
                  width: 180,
                  child: TextField(
                    onChanged: (value) {
                      data.mrp = value;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'MRP',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 40,
                  width: 180,
                  child: TextField(
                    onChanged: (value) {
                      data.sellingPrice = value;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'SELLING PRICE',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 40,
                  width: 180,
                  child: TextField(
                    onChanged: (value) {
                      data.image = value;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'IMAGE',
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            var service = Service(
              image: data.image,
              mrp: data.mrp,
              productName: data.productName,
              sellingPrice: data.sellingPrice,
              userId: widget.user.data.sId,
            );

            ApiService().createService(service).then((value) {
              if (value.success == true) {
                Fluttertoast.showToast(
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM_RIGHT,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                    fontSize: 16.0,
                    msg: "Product Added Succesfully");
              }
            });
          },
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
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
