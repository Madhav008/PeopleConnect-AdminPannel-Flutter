class Service {
  String userId;
  String productName;
  String image;
  String mrp;
  String sellingPrice;
  String description;

  Service(
      {this.userId, this.productName, this.image, this.mrp, this.sellingPrice,this.description});

  Service.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    productName = json['productName'];
    image = json['image'];
    mrp = json['mrp'];
    sellingPrice = json['sellingPrice'];
    description= json['descrioption'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['productName'] = this.productName;
    data['image'] = this.image;
    data['mrp'] = this.mrp;
    data['sellingPrice'] = this.sellingPrice;
    data['description'] = this.description;
    return data;
  }
}

