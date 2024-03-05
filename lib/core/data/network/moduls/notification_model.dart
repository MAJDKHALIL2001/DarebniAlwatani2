// class NotifictionModel {
//   String? body;
//   String? title;
//   // String? text;
//   // int? productId;

//   NotifictionModel({
//     // this.notifctionType,
//     this.title,
//     this.body,
//     // this.productId
//   });

//   NotifictionModel.fromJson(Map<String, dynamic> json) {
//     //  = json['notifction_type'];
//     title = json['title'];
//     body = json['body'];
//     // productId = json['product_id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['body'] = this.body;
//     data['title'] = this.title;

//     return data;
//   }
// }
class NotifictionModel {
  String? body;
  String? title;
  String? createdAt;

  NotifictionModel({this.body, this.title, this.createdAt});

  NotifictionModel.fromJson(Map<String, dynamic> json) {
    body = json['body'];
    title = json['title'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['body'] = this.body;
    data['title'] = this.title;
    data['created_at'] = this.createdAt;
    return data;
  }
}
