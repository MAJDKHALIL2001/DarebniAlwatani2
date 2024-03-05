class SubjectModel {
  String? name;
  String? uuid;

  SubjectModel({this.name, this.uuid});

  SubjectModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    uuid = json['uuid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['uuid'] = this.uuid;
    return data;
  }
}
