class Template {
  String image;
  String name;
  String html;

  Template({this.image, this.name, this.html});

  Template.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    html = json['html'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['name'] = this.name;
    data['html'] = this.html;
    return data;
  }
}