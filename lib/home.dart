import 'package:flutter/material.dart';
import 'package:vaibhav/Edit/company_edit.dart';
import 'package:vaibhav/Edit/payment_edit.dart';
import 'package:vaibhav/Edit/product_edit.dart';
import 'package:vaibhav/Edit/social_edit.dart';
import 'package:vaibhav/Products.dart';
import 'package:vaibhav/SocialDetails.dart';
import 'package:vaibhav/Model/user.dart';
import 'package:vaibhav/apiServices.dart';
import 'package:vaibhav/details.dart';
import 'package:vaibhav/images.dart';
import 'package:vaibhav/payment.dart';
import 'package:vaibhav/template.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  User data;
  Home(this.data);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome To PeopleConnect AdminPaflutnnel"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          "Please Fill All the Details Carefully",
                          style: TextStyle(fontSize: 19),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 75,
                          width: 75,
                          decoration: BoxDecoration(
                              // color: Colors.green,
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/Images/feature1.jpg"),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(25)),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      child: Text(
                        "${data.data.name}",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Templates(data),
                            )),
                        child: Container(
                          height: 120,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2)),
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Step 1"),
                              SizedBox(
                                height: 10,
                              ),
                              Icon(
                                Icons.home,
                                size: 30,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Select Template")
                            ],
                          )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Detail(data),
                            )),
                        child: Container(
                          height: 120,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2)),
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Step 2"),
                              SizedBox(
                                height: 10,
                              ),
                              Icon(
                                Icons.home,
                                size: 30,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Create Company")
                            ],
                          )),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SocialDetails(data),
                            )),
                        child: Container(
                          height: 120,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2)),
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Step 3"),
                              SizedBox(
                                height: 10,
                              ),
                              Icon(
                                Icons.home,
                                size: 30,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Create Social")
                            ],
                          )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Payment(data),
                            )),
                        child: Container(
                          height: 120,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2)),
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Step 4"),
                              SizedBox(
                                height: 10,
                              ),
                              Icon(
                                Icons.home,
                                size: 30,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Create Payment Detail")
                            ],
                          )),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SelectImages(data),
                            )),
                        child: Container(
                          height: 120,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2)),
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Step 5"),
                              SizedBox(
                                height: 10,
                              ),
                              Icon(
                                Icons.home,
                                size: 30,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Upload Image Detail")
                            ],
                          )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Products(data),
                            )),
                        child: Container(
                          height: 120,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2)),
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Step 6"),
                              SizedBox(
                                height: 10,
                              ),
                              Icon(
                                Icons.home,
                                size: 30,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Add Your Product")
                            ],
                          )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "View The Details",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditSocial(data),
                            )),
                        child: Container(
                          height: 120,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2)),
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("View "),
                              SizedBox(
                                height: 10,
                              ),
                              Icon(
                                Icons.home,
                                size: 30,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(" Social Detail ")
                            ],
                          )),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditCompany(data),
                          ),
                        ),
                        child: Container(
                          height: 120,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2)),
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("View"),
                              SizedBox(
                                height: 10,
                              ),
                              Icon(
                                Icons.home,
                                size: 30,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Company Detail")
                            ],
                          )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditPayment(data),
                            )),
                        child: Container(
                          height: 120,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2)),
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("View "),
                              SizedBox(
                                height: 10,
                              ),
                              Icon(
                                Icons.home,
                                size: 30,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(" Payment Detail ")
                            ],
                          )),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProduct(data),
                          ),
                        ),
                        child: Container(
                          height: 120,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2)),
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("View"),
                              SizedBox(
                                height: 10,
                              ),
                              Icon(
                                Icons.home,
                                size: 30,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Product Detail")
                            ],
                          )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
