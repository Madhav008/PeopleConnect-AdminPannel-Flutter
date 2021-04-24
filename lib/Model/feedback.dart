class Feedback {
  String companyId;
  String name;
  String feedback;
  String star;
  String date;

  Feedback({this.companyId, this.name, this.feedback, this.star, this.date});

  Feedback.fromJson(Map<String, dynamic> json) {
    companyId = json['companyId'];
    name = json['name'];
    feedback = json['feedback'];
    star = json['star'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['companyId'] = this.companyId;
    data['name'] = this.name;
    data['feedback'] = this.feedback;
    data['star'] = this.star;
    data['date'] = this.date;
    return data;
  }
}