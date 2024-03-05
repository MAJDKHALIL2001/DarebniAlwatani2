class ExamModel {
  String? examUuid;
  String? name;

  ExamModel({this.examUuid, this.name});

  ExamModel.fromJson(Map<String, dynamic> json) {
    examUuid = json['exam_uuid'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['exam_uuid'] = this.examUuid;
    data['name'] = this.name;
    return data;
  }
}
