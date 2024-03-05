class TokenModel {
  String? token;
  String? code;

  TokenModel({this.token, this.code});

  TokenModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['code'] = this.code;
    return data;
  }
}
