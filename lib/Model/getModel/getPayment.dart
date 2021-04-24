class GetPayment {
  List<Companydetails> companydetails;
  bool success;
  String msg;

  GetPayment({this.companydetails, this.success, this.msg});

  GetPayment.fromJson(Map<String, dynamic> json) {
    if (json['companydetails'] != null) {
      companydetails = <Companydetails>[];
      json['companydetails'].forEach((v) {
        companydetails.add(new Companydetails.fromJson(v));
      });
    }
    success = json['success'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.companydetails != null) {
      data['companydetails'] =
          this.companydetails.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    data['msg'] = this.msg;
    return data;
  }
}

class Companydetails {
  String sId;
  String userId;
  String paytmNumber;
  String gpayNumber;
  String phonePay;
  String qrcode;
  Null holderName;
  String accountNo;
  String ifsc;
  String bankName;
  int iV;

  Companydetails(
      {this.sId,
      this.userId,
      this.paytmNumber,
      this.gpayNumber,
      this.phonePay,
      this.qrcode,
      this.holderName,
      this.accountNo,
      this.ifsc,
      this.bankName,
      this.iV});

  Companydetails.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    paytmNumber = json['paytmNumber'];
    gpayNumber = json['gpayNumber'];
    phonePay = json['phonePay'];
    qrcode = json['qrcode'];
    holderName = json['holderName'];
    accountNo = json['accountNo'];
    ifsc = json['ifsc'];
    bankName = json['bankName'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    data['paytmNumber'] = this.paytmNumber;
    data['gpayNumber'] = this.gpayNumber;
    data['phonePay'] = this.phonePay;
    data['qrcode'] = this.qrcode;
    data['holderName'] = this.holderName;
    data['accountNo'] = this.accountNo;
    data['ifsc'] = this.ifsc;
    data['bankName'] = this.bankName;
    data['__v'] = this.iV;
    return data;
  }
}