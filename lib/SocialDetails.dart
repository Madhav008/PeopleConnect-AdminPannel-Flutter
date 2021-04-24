import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vaibhav/Model/social.dart';
import 'package:vaibhav/Model/user.dart';
import 'package:vaibhav/apiServices.dart';
// import 'package:vaibhav/Products.dart';

// ignore: must_be_immutable
class SocialDetails extends StatefulWidget {
  User user;
  SocialDetails(this.user);
  @override
  _SocialDetailsState createState() => _SocialDetailsState();
}

int _count = 1;

class _SocialDetailsState extends State<SocialDetails> {
  Social data = Social();

  @override
  Widget build(BuildContext context) {
    List<Widget> _contatos =
        new List.generate(_count, (int i) => _buildTextField());

    data.youtubeVideo = <String>[];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Social Details"),
      ),
      body: Center(
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
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                    labelText: 'Facebook',
                  ),
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
                  ),
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
                  ),
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
                  ),
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
                  ),
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
                  ),
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
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Youtube Media Links",
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
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              var social = Social(
                                  facebook: data.facebook,
                                  instagram: data.instagram,
                                  interest: data.interest,
                                  linkdin: data.linkdin,
                                  twitter: data.twitter,
                                  userId: widget.user.data.sId,
                                  whatsApp: data.whatsApp,
                                  youtube: data.youtube,
                                  youtubeVideo: data.youtubeVideo);
                              ApiService().createSocial(social).then((value) {
                                if (value.success == true) {
                                  Fluttertoast.showToast(
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM_RIGHT,
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

  Widget _buildTextField() {
    String pointController;
    return Column(
      children: [
        TextField(
          onChanged: (value) {
            pointController = value;
          },
          onEditingComplete: () {
            if (data.youtubeVideo.length > 0) {
              if (pointController != null &&
                  pointController != data.youtubeVideo.first) {
                data.youtubeVideo.insert(0, pointController);
              }
            } else {
              if (pointController != null) {
                data.youtubeVideo.insert(0, pointController);
              }
            }
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Link ',
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
