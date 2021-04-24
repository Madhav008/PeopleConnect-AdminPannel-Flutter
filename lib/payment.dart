import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vaibhav/Model/payment_model.dart';
import 'package:vaibhav/Model/user.dart';
import 'package:vaibhav/apiServices.dart';
// import 'package:vaibhav/images.dart';
import 'package:uuid/uuid.dart';
// import 'package:path_provider/path_provider.dart';

class Payment extends StatefulWidget {
  User user;
  Payment(this.user);
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String postId = Uuid().v4();

  var storageRef = FirebaseStorage.instance;

  PaymentDetail paymentDetail = PaymentDetail();

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
        title: Text("Payment"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 12, left: 15, right: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Pament Details",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    handleChooseFromGallery();
                    print(file);
                  },
                  child: Container(
                    height: 100,
                    width: 170,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        image: DecorationImage(
                            image: (file != null)
                                ? FileImage(file)
                                : NetworkImage(
                                    "https://imagehost7.online-image-editor.com/oie_upload/images/1175055ucZoQJE/I7hoTXjTrWen.jpg"),
                            fit: BoxFit.fill)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  onChanged: (value) {
                    paymentDetail.paytmNumber = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Paytm Number',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  onChanged: (value) {
                    paymentDetail.gpayNumber = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Google Pay',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  onChanged: (value) {
                    paymentDetail.phonePay = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone Pay',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Bank Account Details",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  onChanged: (value) {
                    paymentDetail.holderName = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Account Holder Name',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  onChanged: (value) {
                    paymentDetail.accountNo = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Account Number',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  onChanged: (value) {
                    paymentDetail.ifsc = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'IFSC Code',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  onChanged: (value) {
                    paymentDetail.bankName = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Bank Name',
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
                            onTap: () async {
                              try {
                                var url = await uploadImage(file);

                                var data = PaymentDetail(
                                    userId: widget.user.data.sId,
                                    accountNo: paymentDetail.accountNo,
                                    bankName: paymentDetail.bankName,
                                    gpayNumber: paymentDetail.gpayNumber,
                                    holderName: paymentDetail.holderName,
                                    ifsc: paymentDetail.ifsc,
                                    paytmNumber: paymentDetail.paytmNumber,
                                    phonePay: paymentDetail.phonePay,
                                    qrcode: url);
                                ApiService().createPayment(data).then((value) {
                                  Fluttertoast.showToast(
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM_RIGHT,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.black,
                                      textColor: Colors.white,
                                      fontSize: 16.0,
                                      msg: "Payment Detail Done");
                                });
                              } catch (e) {
                                Fluttertoast.showToast(
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM_RIGHT,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.black,
                                    textColor: Colors.white,
                                    fontSize: 16.0,
                                    msg: e.toString());
                              }
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
        ),
      ),
    );
  }
}
