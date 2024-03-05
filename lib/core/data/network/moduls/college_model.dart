class CollegeModel {
  String? collegeUuid;
  String? type;
  String? image;
  String? name;

  CollegeModel({this.collegeUuid, this.type, this.image, this.name});

  CollegeModel.fromJson(Map<String, dynamic> json) {
    collegeUuid = json['college_uuid'];
    type = json['type'];
    image = json['image'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['college_uuid'] = this.collegeUuid;
    data['type'] = this.type;
    data['image'] = this.image;
    data['name'] = this.name;
    return data;
  }
}
