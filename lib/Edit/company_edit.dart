import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vaibhav/Model/company.dart';
import 'package:vaibhav/Model/getModel/getCompany.dart';
import 'package:vaibhav/Model/user.dart';
import 'package:vaibhav/apiServices.dart';
import 'package:uuid/uuid.dart';

class EditCompany extends StatefulWidget {
  User user;
  EditCompany(this.user);

  @override
  _EditCompanyState createState() => _EditCompanyState();
}

class _EditCompanyState extends State<EditCompany> {
  String cpyName;

  String cpyUrl;

  String fName;

  String lName;

  String postion;

  int pNum;

  String wNum;

  String address;

  String email;

  String website;

  String cpyEst;

  String abtUs;

  String lct;

  String nature;

  String logo;

  Company cpy = Company();

  String point1;

  String point2;

  String point3;

  String point4;

  String point5;

  String point6;

  String point7;

  String point8;

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
    cpy.specialities = <String>[];
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Details"),
      ),
      body: FutureBuilder<GetCompany>(
          future: ApiService().getCompanyDetail(widget.user.data.sId),
          builder: (context, snapshot) {
            if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              Companydetails company = snapshot.data.companydetails[0];
              return Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 12, left: 15, right: 15),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Company Details",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            handleChooseFromGallery();
                          },
                          child: Container(
                            height: 100,
                            width: 170,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                image: DecorationImage(
                                    image: (file != null)
                                        ? FileImage(file)
                                        : NetworkImage(company.logo),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          onChanged: (value) {
                            cpyName = value;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              // contentPadding: EdgeInsets.only(bottom: 3),
                              labelText: "Company Name",
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              hintText: company.companyName,
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
                            fName = value;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'First Name',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              hintText: company.firstName,
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
                            lName = value;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText: 'Last Name',
                              hintText: company.lastName,
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
                            postion = value;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Position/Designation',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              hintText: company.position,
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
                            pNum = int.parse(value);
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Phone Number',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              hintText: company.phone.toString(),
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
                            wNum = value;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'WhatsApp Number',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              hintText: company.whatsApp.toString(),
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
                            address = value;
                          },
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              border: OutlineInputBorder(),
                              labelText: 'Address',
                              hintText: company.address,
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
                            email = value;
                          },
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              border: OutlineInputBorder(),
                              labelText: 'Email Id',
                              hintText: company.email,
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
                            website = value;
                          },
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              border: OutlineInputBorder(),
                              labelText: 'Website',
                              hintText: company.website,
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
                            nature = value;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText: 'Nature',
                              hintText: company.nature,
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
                            lct = value;
                          },
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              border: OutlineInputBorder(),
                              labelText: 'Location',
                              hintText: company.location,
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
                            cpyEst = value;
                          },
                          maxLines: 2,
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              border: OutlineInputBorder(),
                              labelText: 'Company Estblished',
                              hintText: company.establish,
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
                            cpyUrl = value.replaceAll(new RegExp(r"\s+"), "");
                          },
                          maxLines: 2,
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              border: OutlineInputBorder(),
                              labelText: 'Company Signature',
                              hintText: company.companyUrl,
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
                            abtUs = value;
                          },
                          maxLines: 5,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'About Us',
                              hintText: company.about,
                              floatingLabelBehavior:     FloatingLabelBehavior.always,
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
                          child: InkWell(
                            onTap: () {
                              if (file != null) {
                                uploadImage(file).then((url) {
                                  logo = url;
                                });
                              }
                              var data = Company(
                                  firstName: (fName != null)
                                      ? fName
                                      : company.firstName,
                                  lastName: (lName != null)
                                      ? lName
                                      : company.lastName,
                                  about:
                                      (abtUs != null) ? abtUs : company.about,
                                  address: (address != null)
                                      ? address
                                      : company.address,
                                  companyName: (cpyName != null)
                                      ? cpyName
                                      : company.companyName,
                                  companyUrl: (cpyUrl != null)
                                      ? cpyUrl
                                      : company.companyUrl,
                                  email:
                                      (email != null) ? email : company.email,
                                  establish: (cpyEst != null)
                                      ? cpyEst
                                      : company.establish,
                                  location:
                                      (lct != null) ? lct : company.location,
                                  phone: (pNum != null) ? pNum : company.phone,
                                  position: (postion != null)
                                      ? postion
                                      : company.position,
                                  website: (website != null)
                                      ? website
                                      : company.website,
                                  whatsApp: (wNum != null)
                                      ? int.parse(wNum)
                                      : company.whatsApp,
                                  nature: (nature != null)
                                      ? nature
                                      : company.nature,
                                  logo: (logo != null) ? logo : company.logo);
                              ApiService()
                                  .updateCompanyDetail(
                                      widget.user.data.sId, data)
                                  .then((value) {
                                Fluttertoast.showToast(
                                    msg: "Changes Added",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM_RIGHT,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.black,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
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
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )),
                            ),
                          ),
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

//Data USerID {

// [ Obj1,obj2]
// }
