class GetProduct {
  List<Companydetails> companydetails;
  bool success;
  String msg;

  GetProduct({this.companydetails, this.success, this.msg});

  GetProduct.fromJson(Map<String, dynamic> json) {
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
  String productName;
  String image;
  String mrp;
  int iV;
  String description;
  String sellingPrice;

  Companydetails(
      {this.sId,
      this.userId,
      this.productName,
      this.image,
      this.mrp,
      this.iV,
      this.description,
      this.sellingPrice});

  Companydetails.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    productName = json['productName'];
    image = json['image'];
    mrp = json['mrp'];
    iV = json['__v'];
    description = json['description'];
    sellingPrice = json['sellingPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    data['productName'] = this.productName;
    data['image'] = this.image;
    data['mrp'] = this.mrp;
    data['__v'] = this.iV;
    data['description'] = this.description;
    data['sellingPrice'] = this.sellingPrice;
    return data;
  }
}