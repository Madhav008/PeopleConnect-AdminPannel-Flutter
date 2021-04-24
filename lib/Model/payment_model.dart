class PaymentDetail {
  String userId;
  String paytmNumber;
  String gpayNumber;
  String phonePay;
  String qrcode;
  String holderName;
  String accountNo;
  String ifsc;
  String bankName;

  PaymentDetail(
      {this.userId,
      this.paytmNumber,
      this.gpayNumber,
      this.phonePay,
      this.qrcode,
      this.holderName,
      this.accountNo,
      this.ifsc,
      this.bankName});

  PaymentDetail.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    paytmNumber = json['paytmNumber'];
    gpayNumber = json['gpayNumber'];
    phonePay = json['phonePay'];
    qrcode = json['qrcode'];
    holderName = json['holderName'];
    accountNo = json['accountNo'];
    ifsc = json['ifsc'];
    bankName = json['bankName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['paytmNumber'] = this.paytmNumber;
    data['gpayNumber'] = this.gpayNumber;
    data['phonePay'] = this.phonePay;
    data['qrcode'] = this.qrcode;
    data['holderName'] = this.holderName;
    data['accountNo'] = this.accountNo;
    data['ifsc'] = this.ifsc;
    data['bankName'] = this.bankName;
    return data;
  }
}