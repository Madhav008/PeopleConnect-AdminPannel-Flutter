class Contact {
  String name;
  String mobile;
  String email;
  String message;
  String companyId;

  Contact({this.name, this.mobile, this.email, this.message, this.companyId});

  Contact.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    message = json['message'];
    companyId = json['companyId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['message'] = this.message;
    data['companyId'] = this.companyId;
    return data;
  }
}