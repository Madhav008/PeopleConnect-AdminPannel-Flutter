import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vaibhav/apiServices.dart';
import 'package:vaibhav/home.dart';
// import 'package:vaibhav/homepage.dart';
import 'package:vaibhav/signup_page.dart';
import 'package:vaibhav/validator/Progress.aHUD.dart';
import 'package:vaibhav/validator/form_helper.dart';
import 'package:vaibhav/validator/signIn_validation.dart';
import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _togglevisibility = true;
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    final datacount = GetStorage(); 
    final signInValidator = Provider.of<SignInValidation>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: ProgressHUD(
        inAsyncCall: signInValidator.isApiCallProcess,
        opacity: 0.3,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffFC6011)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Add your detail to login",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                  ),
                ),
                Card(
                  elevation: 5,
                  shadowColor: Color(0xffFC6011),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          onChanged: (value) {
                            signInValidator.changeEmail(value);
                          },
                          decoration: InputDecoration(
                            errorText: signInValidator.email.error,
                            hintText: "Your Email or Username",
                            hintStyle: TextStyle(
                                color: Color(0xffbdc2cb), fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          onChanged: (value) {
                            signInValidator.changePassword(value);
                          },
                          decoration: InputDecoration(
                            errorText: signInValidator.password.error,
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _togglevisibility = !_togglevisibility;
                                });
                              },
                              icon: _togglevisibility
                                  ? Icon(
                                      Icons.visibility_off,
                                      color: Color(0xffbdc2cb),
                                    )
                                  : Icon(
                                      Icons.visibility,
                                      color: Colors.blueAccent,
                                    ),
                            ),
                            hintText: "Password",
                            hintStyle: TextStyle(
                                color: Color(0xffbdc2cb), fontSize: 18),
                          ),
                          obscureText: _togglevisibility,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgotten Password?",
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xffFC6011),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    signInValidator.setApiCall();
                    if (signInValidator.isValid != null) {
                      apiService
                          .loginCustomer(signInValidator.email.value,
                              signInValidator.password.value)
                          .then((ret) {
                        if (ret.token != null) {
                          datacount.write("token", ret.token);
                        //  SharedPreferences.getInstance().then(
                        //      (value) => value.setString('token', ret.token));

                          apiService.checkAuth(token: ret.token).then((user) {
                            signInValidator.setApiCall();

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Home(user),
                                ));
                          });
                        } else {
                          FormHelper.showMessage(context, "People Connect ",
                              "Email Id/Password not valid", "OK", () {
                            Navigator.pop(context);
                          });
                        }
                      });
                    }
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0xffFC6011),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: 20,
                  color: Colors.white,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Don't have an account",
                      style: TextStyle(
                          color: Color(0xffbdc2cb),
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      SignUpPage()));
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Color(0xffFC6011),
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
