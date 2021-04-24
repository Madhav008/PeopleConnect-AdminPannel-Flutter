import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vaibhav/Model/ecom.dart';
import 'package:vaibhav/Model/getModel/getProduct.dart';
import 'package:vaibhav/Model/user.dart';
import 'package:vaibhav/apiServices.dart';
import 'package:uuid/uuid.dart';

class EditProduct extends StatefulWidget {
  User user;
  EditProduct(this.user);

  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  Service data = Service();
  Service data1 = Service();
  Service data2 = Service();
  Service data3 = Service();
  Service data4 = Service();
  Service data5 = Service();
  Service data6 = Service();
  Service data7 = Service();

  String postId = Uuid().v4();

  var storageRef = FirebaseStorage.instance;

  Future<String> uploadImage(imageFile) async {
    var uploadTask = storageRef.ref("post_$postId.jpg").putFile(imageFile);
    var storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }

  File file;

  handleChooseFromGallery() async {
    var file = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      this.file = File(file.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("products"),
      ),
      body: FutureBuilder<GetProduct>(
          future: ApiService().getProductDetail(widget.user.data.sId),
          builder: (context, snapshot) {
            var getproduct = snapshot.data.companydetails;
            return ListView.builder(
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                EditSingleProduct(getproduct[index]),
                          ));
                    },
                    child: buildProduct(getproduct[index]));
              },
              itemCount: getproduct.length,
            );
          }),
    );
  }

  Padding buildProduct(getProduct) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 180,
            width: 170,
            decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                    image: NetworkImage(getProduct.image), fit: BoxFit.cover)),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              Container(
                height: 40,
                width: 180,
                child: Text(
                  getProduct.productName,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                width: 180,
                child: Text(
                  getProduct.mrp,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                width: 180,
                child: Text(
                  getProduct.sellingPrice,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                width: 180,
                child: Text(
                  (getProduct.description != null)
                      ? getProduct.description
                      : "",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class EditSingleProduct extends StatefulWidget {
  var data;
  EditSingleProduct(this.data);

  @override
  _EditSingleProductState createState() => _EditSingleProductState();
}

class _EditSingleProductState extends State<EditSingleProduct> {
  String postId = Uuid().v4();

  var storageRef = FirebaseStorage.instance;

  Future<String> uploadImage(imageFile) async {
    var uploadTask = storageRef.ref("post_$postId.jpg").putFile(imageFile);
    var storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }

  File file;

  handleChooseFromGallery() async {
    var file = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      this.file = File(file.path);
    });
  }

  Service product = Service();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Product"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    handleChooseFromGallery();
                  },
                  child: Container(
                    height: 180,
                    width: 170,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        image: DecorationImage(
                            image: (file != null)
                                ? FileImage(file)
                                : NetworkImage((widget.data.image != null)
                                    ? widget.data.image
                                    : "https://www.mybusinessdvc.com/panel/images/template1.png"),
                            fit: BoxFit.fill)),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 180,
                      child: TextField(
                        onChanged: (value) {
                          product.productName = value;
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
                          product.mrp = value;
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
                          product.sellingPrice = value;
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
                          product.description = value;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'DESCRIPTION',
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () async {
                var imgUrl = await uploadImage(file);

                var service = Service(
                  image: (imgUrl != null) ? imgUrl : widget.data.image,
                  mrp: (product.mrp != null) ? product.mrp : widget.data.mrp,
                  productName: (product.productName != null)
                      ? product.productName
                      : widget.data.productName,
                  sellingPrice: (product.sellingPrice != null)
                      ? product.sellingPrice
                      : widget.data.sellingPrice,
                );
                ApiService()
                    .updateProductDetail(widget.data.sId, service)
                    .then((value) {
                  if (value.success == true) {}
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(20)),
                height: 50,
                width: 150,
                child: Center(
                    child: Text(
                  "Done",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
