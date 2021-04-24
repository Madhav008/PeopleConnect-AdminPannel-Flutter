import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vaibhav/Model/getModel/getPayment.dart';
import 'package:vaibhav/Model/payment_model.dart';
import 'package:vaibhav/Model/user.dart';
import 'package:vaibhav/apiServices.dart';
import 'package:uuid/uuid.dart';

class EditPayment extends StatefulWidget {
  User user;

  EditPayment(this.user);

  @override
  _EditPaymentState createState() => _EditPaymentState();
}

class _EditPaymentState extends State<EditPayment> {
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
      body: FutureBuilder<GetPayment>(
          future: ApiService().getPaymentDetail(widget.user.data.sId),
          builder: (context, snapshot) {
            var payment = snapshot.data.companydetails[0];
            if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 12, left: 15, right: 15),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Pament Details",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
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
                                        : NetworkImage(payment.qrcode),
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
                              hintText: payment.paytmNumber,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
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
                              hintText: payment.gpayNumber,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
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
                              hintText: payment.phonePay,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Bank Account Details",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
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
                              hintText: payment.holderName,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
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
                              hintText: payment.accountNo,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
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
                              hintText: payment.ifsc,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
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
                              hintText: payment.bankName,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
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
                                      var url;
                                      if (file != null) {
                                        url = await uploadImage(file);
                                      }

                                      var data = PaymentDetail(
                                          accountNo:
                                              (paymentDetail.accountNo != null)
                                                  ? paymentDetail.accountNo
                                                  : payment.accountNo,
                                          bankName:
                                              (paymentDetail.bankName != null)
                                                  ? paymentDetail.bankName
                                                  : payment.bankName,
                                          gpayNumber:
                                              (paymentDetail.gpayNumber != null)
                                                  ? paymentDetail.gpayNumber
                                                  : payment.gpayNumber,
                                          holderName:
                                              (paymentDetail.holderName != null)
                                                  ? paymentDetail.holderName
                                                  : payment.holderName,
                                          ifsc: (paymentDetail.ifsc != null)
                                              ? paymentDetail.ifsc
                                              : payment.ifsc,
                                          paytmNumber:
                                              (paymentDetail.paytmNumber !=
                                                      null)
                                                  ? paymentDetail.paytmNumber
                                                  : payment.paytmNumber,
                                          phonePay:
                                              (paymentDetail.phonePay != null)
                                                  ? paymentDetail.phonePay
                                                  : payment.phonePay,
                                          qrcode: (url != null)
                                              ? url
                                              : payment.qrcode);
                                      ApiService()
                                          .updatePaymentDetail(
                                              widget.user.data.sId, data)
                                          .then((value) {
                                        Fluttertoast.showToast(
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM_RIGHT,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.black,
                                            textColor: Colors.white,
                                            fontSize: 16.0,
                                            msg: "Payment Detail Done");
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.red.withOpacity(0.9),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      height: 50,
                                      width: 150,
                                      child: Center(
                                          child: Text(
                                        "Done",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
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
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
