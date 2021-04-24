import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vaibhav/Model/company.dart';
import 'package:vaibhav/Model/ecom.dart';
import 'package:vaibhav/Model/feedback.dart' as Feedback;
import 'package:vaibhav/Model/getModel/getCompany.dart';
import 'package:vaibhav/Model/getModel/getPayment.dart';
import 'package:vaibhav/Model/getModel/getProduct.dart';
import 'package:vaibhav/Model/getModel/getSelectedTemplate.dart';
import 'package:vaibhav/Model/getModel/getSocial.dart';
import 'package:vaibhav/Model/getTemplate.dart';
import 'package:vaibhav/Model/login.dart';
import 'package:vaibhav/Model/payment_model.dart';
import 'package:vaibhav/Model/selectTemplate.dart';
import 'package:vaibhav/Model/social.dart';
import 'package:vaibhav/Model/user.dart';
import 'package:vaibhav/Model/response.dart' as res;
// import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  Dio dio = new Dio();
  final datacount = GetStorage();
  var url = "https://peopleconnect21.herokuapp.com/api/v1";

// Create Company

  Future<res.Response> createCompany(Company company) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    //
    // var token = prefs.get('token');
    var token = datacount.read('token');
    res.Response data;
    try {
      var response = await dio.post(
        "https://peopleconnect21.herokuapp.com/api/v1/company/",
        data: {
          "userId": company.userId,
          "firstName": company.firstName,
          "logo": company.logo,
          "lastName": company.lastName,
          "position": company.position,
          "phone": company.phone,
          "whatsApp": company.whatsApp,
          "address": company.address,
          "email": company.email,
          "website": company.website,
          "location": company.location,
          "about": company.about,
          "establish": company.establish,
          "companyUrl": company.companyUrl,
          "companyName": company.companyName,
          "nature": company.nature,
          "specialities": company.specialities,
        },
        options: new Options(
            headers: {'Authorization': 'Bearer $token'},
            contentType: Headers.jsonContentType),
      );

      data = res.Response.fromJson(response.data);
    } on DioError catch (e) {
      print(e.message);
    }
    return data;
  }

//Create Social

  Future<res.Response> createSocial(Social social) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // var token = prefs.get('token');
    var token = datacount.read('token');

    res.Response data;

    try {
      var response = await dio.post(
        "$url/social/",
        data: {
          "youtubeVideo": social.youtubeVideo,
          "userId": social.userId,
          "facebook": social.facebook,
          "whatsApp": social.whatsApp,
          "twitter": social.twitter,
          "instagram": social.instagram,
          "linkdin": social.linkdin,
          "youtube": social.linkdin,
          "interest": social.interest,
        },
        options: new Options(
            headers: {'Authorization': 'Bearer $token'},
            contentType: Headers.jsonContentType),
      );

      if (response.statusCode == 200) {
        data = res.Response.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return data;
  }

// Payment Detail

  Future<res.Response> createPayment(PaymentDetail paymentDetail) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // var token = prefs.getString('token');
    var token = datacount.read('token');

    res.Response data;

    try {
      var response = await dio.post(
        "$url/payment/",
        data: {
          "userId": paymentDetail.userId,
          "paytmNumber": paymentDetail.paytmNumber,
          "gpayNumber": paymentDetail.gpayNumber,
          "phonePay": paymentDetail.phonePay,
          "qrcode": paymentDetail.qrcode,
          "holderName": paymentDetail.holderName,
          "accountNo": paymentDetail.accountNo,
          "ifsc": paymentDetail.ifsc,
          "bankName": paymentDetail.bankName
        },
        options: new Options(
            headers: {'Authorization': 'Bearer $token'},
            contentType: Headers.jsonContentType),
      );

      if (response.statusCode == 200) {
        data = res.Response.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return data;
  }

  //Upload Images

  Future<res.Response> uploadImages(String imgUrl, String userId) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // var token = prefs.getString('token');
    //
    var token = datacount.read('token');

    res.Response data;

    try {
      var response = await dio.post(
        "$url/images/$userId",
        data: {"images": imgUrl},
        options: new Options(
            headers: {'Authorization': 'Bearer $token'},
            contentType: Headers.jsonContentType),
      );

      if (response.statusCode == 201) {
        data = res.Response.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return data;
  }

// Enquiry Get
  Future<res.Response> getEnquiry(Feedback.Feedback data) async {
    res.Response data;
    try {
      var response = await dio.get("$url/company/");
      if (response.statusCode == 200) {
        data = res.Response.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return data;
  }

//  Get Company Detail
  Future<GetCompany> getCompanyDetail(String userId) async {
    GetCompany data;
    try {
      var response = await dio.get("$url/company/$userId");

      if (response.statusCode == 200) {
        data = GetCompany.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return data;
  }

  Future<GetPayment> getPaymentDetail(String userId) async {
    GetPayment data;
    try {
      var response = await dio.get("$url/payment/$userId");

      if (response.statusCode == 200) {
        data = GetPayment.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return data;
  }

  Future<GetSocial> getSocialDetail(String userId) async {
    GetSocial data;
    try {
      var response = await dio.get("$url/social/$userId");

      if (response.statusCode == 200) {
        data = GetSocial.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return data;
  }

  Future<GetProduct> getProductDetail(String userId) async {
    GetProduct data;
    try {
      var response = await dio.get("$url/ecommerce/$userId");

      if (response.statusCode == 200) {
        data = GetProduct.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return data;
  }

// Update Company Detail
  Future<res.Response> updateCompanyDetail(
      String userId, Company company) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // var token = prefs.get('token');
    var token = datacount.read('token');

    res.Response data;

    try {
      var response = await dio.put(
        "$url/company/$userId",
        data: {
          "firstName": company.firstName,
          "logo": company.logo,
          "lastName": company.lastName,
          "position": company.position,
          "phone": company.phone,
          "whatsApp": company.whatsApp,
          "address": company.address,
          "email": company.email,
          "website": company.website,
          "location": company.location,
          "about": company.about,
          "establish": company.establish,
          "companyUrl": company.companyUrl,
          "companyName": company.companyName,
          "nature": company.nature,
        },
        options: new Options(
            headers: {'Authorization': 'Bearer $token'},
            contentType: Headers.jsonContentType),
      );

      if (response.statusCode == 200) {
        data = res.Response.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return data;
  }

//Update Social Detail
  Future<res.Response> updateSocialDetail(String userId, Social social) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // var token = prefs.get('token');
    var token = datacount.read('token');

    res.Response data;

    try {
      var response = await dio.put(
        "$url/social/$userId",
        data: {
          "facebook": social.facebook,
          "whatsApp": social.whatsApp,
          "twitter": social.twitter,
          "instagram": social.instagram,
          "linkdin": social.linkdin,
          "interest": social.interest,
        },
        options: new Options(
            headers: {'Authorization': 'Bearer $token'},
            contentType: Headers.jsonContentType),
      );

      if (response.statusCode == 200) {
        data = res.Response.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return data;
  }

//Update Product Detail
  Future<res.Response> updateProductDetail(
      String productId, Service ecom) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // var token = prefs.get('token');
    var token = datacount.read('token');

    res.Response data;

    try {
      var response = await dio.put(
        "$url/ecommerce/$productId",
        data: {
          "productName": ecom.productName,
          "image": ecom.image,
          "mrp": ecom.mrp,
          "sellingPrice": ecom.sellingPrice,
        },
        options: new Options(
            headers: {'Authorization': 'Bearer $token'},
            contentType: Headers.jsonContentType),
      );

      if (response.statusCode == 200) {
        data = res.Response.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return data;
  }

//Update Payment Detail
  Future<res.Response> updatePaymentDetail(
      String userId, PaymentDetail paymentDetail) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // var token = prefs.get('token');

    var token = datacount.read('token');

    res.Response data;

    try {
      var response = await dio.put(
        "$url/payment/$userId",
        data: {
          "paytmNumber": paymentDetail.paytmNumber,
          "gpayNumber": paymentDetail.gpayNumber,
          "phonePay": paymentDetail.phonePay,
          "qrcode": paymentDetail.qrcode,
          "holderName": paymentDetail.holderName,
          "accountNo": paymentDetail.accountNo,
          "ifsc": paymentDetail.ifsc,
          "bankName": paymentDetail.bankName
        },
        options: new Options(
            headers: {'Authorization': 'Bearer $token'},
            contentType: Headers.jsonContentType),
      );

      if (response.statusCode == 200) {
        data = res.Response.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return data;
  }

//Seleted Template
  Future<res.Response> selectTemplate(SelectedTemplate template) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // var token = prefs.get('token');
    var token = datacount.read('token');

    res.Response data;

    try {
      var response = await dio.post(
        "$url/selectedTemplate/",
        data: {
          "userId": template.userId,
          "TemplateId": template.templateId,
        },
        options: new Options(
            headers: {'Authorization': 'Bearer $token'},
            contentType: Headers.jsonContentType),
      );

      if (response.statusCode == 200) {
        data = res.Response.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e.message);
    }

    return data;
  }

//Product/Service Create
  Future<res.Response> createService(Service ecom) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // var token = prefs.get('token');
    var token = datacount.read('token');

    res.Response data;

    try {
      var response = await dio.post(
        "$url/ecommerce/",
        data: {
          "userId": ecom.userId,
          "productName": ecom.productName,
          "image": ecom.image,
          "mrp": ecom.mrp,
          "sellingPrice": ecom.sellingPrice,
        },
        options: new Options(
            headers: {'Authorization': 'Bearer $token'},
            contentType: Headers.jsonContentType),
      );

      if (response.statusCode == 200) {
        data = res.Response.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e.message);
    }

    return data;
  }

//Create User
  Future<Login> createCustomer(
    name,
    email,
    password,
  ) async {
    Login data;
    try {
      var response = await dio.post("$url/user/register", data: {
        "name": name,
        "email": email,
        "password": password,
        "role": "user"
      });

      if (response.statusCode == 200) {
        data = Login.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return data;
  }

//Login User
  Future<Login> loginCustomer(email, password) async {
    Login data;
    try {
      var response = await dio.post(
        "$url/user/login",
        data: {
          "email": email,
          "password": password,
        },
        options: new Options(contentType: Headers.jsonContentType),
      );

      if (response.statusCode == 200) {
        data = Login.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return data;
  }

  Future<User> checkAuth({token}) async {
    User data;
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // var token = prefs.get('token');
    var token = datacount.read('token');

    try {
      var response = await dio.get(
        "$url/user/me",
        options: new Options(
            headers: {'Authorization': 'Bearer $token'},
            contentType: Headers.jsonContentType),
      );

      if (response.statusCode == 200) {
        data = User.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return data;
  }

  //Get Templates
  Future<GetTemplate> getTemplate() async {
    GetTemplate data;
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // var token = prefs.get('token');
    var token = datacount.read('token');

    try {
      var response = await dio.get(
        "$url/template",
        options: new Options(
            headers: {'Authorization': 'Bearer $token'},
            contentType: Headers.jsonContentType),
      );

      if (response.statusCode == 200) {
        data = GetTemplate.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return data;
  }

  //Get Selected Template
  Future<GetSelectedTemplate> getSelectedTemplate(String id) async {
    GetSelectedTemplate data;
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // var token = prefs.get('token');
    var token = datacount.read('token');

    try {
      var response = await dio.get(
        "$url/selectedTemplate/$id",
        options: new Options(
            headers: {'Authorization': 'Bearer $token'},
            contentType: Headers.jsonContentType),
      );

      if (response.statusCode == 200) {
        data = GetSelectedTemplate.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return data;
  }
}
