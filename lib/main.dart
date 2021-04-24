import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaibhav/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vaibhav/Model/user.dart';
import 'package:vaibhav/provider/image_provider.dart';
import 'package:vaibhav/apiServices.dart';
import 'package:vaibhav/signin_page.dart';
import 'package:vaibhav/validator/signIn_validation.dart';
import 'package:vaibhav/validator/signup_validation.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  // SharedPreferences.setMockInitialValues({});
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          
          ChangeNotifierProvider(
            create: (context) => SignInValidation(),
          ),
          ChangeNotifierProvider(
            create: (context) => SignUpValidation(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primaryColor: Colors.red),
          home: FutureBuilder<User>(
            future: ApiService().checkAuth(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                User userData = snapshot.data;
                return (snapshot.hasData && snapshot.data != null)
                    ? FutureBuilder(
                        future: ApiService()
                            .getCompanyDetail(snapshot.data.data.sId),
                        builder: (context, copnyData) => (copnyData != null)
                            ? Home(userData)
                            : Home(userData))
                    : SignInPage();
              } else {
                return Scaffold();
              }
            },
          ),
        ));
  }
}
