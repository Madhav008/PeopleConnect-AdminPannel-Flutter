class GetSelectedTemplate {
  GetSelectedTemplate({
    this.selectedTemplates,
    this.success,
    this.msg,
  });

  List<SelectedTemplateElement> selectedTemplates;
  bool success;
  String msg;

  factory GetSelectedTemplate.fromJson(Map<String, dynamic> json) =>
      GetSelectedTemplate(
        selectedTemplates: List<SelectedTemplateElement>.from(
            json["SelectedTemplates"]
                .map((x) => SelectedTemplateElement.fromJson(x))),
        success: json["success"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "SelectedTemplates":
            List<dynamic>.from(selectedTemplates.map((x) => x.toJson())),
        "success": success,
        "msg": msg,
      };
}

class SelectedTemplateElement {
  SelectedTemplateElement({
    this.id,
    this.userId,
    this.templateId,
    this.v,
  });

  String id;
  String userId;
  String templateId;
  int v;

  factory SelectedTemplateElement.fromJson(Map<String, dynamic> json) =>
      SelectedTemplateElement(
        id: json["_id"],
        userId: json["userId"],
        templateId: json["TemplateId"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "TemplateId": templateId,
        "__v": v,
      };
}
