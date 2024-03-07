class SliderModel {
  List<Url>? url;
  String? title;
  String? description;
  int? id;
  String? position;

  SliderModel({this.url, this.title, this.description, this.id, this.position});

  SliderModel.fromJson(Map<String, dynamic> json) {
    if (json['url'] != null) {
      url = <Url>[];
      json['url'].forEach((v) {
        url!.add(new Url.fromJson(v));
      });
    }
    title = json['title'];
    description = json['description'];
    id = json['id'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.url != null) {
      data['url'] = this.url!.map((v) => v.toJson()).toList();
    }
    data['title'] = this.title;
    data['description'] = this.description;
    data['id'] = this.id;
    data['position'] = this.position;
    return data;
  }
}

class Url {
  String? url;

  Url({this.url});

  Url.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }
}
