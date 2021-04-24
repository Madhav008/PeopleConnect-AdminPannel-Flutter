class SelectedTemplate {
  String userId;
  String templateId;

  SelectedTemplate({this.userId, this.templateId});

  SelectedTemplate.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    templateId = json['TemplateId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['TemplateId'] = this.templateId;
    return data;
  }
}