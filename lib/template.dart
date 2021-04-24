import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vaibhav/Model/getTemplate.dart';
import 'package:vaibhav/Model/selectTemplate.dart';
import 'package:vaibhav/Model/user.dart';
import 'package:vaibhav/apiServices.dart';

// ignore: must_be_immutable
class Templates extends StatefulWidget {
  User data;
  Templates(this.data);
  @override
  _TemplatesState createState() => _TemplatesState();
}

class _TemplatesState extends State<Templates> {
  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    ApiService apiService = ApiService();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("${widget.data.data.name}"),
      ),
      body: FutureBuilder<GetTemplate>(
          future: apiService.getTemplate(),
          builder: (context, snapshot) {
            if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              var template = snapshot.data.data;
              return GridView.builder(
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        (orientation == Orientation.portrait) ? 2 : 3),
                itemCount: template.length,
                itemBuilder: (context, index) {
                  // return selecteTemplate(context, template[index]);
                  return GestureDetector(
                    onTap: () {
                      var data = SelectedTemplate(
                        templateId: template[index].sId,
                        userId: widget.data.data.sId,
                      );
                      ApiService().selectTemplate(data).then(
                        (value) {
                          if (value.success == true) {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => Detail(widget.data)));
                            Fluttertoast.showToast(
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM_RIGHT,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.black,
                                textColor: Colors.white,
                                fontSize: 16.0,
                                msg: "SELECTED ${template[index].name}");
                          }
                        },
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
                        Expanded(
                          child: GridTile(
                            child: Container(
                              height: 140,
                              child: Image.network(
                                template[index].image,
                                fit: BoxFit.cover,
                              ),
                            ), //just for testing, will fill with image later
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 30,
                            width: 70,
                            decoration: BoxDecoration(
                                color: Colors.pinkAccent.withOpacity(0.9),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Text(
                              "Select",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            )),
                          ),
                        ),
                      ]),
                    ),
                  );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
// Container(
//                     child: Column(
//                       children: [
//                         Container(
//                             height: 100,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 image: DecorationImage(
//                                     image:
//                                         NetworkImage(template[index].image)))),
//                         Container(
//                           height: 20,
//                           width: 70,
//                           decoration: BoxDecoration(
//                               color: Colors.pinkAccent.withOpacity(0.9),
//                               borderRadius: BorderRadius.circular(20)),
//                           child: Center(
//                               child: Text(
//                             "Select",
//                             style: TextStyle(
//                                 fontSize: 20, fontWeight: FontWeight.bold),
//                           )),
//                         ),
//                       ],
//                     ),
//                   );

  Stack selecteTemplate(BuildContext context, template) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(template.image))),
        ),
        Positioned.fill(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () {
                  var data = SelectedTemplate(
                    templateId: template.sId,
                    userId: widget.data.data.sId,
                  );
                  ApiService().selectTemplate(data).then(
                    (value) {
                      if (value.success == true) {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => Detail(widget.data)));
                      }
                    },
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.pinkAccent.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(20)),
                  height: 50,
                  width: 150,
                  child: Center(
                      child: Text(
                    "Select",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Drawer buildDrawer() {
    return Drawer(
        child: ListView(
      children: [
        DrawerHeader(
          child: Text("Peoples Connect"),
          decoration: BoxDecoration(color: Colors.blue),
        ),
      ],
    ));
  }
}
