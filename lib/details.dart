import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vaibhav/Model/company.dart';
import 'package:vaibhav/Model/user.dart';
import 'package:vaibhav/apiServices.dart';
// import 'package:vaibhav/SocialDetails.dart';
import 'package:uuid/uuid.dart';

// ignore: must_be_immutable
class Detail extends StatefulWidget {
  User user;

  Detail(this.user);
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
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

  int _count = 1;
  @override
  Widget build(BuildContext context) {
    List<Widget> _contatos =
        new List.generate(_count, (int i) => buildTextField());

    cpy.specialities = <String>[];
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Details"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 12, left: 15, right: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Company Details",
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
                    cpyName = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Company Name',
                  ),
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
                  ),
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
                    labelText: 'Last Name',
                  ),
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
                  ),
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
                  ),
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
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  onChanged: (value) {
                    address = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Address',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email Id',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  onChanged: (value) {
                    website = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Website',
                  ),
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
                    labelText: 'Nature',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  onChanged: (value) {
                    lct = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Location',
                  ),
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
                    border: OutlineInputBorder(),
                    labelText: 'Company Estblished',
                  ),
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
                    border: OutlineInputBorder(),
                    labelText: 'Company Signature',
                  ),
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
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Specialities",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: _contatos,
                ),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        _count = _count + 1;
                      });
                    },
                    child: Text("Add more Points")),
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

                                logo = url;
                                var data = Company(
                                    firstName: fName,
                                    lastName: lName,
                                    about: abtUs,
                                    address: address,
                                    companyName: cpyName,
                                    companyUrl: cpyUrl,
                                    email: email,
                                    establish: cpyEst,
                                    location: lct,
                                    phone: pNum,
                                    position: postion,
                                    website: website,
                                    whatsApp: int.parse(wNum),
                                    userId: widget.user.data.sId,
                                    nature: nature,
                                    specialities: cpy.specialities,
                                    logo: logo);

                                ApiService().createCompany(data).then((value) {
                                  if (value.success == true) {
                                    Fluttertoast.showToast(
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM_RIGHT,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.black,
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                        msg: "Company Detail Done");
                                  }
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

                              print(cpy.specialities);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.red.withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(20)),
                              height: 50,
                              width: 150,
                              child: Center(
                                  child: Text(
                                "Submit",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
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
      ),
    );
  }

  Widget buildTextField() {
    String pointController;
    return Column(
      children: [
        TextField(
          onChanged: (value) {
            pointController = value;
          },
          onEditingComplete: () {
            if (cpy.specialities.length > 0) {
              if (pointController != null &&
                  pointController != cpy.specialities.first) {
                cpy.specialities.insert(0, pointController);
              }
            } else {
              if (pointController != null) {
                cpy.specialities.insert(0, pointController);
              }
            }
          },
          maxLines: 1,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Point',
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
