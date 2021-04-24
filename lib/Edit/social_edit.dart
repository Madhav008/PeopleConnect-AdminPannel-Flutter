import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vaibhav/Model/getModel/getSocial.dart';
import 'package:vaibhav/Model/social.dart';
import 'package:vaibhav/Model/user.dart';
import 'package:vaibhav/apiServices.dart';

class EditSocial extends StatefulWidget {
  User user;
  EditSocial(this.user);

  @override
  _EditSocialState createState() => _EditSocialState();
}

class _EditSocialState extends State<EditSocial> {
  Social data = Social();
  String yt1;
  String yt2;
  String yt3;
  String yt4;
  String yt5;
  @override
  Widget build(BuildContext context) {
    data.youtubeVideo = <String>[];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Social Details"),
      ),
      body: FutureBuilder<GetSocial>(
          future: ApiService().getSocialDetail(widget.user.data.sId),
          builder: (context, snapshot) {
            var getsocial = snapshot.data.companydetails[0];
            if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 12, left: 15, right: 15),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Social Media Links",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          onChanged: (value) {
                            data.facebook = value;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "FACEBOOK",
                              hintText: getsocial.facebook,
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
                            data.instagram = value;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Instagram',
                              hintText: getsocial.instagram,
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
                            data.whatsApp = value;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Whatsapp',
                              hintText: getsocial.whatsApp,
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
                            data.twitter = value;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Twitter',
                              hintText: getsocial.twitter,
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
                            data.linkdin = value;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Linkdin',
                              hintText: getsocial.linkdin,
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
                            data.youtube = value;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Youtube',
                              hintText: getsocial.youtube,
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
                            data.interest = value;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Other Link',
                              hintText: getsocial.interest,
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
                                    onTap: () {
                                      var social = Social(
                                        facebook: (data.facebook != null)
                                            ? data.facebook
                                            : getsocial.facebook,
                                        instagram: (data.instagram != null)
                                            ? data.instagram
                                            : getsocial.instagram,
                                        interest: (data.interest != null)
                                            ? data.interest
                                            : getsocial.interest,
                                        linkdin: (data.linkdin != null)
                                            ? data.linkdin
                                            : getsocial.linkdin,
                                        twitter: (data.twitter != null)
                                            ? data.twitter
                                            : getsocial.twitter,
                                        whatsApp: (data.whatsApp != null)
                                            ? data.whatsApp
                                            : getsocial.whatsApp,
                                      );
                                      ApiService()
                                          .updateSocialDetail(
                                              widget.user.data.sId, social)
                                          .then((value) {
                                        if (value.success == true) {
                                          Fluttertoast.showToast(
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity:
                                                  ToastGravity.BOTTOM_RIGHT,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.black,
                                              textColor: Colors.white,
                                              fontSize: 16.0,
                                              msg: "Social Detail Done");
                                        }
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
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
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
