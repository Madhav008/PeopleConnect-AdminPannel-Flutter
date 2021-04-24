class Company {
  String userId;
  String firstName;
  String logo;
  String lastName;
  String position;
  int phone;
  int whatsApp;
  String address;
  String email;
  String website;
  String location;
  String about;
  String establish;
  String companyUrl;
  String companyName;
  String nature;
  List<String> specialities;

  Company(
      {
      this.userId,
      this.firstName,
      this.logo,
      this.lastName,
      this.position,
      this.phone,
      this.whatsApp,
      this.address,
      this.email,
      this.website,
      this.location,
      this.about,
      this.establish,
      this.companyUrl,
      this.companyName,
      this.nature,
      this.specialities,
     });

  Company.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    firstName = json['firstName'];
    logo = json['logo'];
    lastName = json['lastName'];
    position = json['position'];
    phone = json['phone'];
    whatsApp = json['whatsApp'];
    address = json['address'];
    email = json['email'];
    website = json['website'];
    location = json['location'];
    about = json['about'];
    establish = json['establish'];
    companyUrl = json['companyUrl'];
    companyName = json['companyName'];
    nature = json['nature'];
    specialities = json['specialities'].cast<String>();

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['firstName'] = this.firstName;
    data['logo'] = this.logo;
    data['lastName'] = this.lastName;
    data['position'] = this.position;
    data['phone'] = this.phone;
    data['whatsApp'] = this.whatsApp;
    data['address'] = this.address;
    data['email'] = this.email;
    data['website'] = this.website;
    data['location'] = this.location;
    data['about'] = this.about;
    data['establish'] = this.establish;
    data['companyUrl'] = this.companyUrl;
    data['companyName'] = this.companyName;
    data['nature']=this.nature;
    data['specialities']=this.specialities;
    return data;
  }
}